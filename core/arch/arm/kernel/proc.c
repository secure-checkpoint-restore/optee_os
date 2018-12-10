/*
	rex_do 2018-12-8
*/
#include <kernel/proc.h>
#include <kernel/thread.h>
#include <trace.h>
#include <mm/core_mmu.h>
#include <kernel/spinlock.h>

#include "thread_private.h"

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
#endif/*CFG_WITH_STACK_CANARIES*/
}

static void init_proc(void)
{
	int i;
	for(i = 0; i < NUM_PROCS; i++) 
	{
		procs[i].k_stack = GET_STACK(stack_proc[i]);
		procs[i].uregs = (void*)(procs[i].k_stack - sizeof(struct pcb_regs));
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
	proc->regs.pc = (uint64_t)proc_load_entry;

	/*
	 * Stdcalls starts in SVC mode with masked foreign interrupts, masked
	 * Asynchronous abort and unmasked native interrupts.
	 */
	proc->regs.spsr = SPSR_64(SPSR_64_MODE_EL1, SPSR_64_MODE_SP_EL0,
				THREAD_EXCP_FOREIGN_INTR | DAIFBIT_ABT);

	/* Reinitialize stack pointer */
	proc->regs.sp = proc->k_stack;
	proc->prio = 4;
	/*
	 * Copy arguments into context. This will make the
	 * arguments appear in x0-x7 when thread is started.
	 */
	proc->regs.x[0] = (uint64_t)ta;
	proc->regs.x[1] = (uint64_t)i;
	/* Set up frame pointer as per the Aarch64 AAPCS */
	proc->regs.x[29] = 0;
	
	return call_resume(&procs[i].regs, spsr);
}
 
void proc_clr_boot(void)
{
	int res;
	init_tee_cpu();
	init_canaries();
	init_proc();
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
	DMSG("finish\n");

}


