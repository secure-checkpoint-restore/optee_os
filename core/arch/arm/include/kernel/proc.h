/*
	rex_do 2018-12-8
*/
#ifndef KERNEL_PROC_H
#define KERNEL_PROC_H

#include <arm.h>
#include <types_ext.h>
#include <list.h>
#include <mm/pgt_cache.h>
#include <mm/tee_mmu_types.h>

#define NUM_PROCS 	16
#define NUM_PRIO 	8

#define P_INTR		1 << 0

extern bool found_mp;
extern uint32_t migrate_pid;

struct cpu_local {
	vaddr_t tmp_stack;
	int cur_proc;
	uint64_t x[4];
};

struct pcb_regs {
    uint64_t sp;
    uint64_t pc;
    uint64_t spsr;
    uint64_t x[31];
};

struct proc {
    struct pcb_regs user_regs;
    struct pcb_regs *intr_regs;
    uint64_t k_stack;
    struct pgt_cache pgt_cache;
    struct list_head link;
    uint32_t prio; /* current process priority */
    int endpoint;
    struct run_info run_info;
    uint64_t map;
    uint32_t flags;
    uint64_t rt_quota;
} __aligned(16);

void proc_clr_init(void);

void proc_schedule(void);

struct proc *get_cur_proc(void);

int enqueue(struct proc *p);

int enqueue_head(struct proc* p);

void rex_debug(uint64_t address);

void run(void);

void save_migrate_context(struct proc *proc);

void switch_migrate_stack(void);

struct proc *alloc_migrate_proc(void);
#endif
