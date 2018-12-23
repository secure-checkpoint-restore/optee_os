/*
	rex_do 2018-12-12
*/
#include <arm64.h>
#include <arm64_macros.S>
#include <asm-defines.h>
#include <asm.S>
#include <keep.h>
#include "thread_private.h"

	.macro get_proc cpu_local, res, tmp0, tmp1
		ldr	w\tmp0, [\cpu_local, \
				#CPU_LOCAL_CUR_PROC]
		adr	x\res, procs 
		mov	x\tmp1, #PROC_SIZE
		madd	x\res, x\tmp0, x\tmp1, x\res
	.endm


FUNC proc_init_vbar , :
	adr	x0, proc_vect_table
	msr	vbar_el1, x0
	ret
END_FUNC proc_init_vbar

KEEP_PAGER proc_init_vbar

/*
	 * This macro verifies that the a given vector doesn't exceed the
	 * architectural limit of 32 instructions. This is meant to be placed
	 * immedately after the last instruction in the vector. It takes the
	 * vector entry as the parameter
	 */
	.macro check_vector_size since
	  .if (. - \since) > (32 * 4)
	    .error "Vector exceeds 32 instructions"
	  .endif
	.endm

	.align	11
LOCAL_FUNC proc_vect_table , :
	/* -----------------------------------------------------
	 * EL1 with SP0 : 0x0 - 0x180
	 * -----------------------------------------------------
	 */
	.align	7
sync_el1_sp0:
	store_xregs sp, CPU_LOCAL_X0, 0, 3
	bl      rex_debug
	mov     x0, #1
        bl      rex_debug
	mrs 	x0, elr_el1
	bl	rex_debug
	mrs 	x0, sp_el0
	bl	rex_debug
	mrs	x0, esr_el1
	bl 	rex_debug
	mrs	x0, far_el1
	bl	rex_debug
	b	el1_sync_abort
	check_vector_size sync_el1_sp0

	.align	7
irq_el1_sp0:
	b	irq_el1_sp0
	check_vector_size irq_el1_sp0

	.align	7
fiq_el1_sp0:
	store_xregs sp, CPU_LOCAL_X0, 0, 3
	b	elx_fiq
	check_vector_size fiq_el1_sp0

	.align	7
SErrorSP0:
	b	SErrorSP0
	check_vector_size SErrorSP0

	/* -----------------------------------------------------
	 * Current EL with SPx: 0x200 - 0x380
	 * -----------------------------------------------------
	 */
	.align	7
SynchronousExceptionSPx:
	b	SynchronousExceptionSPx
	check_vector_size SynchronousExceptionSPx

	.align	7
IrqSPx:
	b	IrqSPx
	check_vector_size IrqSPx

	.align	7
FiqSPx:
	b	FiqSPx
	check_vector_size FiqSPx

	.align	7
SErrorSPx:
	b	SErrorSPx
	check_vector_size SErrorSPx

	/* -----------------------------------------------------
	 * Lower EL using AArch64 : 0x400 - 0x580
	 * -----------------------------------------------------
	 */
	.align	7
el0_sync_a64:
	store_xregs sp, CPU_LOCAL_X0, 0, 3

	mrs	x2, esr_el1
	lsr	x2, x2, #ESR_EC_SHIFT
	cmp	x2, #ESR_EC_AARCH64_SVC

	b.eq	el0_svc
	mov x0, x29
	bl rex_debug
	mov x0, #0
	bl rex_debug
	mrs     x0, elr_el1
        bl      rex_debug
        mrs     x0, sp_el0
        bl      rex_debug
        mrs     x0, esr_el1
        bl      rex_debug
        mrs     x0, far_el1
        bl      rex_debug
	b	el0_sync_abort
	check_vector_size el0_sync_a64

	.align	7
el0_irq_a64:
	b	el0_irq_a64
	check_vector_size el0_irq_a64

	.align	7
el0_fiq_a64:
	store_xregs sp, CPU_LOCAL_X0, 0, 3
	b	elx_fiq
	check_vector_size el0_fiq_a64

	.align	7
SErrorA64:
	b   	SErrorA64
	check_vector_size SErrorA64

	/* -----------------------------------------------------
	 * Lower EL using AArch32 : 0x0 - 0x180
	 * -----------------------------------------------------
	 */
	.align	7
el0_sync_a32:
	store_xregs sp, CPU_LOCAL_X0, 0, 3
	mrs	x2, esr_el1
	mrs	x3, sp_el0
	lsr	x2, x2, #ESR_EC_SHIFT
	cmp	x2, #ESR_EC_AARCH32_SVC
	b.eq	el0_svc
	b	el0_sync_abort
	check_vector_size el0_sync_a32

	.align	7
el0_irq_a32:
	b	el0_irq_a32
	check_vector_size el0_irq_a32

	.align	7
el0_fiq_a32:
	store_xregs sp, CPU_LOCAL_X0, 0, 3
	b	elx_fiq
	check_vector_size el0_fiq_a32

	.align	7
SErrorA32:
	b	SErrorA32
	check_vector_size SErrorA32

END_FUNC proc_vect_table

LOCAL_FUNC el0_svc , :
	/* get pointer to current thread context in x0 */
	get_proc sp, 0, 1, 2
	
	mrs x1, sp_el0
	mrs x2, elr_el1
	stp x1, x2, [x0, #USER_REGS_SP]
	mrs x1, spsr_el1
	str x1, [x0, #USER_REGS_SPSR]
	store_xregs x0, USER_REGS_X4, 4, 30
	load_xregs sp, CPU_LOCAL_X0, 4, 7
	store_xregs x0, USER_REGS_X0, 4, 7
	
	msr spsel, #0
	
	ldr	x3, [x0, #PROC_KSTACK]
	mov 	sp, x3
	
	#if defined(CFG_ARM_GICV3)
		msr	daifclr, #(DAIFBIT_ABT | DAIFBIT_DBG)
	#else
		msr	daifclr, #(DAIFBIT_FIQ | DAIFBIT_ABT | DAIFBIT_DBG)
	#endif		

	/* Call the handler */
	bl	tee_proc_svc_handler
	/* Mask all maskable exceptions since we're switching back to sp_el1 */
	msr	daifset, #DAIFBIT_ALL

	msr	spsel, #1
	get_proc sp, 0, 1, 2
	msr	spsel, #0

	/* Restore registers to the required state and return*/
	ldr	x1, [x0, #USER_REGS_PC]
	msr	elr_el1, x1
	ldr	x1, [x0, #USER_REGS_SPSR]
	msr	spsr_el1, x1
	ldr	x1, [x0, #USER_REGS_SP]
	mov	sp, x1
	load_xregs x0, USER_REGS_X1, 1, 30
	ldr	x0, [x0, #USER_REGS_X0]
	eret

END_FUNC el0_svc

LOCAL_FUNC el1_sync_abort , :
	mov	x0, sp
	msr	spsel, #0
	mov	x3, sp		/* Save original sp */

	/*
	 * Update core local flags.
	 * flags = (flags << THREAD_CLF_SAVED_SHIFT) | THREAD_CLF_ABORT;
	 */
	ldr	w1, [x0, #THREAD_CORE_LOCAL_FLAGS]
	lsl	w1, w1, #THREAD_CLF_SAVED_SHIFT
	orr	w1, w1, #THREAD_CLF_ABORT
	tbnz	w1, #(THREAD_CLF_SAVED_SHIFT + THREAD_CLF_ABORT_SHIFT), \
			.Lsel_tmp_sp

	/* Select abort stack */
	ldr	x2, [x0, #THREAD_CORE_LOCAL_ABT_STACK_VA_END]
	b	.Lset_sp

.Lsel_tmp_sp:
	/* Select tmp stack */
	ldr	x2, [x0, #THREAD_CORE_LOCAL_TMP_STACK_VA_END]
	orr	w1, w1, #THREAD_CLF_TMP	/* flags |= THREAD_CLF_TMP; */

.Lset_sp:
	mov	sp, x2
	str	w1, [x0, #THREAD_CORE_LOCAL_FLAGS]

	/*
	 * Save state on stack
	 */
	sub	sp, sp, #THREAD_ABT_REGS_SIZE
	mrs	x2, spsr_el1
	/* Store spsr, sp_el0 */
	stp	x2, x3, [sp, #THREAD_ABT_REG_SPSR]
	/* Store original x0, x1 */
	ldp	x2, x3, [x0, #THREAD_CORE_LOCAL_X0]
	stp	x2, x3, [sp, #THREAD_ABT_REG_X0]
	/* Store original x2, x3 and x4 to x29 */
	ldp	x2, x3, [x0, #THREAD_CORE_LOCAL_X2]
	store_xregs sp, THREAD_ABT_REG_X2, 2, 29
	/* Store x30, elr_el1 */
	mrs	x0, elr_el1
	stp	x30, x0, [sp, #THREAD_ABT_REG_X30]

	/*
	 * Call handler
	 */
	mov	x0, #0
	mov	x1, sp
	bl	abort_handler

	/*
	 * Restore state from stack
	 */
	/* Load x30, elr_el1 */
	ldp	x30, x0, [sp, #THREAD_ABT_REG_X30]
	msr	elr_el1, x0
	/* Load x0 to x29 */
	load_xregs sp, THREAD_ABT_REG_X0, 0, 29
	/* Switch to SP_EL1 */
	msr	spsel, #1
	/* Save x0 to x3 in CORE_LOCAL */
	store_xregs sp, THREAD_CORE_LOCAL_X0, 0, 3
	/* Restore spsr_el1 and sp_el0 */
	mrs	x3, sp_el0
	ldp	x0, x1, [x3, #THREAD_ABT_REG_SPSR]
	msr	spsr_el1, x0
	msr	sp_el0, x1

	/* Update core local flags */
	ldr	w0, [sp, #THREAD_CORE_LOCAL_FLAGS]
	lsr	w0, w0, #THREAD_CLF_SAVED_SHIFT
	str	w0, [sp, #THREAD_CORE_LOCAL_FLAGS]

	/* Restore x0 to x3 */
	load_xregs sp, THREAD_CORE_LOCAL_X0, 0, 3

	/* Return from exception */
	eret
END_FUNC el1_sync_abort

	/* sp_el0 in x3 */
LOCAL_FUNC el0_sync_abort , :
	/*
	 * Update core local flags
	 */
	ldr	w1, [sp, #THREAD_CORE_LOCAL_FLAGS]
	lsl	w1, w1, #THREAD_CLF_SAVED_SHIFT
	orr	w1, w1, #THREAD_CLF_ABORT
	str	w1, [sp, #THREAD_CORE_LOCAL_FLAGS]

	/*
	 * Save state on stack
	 */

	/* load abt_stack_va_end */
	ldr	x1, [sp, #THREAD_CORE_LOCAL_ABT_STACK_VA_END]
	/* Keep pointer to initial record in x0 */
	mov	x0, sp
	/* Switch to SP_EL0 */
	msr	spsel, #0
	mov	sp, x1
	sub	sp, sp, #THREAD_ABT_REGS_SIZE
	mrs	x2, spsr_el1
	/* Store spsr, sp_el0 */
	stp	x2, x3, [sp, #THREAD_ABT_REG_SPSR]
	/* Store original x0, x1 */
	ldp	x2, x3, [x0, #THREAD_CORE_LOCAL_X0]
	stp	x2, x3, [sp, #THREAD_ABT_REG_X0]
	/* Store original x2, x3 and x4 to x29 */
	ldp	x2, x3, [x0, #THREAD_CORE_LOCAL_X2]
	store_xregs sp, THREAD_ABT_REG_X2, 2, 29
	/* Store x30, elr_el1 */
	mrs	x0, elr_el1
	stp	x30, x0, [sp, #THREAD_ABT_REG_X30]

	/*
	 * Call handler
	 */
	mov	x0, #0
	mov	x1, sp
	bl	abort_handler

	/*
	 * Restore state from stack
	 */

	/* Load x30, elr_el1 */
	ldp	x30, x0, [sp, #THREAD_ABT_REG_X30]
	msr	elr_el1, x0
	/* Load x0 to x29 */
	load_xregs sp, THREAD_ABT_REG_X0, 0, 29
	/* Switch to SP_EL1 */
	msr	spsel, #1
	/* Save x0 to x3 in EL1_REC */
	store_xregs sp, THREAD_CORE_LOCAL_X0, 0, 3
	/* Restore spsr_el1 and sp_el0 */
	mrs	x3, sp_el0
	ldp	x0, x1, [x3, #THREAD_ABT_REG_SPSR]
	msr	spsr_el1, x0
	msr	sp_el0, x1

	/* Update core local flags */
	ldr	w0, [sp, #THREAD_CORE_LOCAL_FLAGS]
	lsr	w0, w0, #THREAD_CLF_SAVED_SHIFT
	str	w0, [sp, #THREAD_CORE_LOCAL_FLAGS]

	/* Restore x0 to x3 */
	load_xregs sp, THREAD_CORE_LOCAL_X0, 0, 3

	/* Return from exception */
	eret
END_FUNC el0_sync_abort


#define ELX_FIQ_REC_X(x)              (8 * ((x) - 4))
#define ELX_FIQ_REC_LR                (8 + ELX_FIQ_REC_X(19))
#define ELX_FIQ_REC_SP_EL0            (8 + ELX_FIQ_REC_LR)
#define ELX_FIQ_REC_SIZE              (8 + ELX_FIQ_REC_SP_EL0)

LOCAL_FUNC elx_fiq , :
	ldr x0, [sp, #CPU_LOCAL_CUR_PROC]
	and x0, x0, #0xf0
	cmp x0, #0
	bne .no_proc
	get_proc sp, 0, 1, 2	
	ldr 	x0, [x0, #PROC_INTR_REGS]
        mrs 	x1, sp_el0
        mrs 	x2, elr_el1
        stp 	x1, x2, [x0, #PCB_REGS_SP]
        mrs 	x1, spsr_el1
        str 	x1, [x0, #PCB_REGS_SPSR]
        store_xregs x0, PCB_REGS_X4, 4, 30
        load_xregs sp, CPU_LOCAL_X0, 4, 7
        store_xregs x0, PCB_REGS_X0, 4, 7
	
	ldr	x1, [sp, #CPU_LOCAL_TMP_STACK]
	/* Switch to SP_EL0 */
	msr	spsel, #0
	mov	sp, x1

	bl      thread_check_canaries
	bl	proc_check_canaries
	adr	x16, thread_nintr_handler_ptr
	ldr	x16, [x16]
	blr	x16
	
	b 	.

.no_proc:
	ldr	x1, [sp, #CPU_LOCAL_TMP_STACK]
	/* Keep original SP_EL0 */
	mrs	x2, sp_el0
	/* Switch to SP_EL0 */
	msr	spsel, #0
	mov	sp, x1	
	
	/*
	 * Save registers on stack that can be corrupted by a call to
	 * a C function
	 */
	/* Make room for struct elx_fiq_rec */
	sub	sp, sp, #ELX_FIQ_REC_SIZE
	/* Store x4..x18 */
	store_xregs sp, ELX_FIQ_REC_X(4), 4, 18
	/* Store lr and original sp_el0 */
	stp	x30, x2, [sp, #ELX_FIQ_REC_LR]

	bl      thread_check_canaries
	bl	proc_check_canaries
	adr	x16, thread_nintr_handler_ptr
	ldr	x16, [x16]
	blr	x16

	/*
	 * Restore registers
	 */
	/* Restore x4..x18 */
	load_xregs sp, ELX_FIQ_REC_X(4), 4, 18
	/* Load  lr and original sp_el0 */
	ldp	x30, x2, [sp, #ELX_FIQ_REC_LR]
	/* Restore SP_El0 */
	mov	sp, x2
	/* Switch back to SP_EL1 */
	msr	spsel, #1

	/* Restore x0..x3 */
	load_xregs sp, CPU_LOCAL_X0, 0, 3

	/* Return from exception */
	eret
END_FUNC elx_fiq

FUNC init_cpu_local , :
        sub     sp, sp, #16
        str     x30, [sp, #0]
        bl      get_tee_cpu
        msr     spsel, #1
        mov     sp, x0
        msr     spsel, #0
        ldr     x30, [sp, #0]
        add     sp, sp, #16
        ret
END_FUNC init_cpu_local

	.macro get_thread_ctx core_local, res, tmp0, tmp1
                ldr     w\tmp0, [\core_local, \
                                #THREAD_CORE_LOCAL_CURR_THREAD]
                adr     x\res, threads
                mov     x\tmp1, #THREAD_CTX_SIZE
                madd    x\res, x\tmp0, x\tmp1, x\res
        .endm


FUNC save_migrate_context , :
	msr     spsel, #1
	get_thread_ctx sp, 1, 2, 3
	ldr	x2, [x1, #THREAD_CTX_KERN_SP]
	sub     x2, x2, #THREAD_SVC_REG_SIZE

        ldp     x3, x4, [x2, #THREAD_SVC_REG_X30]
	str     x3, [x0, #USER_REGS_X30]
	str	x4, [x0, #USER_REGS_SP]

	load_xregs x2, THREAD_SVC_REG_ELR, 3, 4
	stp     x3, x4, [x0, #USER_REGS_PC]

	mov	x19, x0
	mov	x20, x2
	load_xregs x20, THREAD_SVC_REG_X0, 0, 14
	store_xregs x19, USER_REGS_X0, 0, 29

	msr 	spsel, #0
	ret	
END_FUNC save_migrate_context

FUNC switch_migrate_stack , :
	
	msr	spsel, #1	
	/* Select tmp stack */
	ldr	x1, [sp, #THREAD_CORE_LOCAL_TMP_STACK_VA_END]
	msr	sp_el0, x1
	msr     spsel, #0
	ret
	
END_FUNC switch_migrate_stack
