#ifndef out_arm_core_include_generated_asm_defines_h
#define out_arm_core_include_generated_asm_defines_h
#define THREAD_SMC_ARGS_X0	0	/* offsetof(struct thread_smc_args, a0)	*/
#define THREAD_SMC_ARGS_SIZE	64	/* sizeof(struct thread_smc_args)	*/
#define THREAD_SVC_REG_X0	16	/* offsetof(struct thread_svc_regs, x0)	*/
#define THREAD_SVC_REG_X5	56	/* offsetof(struct thread_svc_regs, x5)	*/
#define THREAD_SVC_REG_X6	64	/* offsetof(struct thread_svc_regs, x6)	*/
#define THREAD_SVC_REG_X30	136	/* offsetof(struct thread_svc_regs, x30)	*/
#define THREAD_SVC_REG_ELR	0	/* offsetof(struct thread_svc_regs, elr)	*/
#define THREAD_SVC_REG_SPSR	8	/* offsetof(struct thread_svc_regs, spsr)	*/
#define THREAD_SVC_REG_SP_EL0	144	/* offsetof(struct thread_svc_regs, sp_el0)	*/
#define THREAD_SVC_REG_SIZE	160	/* sizeof(struct thread_svc_regs)	*/
#define THREAD_ABT_REG_X0	0	/* offsetof(struct thread_abort_regs, x0)	*/
#define THREAD_ABT_REG_X2	16	/* offsetof(struct thread_abort_regs, x2)	*/
#define THREAD_ABT_REG_X30	240	/* offsetof(struct thread_abort_regs, x30)	*/
#define THREAD_ABT_REG_SPSR	256	/* offsetof(struct thread_abort_regs, spsr)	*/
#define THREAD_ABT_REGS_SIZE	272	/* sizeof(struct thread_abort_regs)	*/
#define THREAD_CTX_KERN_SP	320	/* offsetof(struct thread_ctx, kern_sp)	*/
#define THREAD_CTX_SIZE	1536	/* sizeof(struct thread_ctx)	*/
#define THREAD_CTX_REGS_SP	0	/* offsetof(struct thread_ctx_regs, sp)	*/
#define THREAD_CTX_REGS_X0	24	/* offsetof(struct thread_ctx_regs, x[0])	*/
#define THREAD_CTX_REGS_X1	32	/* offsetof(struct thread_ctx_regs, x[1])	*/
#define THREAD_CTX_REGS_X4	56	/* offsetof(struct thread_ctx_regs, x[4])	*/
#define THREAD_CTX_REGS_X19	176	/* offsetof(struct thread_ctx_regs, x[19])	*/
#define THREAD_USER_MODE_REC_EXIT_STATUS0_PTR	0	/* offsetof(struct thread_user_mode_rec, exit_status0_ptr)	*/
#define THREAD_USER_MODE_REC_X19	16	/* offsetof(struct thread_user_mode_rec, x[0])	*/
#define THREAD_USER_MODE_REC_SIZE	112	/* sizeof(struct thread_user_mode_rec)	*/
#define THREAD_CORE_LOCAL_TMP_STACK_VA_END	0	/* offsetof(struct thread_core_local, tmp_stack_va_end)	*/
#define THREAD_CORE_LOCAL_CURR_THREAD	8	/* offsetof(struct thread_core_local, curr_thread)	*/
#define THREAD_CORE_LOCAL_FLAGS	12	/* offsetof(struct thread_core_local, flags)	*/
#define THREAD_CORE_LOCAL_ABT_STACK_VA_END	16	/* offsetof(struct thread_core_local, abt_stack_va_end)	*/
#define THREAD_CORE_LOCAL_X0	24	/* offsetof(struct thread_core_local, x[0])	*/
#define THREAD_CORE_LOCAL_X2	40	/* offsetof(struct thread_core_local, x[2])	*/
#define USER_REGS_SP	0	/* offsetof(struct proc, user_regs.sp)	*/
#define USER_REGS_SPSR	16	/* offsetof(struct proc, user_regs.spsr)	*/
#define USER_REGS_PC	8	/* offsetof(struct proc, user_regs.pc)	*/
#define USER_REGS_X0	24	/* offsetof(struct proc, user_regs.x[0])	*/
#define USER_REGS_X1	32	/* offsetof(struct proc, user_regs.x[1])	*/
#define USER_REGS_X4	56	/* offsetof(struct proc, user_regs.x[4])	*/
#define USER_REGS_X30	264	/* offsetof(struct proc, user_regs.x[30])	*/
#define PCB_REGS_SP	0	/* offsetof(struct pcb_regs, sp)	*/
#define PCB_REGS_PC	8	/* offsetof(struct pcb_regs, pc)	*/
#define PCB_REGS_SPSR	16	/* offsetof(struct pcb_regs, spsr)	*/
#define PCB_REGS_X0	24	/* offsetof(struct pcb_regs, x[0])	*/
#define PCB_REGS_X1	32	/* offsetof(struct pcb_regs, x[1])	*/
#define PCB_REGS_X3	48	/* offsetof(struct pcb_regs, x[3])	*/
#define PCB_REGS_X4	56	/* offsetof(struct pcb_regs, x[4])	*/
#define PCB_REGS_X30	264	/* offsetof(struct pcb_regs, x[30])	*/
#define PROC_INTR_REGS	272	/* offsetof(struct proc, intr_regs)	*/
#define PROC_SIZE	384	/* sizeof(struct proc)	*/
#define PROC_KSTACK	280	/* offsetof(struct proc, k_stack)	*/
#define CPU_LOCAL_X0	16	/* offsetof(struct cpu_local, x[0])	*/
#define CPU_LOCAL_CUR_PROC	8	/* offsetof(struct cpu_local, cur_proc)	*/
#define CPU_LOCAL_TMP_STACK	0	/* offsetof(struct cpu_local, tmp_stack)	*/
#endif
