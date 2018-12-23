/*
	rex_do 2018-12-8
*/
#include <kernel/proc.h>
#include <kernel/thread.h>
#include <trace.h>
#include <mm/core_mmu.h>
#include <kernel/spinlock.h>
#include <kernel/panic.h>
#include "thread_private.h"
#include <kernel/cache_helpers.h>

#ifdef ARM32
#define STACK_THREAD_SIZE	8192

#endif /*ARM32*/

#ifdef ARM64
#define STACK_THREAD_SIZE	8192

#endif /*ARM64*/

#ifdef CFG_WITH_STACK_CANARIES
#ifdef ARM32
#define STACK_CANARY_SIZE	(4 * sizeof(uint32_t))
#endif
#ifdef ARM64
#define STACK_CANARY_SIZE	(8 * sizeof(uint32_t))
#endif
#define START_CANARY_VALUE	0xdededede
#define END_CANARY_VALUE	0xabababab
#define GET_START_CANARY(name, stack_num) name[stack_num][0]
#define GET_END_CANARY(name, stack_num) \
	name[stack_num][sizeof(name[stack_num]) / sizeof(uint32_t) - 1]
#else
#define STACK_CANARY_SIZE	0
#endif

#define DECLARE_STACK(name, num_stacks, stack_size, linkage) \
linkage uint32_t name[num_stacks] \
		[ROUNDUP(stack_size + STACK_CANARY_SIZE, STACK_ALIGNMENT) / \
		sizeof(uint32_t)] \
		__attribute__((section(".nozi_stack"), \
			       aligned(STACK_ALIGNMENT)))

#define STACK_SIZE(stack) (sizeof(stack) - STACK_CANARY_SIZE / 2)

#define GET_STACK(stack) \
	((vaddr_t)(stack) + STACK_SIZE(stack))

DECLARE_STACK(stack_proc, NUM_PROCS, STACK_THREAD_SIZE, static);

struct proc procs[NUM_PROCS];

struct list_head run_queues[NUM_PRIO];

static unsigned int proc_global_lock = SPINLOCK_UNLOCK;

uint32_t migrate_pid;
bool found_mp;


static void lock_global(void)
{
	cpu_spin_lock(&proc_global_lock);
}

static void unlock_global(void)
{
	cpu_spin_unlock(&proc_global_lock);
}


static void init_canaries(void)
{
#ifdef CFG_WITH_STACK_CANARIES
	size_t n;
#define INIT_CANARY(name)						\
	for (n = 0; n < ARRAY_SIZE(name); n++) {			\
		uint32_t *start_canary = &GET_START_CANARY(name, n);	\
		uint32_t *end_canary = &GET_END_CANARY(name, n);	\
									\
		*start_canary = START_CANARY_VALUE;			\
		*end_canary = END_CANARY_VALUE;				\
		DMSG("#Stack canaries for %s[%zu] with top at %p\n",	\
			#name, n, (void *)(end_canary - 1));		\
		DMSG("watch *%p\n", (void *)end_canary);		\
	}

#ifndef CFG_WITH_PAGER
	INIT_CANARY(stack_proc);
#endif
#endif
}

#define CANARY_DIED(stack, loc, n) \
	do { \
		EMSG_RAW("Dead canary at %s of '%s[%zu]'", #loc, #stack, n); \
		panic(); \
	} while (0)

void proc_check_canaries(void)
{
#ifdef CFG_WITH_STACK_CANARIES
	size_t n;

	for (n = 0; n < ARRAY_SIZE(stack_proc); n++) {
                if (GET_START_CANARY(stack_proc, n) != START_CANARY_VALUE)
                        CANARY_DIED(stack_proc, start, n);
                if (GET_END_CANARY(stack_proc, n) != END_CANARY_VALUE)
                        CANARY_DIED(stack_proc, end, n);
        }

#endif/*CFG_WITH_STACK_CANARIES*/
}
static void init_proc(void)
{
	int i;
	for(i = 0; i < NUM_PROCS; i++) 
	{
		procs[i].k_stack = GET_STACK(stack_proc[i]) - sizeof(struct pcb_regs);
		procs[i].intr_regs = (void*)procs[i].k_stack;
		procs[i].endpoint = -1;
		SLIST_INIT(&procs[i].pgt_cache);
	}
	for(i = 0; i < NUM_PRIO; i++)
	{
		struct list_head *tp = &run_queues[i];
		run_queues[i].next = tp;
		run_queues[i].prev = tp;
	}	
}

static int proc_alloc(void *ta)
{
	size_t i;
	bool found_proc = false;
	struct proc* proc;
	uint32_t spsr = SPSR_64(SPSR_64_MODE_EL1, SPSR_64_MODE_SP_EL0, 0);
	spsr |= read_daif();

	lock_global();

	for (i = 0; i < NUM_PROCS; i++) 
	{
		if (procs[i].endpoint == -1) 
		{
			procs[i].endpoint = i;
			found_proc = true;
			break;
		}
	}

	unlock_global();

	if (!found_proc) {
		DMSG("no proc can be used!\n");
		return -1;
	}

	proc = &procs[i];
	proc->user_regs.pc = (uint64_t)proc_load_entry;

	proc->user_regs.spsr = SPSR_64(SPSR_64_MODE_EL1, SPSR_64_MODE_SP_EL0,
				THREAD_EXCP_FOREIGN_INTR | DAIFBIT_ABT);

	proc->user_regs.sp = proc->k_stack;
	proc->prio = 4;
	proc->flags = 0;	
	proc->rt_quota = 1024;
	proc->user_regs.x[0] = (uint64_t)ta;
	proc->user_regs.x[1] = (uint64_t)i;
	proc->user_regs.x[29] = 0;
	
	return call_resume(&procs[i].user_regs, spsr);
}

void proc_clr_init(void)
{
	init_canaries();
	init_proc();
}

void proc_schedule(void) 
{
	struct cpu_local *cpu = get_tee_cpu();
	struct core_mmu_user_map map = { 0 };
	struct proc *proc = NULL;
	struct list_head* lh;
	int i;
	cpu->cur_proc = -1;
	for(i = 0; i < NUM_PRIO; i++) 
	{
		lh = &run_queues[i]; 
		if(lh->next != lh) 
		{
			proc = container_of(lh->next, struct proc, link);
			lh->next = lh->next->next;
			lh->next->prev = lh;
			break;
		}
	}
	
	if(proc == NULL)
	{
		DMSG("no proc to run, cpu is going to idle\n");
		return;
	}
	
	assert(proc->endpoint >= 0);
	cpu->cur_proc = proc->endpoint;
	map.user_map = proc->map;
	core_mmu_set_user_map(&map);
	if(proc->flags & P_INTR)
	{
		proc->flags &= ~(uint32_t)(P_INTR);
		proc_resume(proc->intr_regs);
	}
	else
	{
		proc_resume(&(proc->user_regs));

	}

}

struct proc *get_cur_proc(void)
{
	struct cpu_local *cpu = get_tee_cpu();
	int cur = cpu->cur_proc;
	if(cur >= 0 && cur < NUM_PROCS && procs[cur].endpoint == cur)
	{
		return &procs[cur];
	}
	return NULL;
}

// insert tail
int enqueue(struct proc* p) 
{
	struct list_head *lh;
	struct list_head *lp;

	lh = &run_queues[p->prio];
	lp = &p->link;
	lp->prev = lh->prev;
	lp->next = lh;
	lh->prev->next = lp;
	lh->prev = lp; 
	return 0;
}

int enqueue_head(struct proc* p) 
{
    struct list_head *lh;
    struct list_head *lp;
    lh = &run_queues[p->prio];
    lp = &p->link;
    lp->next = lh->next;
    lp->next->prev = lp;
    lp->prev = lh;
    lh->next = lp;
    return 0;
}
void run(void)
{
	
	int res;
	res = proc_alloc((void*)0x6100000ul);
        if(res != 0)
        {
                DMSG("proc_alloc error!\n");
        }
             
        res = proc_alloc((void*)0x61216c4ul);
        if(res != 0)
        {
                DMSG("proc_alloc error!\n");
        }
}

void rex_debug(uint64_t address)
{
	DMSG("rex debug 0x%lx\n", address);
}

struct proc *alloc_migrate_proc(void)
{
	uint32_t i;
	uint32_t daif = read_daif();
	
	write_daif(daif | THREAD_EXCP_FOREIGN_INTR << DAIF_F_SHIFT);
	lock_global();
	found_mp = false;
        for (i = 0; i < NUM_PROCS; i++)
        {
                if (procs[i].endpoint == -1)
                {
                        procs[i].endpoint = i;
                        migrate_pid = i;
			found_mp = true;
			break;
                }
        }
        unlock_global();
	write_daif(daif);
	if(i >= NUM_PROCS)
	{
		return NULL;
	}
	return &procs[i];
}

