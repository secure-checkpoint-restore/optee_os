	.arch armv8-a
	.file	"asm-defines.c"
// GNU C99 (Linaro GCC 6.2-2016.11) version 6.2.1 20161016 (aarch64-linux-gnu)
//	compiled by GNU C version 4.8.4, GMP version 6.1.0, MPFR version 3.1.4, MPC version 1.0.3, isl version none
// GGC heuristics: --param ggc-min-expand=97 --param ggc-min-heapsize=127012
// options passed:  -nostdinc -I lib/libutils/isoc/include
// -I lib/libutils/ext/include -I lib/libmpa/include
// -I core/lib/libtomcrypt/include -I core/arch/arm/plat-vexpress/.
// -I core/include -I out/arm/core/include/generated
// -I core/arch/arm/include -I lib/libutee/include
// -imultiarch aarch64-linux-gnu
// -iprefix /home/rex/devel/optee/toolchains/aarch64/bin/../lib/gcc/aarch64-linux-gnu/6.2.1/
// -isysroot /home/rex/devel/optee/toolchains/aarch64/bin/../aarch64-linux-gnu/libc
// -MD out/arm/core/include/generated/.asm-defines.d
// -MF out/arm/core/include/generated/.asm-defines.s.d
// -MT out/arm/core/include/generated/.asm-defines.s -D __KERNEL__
// -D ARM64=1 -D __LP64__=1 -D TRACE_LEVEL=3
// -isystem /home/rex/devel/optee/toolchains/aarch64/bin/../lib/gcc/aarch64-linux-gnu/6.2.1/include
// -include out/arm/include/generated/conf.h
// core/arch/arm/kernel/asm-defines.c -mstrict-align -mgeneral-regs-only
// -march=armv8-a -mlittle-endian -mabi=lp64
// -auxbase-strip out/arm/core/include/generated/.asm-defines.s -g
// -gdwarf-2 -O0 -Werror -Wall -Wcast-align
// -Werror=implicit-function-declaration -Wextra -Wfloat-equal
// -Wformat-nonliteral -Wformat-security -Wformat=2 -Winit-self
// -Wmissing-declarations -Wsuggest-attribute=format -Wmissing-include-dirs
// -Wsuggest-attribute=noreturn -Wmissing-prototypes -Wnested-externs
// -Wpointer-arith -Wshadow -Wstrict-prototypes -Wswitch-default
// -Wwrite-strings -Wno-missing-field-initializers -Wno-format-zero-length
// -Waggregate-return -Wredundant-decls -Wold-style-definition
// -Wstrict-aliasing=2 -Wundef -Wpedantic -Wdeclaration-after-statement
// -std=gnu99 -fdiagnostics-show-option -ffunction-sections -fdata-sections
// -fverbose-asm
// options enabled:  -faggressive-loop-optimizations -fauto-inc-dec
// -fchkp-check-incomplete-type -fchkp-check-read -fchkp-check-write
// -fchkp-instrument-calls -fchkp-narrow-bounds -fchkp-optimize
// -fchkp-store-bounds -fchkp-use-static-bounds
// -fchkp-use-static-const-bounds -fchkp-use-wrappers -fcommon
// -fdata-sections -fdelete-null-pointer-checks -fdwarf2-cfi-asm
// -fearly-inlining -feliminate-unused-debug-types -ffunction-cse
// -ffunction-sections -fgcse-lm -fgnu-runtime -fgnu-unique -fident
// -finline-atomics -fira-hoist-pressure -fira-share-save-slots
// -fira-share-spill-slots -fivopts -fkeep-static-consts
// -fleading-underscore -flifetime-dse -flto-odr-type-merging -fmath-errno
// -fmerge-debug-strings -fomit-frame-pointer -fpeephole -fplt
// -fprefetch-loop-arrays -freg-struct-return
// -fsched-critical-path-heuristic -fsched-dep-count-heuristic
// -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
// -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
// -fsched-stalled-insns-dep -fschedule-fusion -fsemantic-interposition
// -fshow-column -fsigned-zeros -fsplit-ivs-in-unroller -fssa-backprop
// -fstdarg-opt -fstrict-volatile-bitfields -fsync-libcalls -ftrapping-math
// -ftree-cselim -ftree-forwprop -ftree-loop-if-convert -ftree-loop-im
// -ftree-loop-ivcanon -ftree-loop-optimize -ftree-parallelize-loops=
// -ftree-phiprop -ftree-reassoc -ftree-scev-cprop -funit-at-a-time
// -fverbose-asm -fzero-initialized-in-bss -mfix-cortex-a53-835769
// -mfix-cortex-a53-843419 -mgeneral-regs-only -mglibc -mlittle-endian
// -momit-leaf-frame-pointer -mpc-relative-literal-loads -mstrict-align

	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.__defines,"ax",@progbits
	.align	2
	.global	__defines
	.type	__defines, %function
__defines:
.LFB73:
	.file 1 "core/arch/arm/kernel/asm-defines.c"
	.loc 1 39 0
	.cfi_startproc
	.loc 1 58 0
#APP
// 58 "core/arch/arm/kernel/asm-defines.c" 1
	
==>THREAD_SMC_ARGS_X0 0 offsetof(struct thread_smc_args, a0)	//
// 0 "" 2
	.loc 1 59 0
// 59 "core/arch/arm/kernel/asm-defines.c" 1
	
==>THREAD_SMC_ARGS_SIZE 64 sizeof(struct thread_smc_args)	//
// 0 "" 2
	.loc 1 61 0
// 61 "core/arch/arm/kernel/asm-defines.c" 1
	
==>THREAD_SVC_REG_X0 16 offsetof(struct thread_svc_regs, x0)	//
// 0 "" 2
	.loc 1 62 0
// 62 "core/arch/arm/kernel/asm-defines.c" 1
	
==>THREAD_SVC_REG_X5 56 offsetof(struct thread_svc_regs, x5)	//
// 0 "" 2
	.loc 1 63 0
// 63 "core/arch/arm/kernel/asm-defines.c" 1
	
==>THREAD_SVC_REG_X6 64 offsetof(struct thread_svc_regs, x6)	//
// 0 "" 2
	.loc 1 64 0
// 64 "core/arch/arm/kernel/asm-defines.c" 1
	
==>THREAD_SVC_REG_X30 136 offsetof(struct thread_svc_regs, x30)	//
// 0 "" 2
	.loc 1 65 0
// 65 "core/arch/arm/kernel/asm-defines.c" 1
	
==>THREAD_SVC_REG_ELR 0 offsetof(struct thread_svc_regs, elr)	//
// 0 "" 2
	.loc 1 66 0
// 66 "core/arch/arm/kernel/asm-defines.c" 1
	
==>THREAD_SVC_REG_SPSR 8 offsetof(struct thread_svc_regs, spsr)	//
// 0 "" 2
	.loc 1 67 0
// 67 "core/arch/arm/kernel/asm-defines.c" 1
	
==>THREAD_SVC_REG_SP_EL0 144 offsetof(struct thread_svc_regs, sp_el0)	//
// 0 "" 2
	.loc 1 68 0
// 68 "core/arch/arm/kernel/asm-defines.c" 1
	
==>THREAD_SVC_REG_SIZE 160 sizeof(struct thread_svc_regs)	//
// 0 "" 2
	.loc 1 71 0
// 71 "core/arch/arm/kernel/asm-defines.c" 1
	
==>THREAD_ABT_REG_X0 0 offsetof(struct thread_abort_regs, x0)	//
// 0 "" 2
	.loc 1 72 0
// 72 "core/arch/arm/kernel/asm-defines.c" 1
	
==>THREAD_ABT_REG_X2 16 offsetof(struct thread_abort_regs, x2)	//
// 0 "" 2
	.loc 1 73 0
// 73 "core/arch/arm/kernel/asm-defines.c" 1
	
==>THREAD_ABT_REG_X30 240 offsetof(struct thread_abort_regs, x30)	//
// 0 "" 2
	.loc 1 74 0
// 74 "core/arch/arm/kernel/asm-defines.c" 1
	
==>THREAD_ABT_REG_SPSR 256 offsetof(struct thread_abort_regs, spsr)	//
// 0 "" 2
	.loc 1 75 0
// 75 "core/arch/arm/kernel/asm-defines.c" 1
	
==>THREAD_ABT_REGS_SIZE 272 sizeof(struct thread_abort_regs)	//
// 0 "" 2
	.loc 1 78 0
// 78 "core/arch/arm/kernel/asm-defines.c" 1
	
==>THREAD_CTX_KERN_SP 320 offsetof(struct thread_ctx, kern_sp)	//
// 0 "" 2
	.loc 1 79 0
// 79 "core/arch/arm/kernel/asm-defines.c" 1
	
==>THREAD_CTX_SIZE 1536 sizeof(struct thread_ctx)	//
// 0 "" 2
	.loc 1 82 0
// 82 "core/arch/arm/kernel/asm-defines.c" 1
	
==>THREAD_CTX_REGS_SP 0 offsetof(struct thread_ctx_regs, sp)	//
// 0 "" 2
	.loc 1 83 0
// 83 "core/arch/arm/kernel/asm-defines.c" 1
	
==>THREAD_CTX_REGS_X0 24 offsetof(struct thread_ctx_regs, x[0])	//
// 0 "" 2
	.loc 1 84 0
// 84 "core/arch/arm/kernel/asm-defines.c" 1
	
==>THREAD_CTX_REGS_X1 32 offsetof(struct thread_ctx_regs, x[1])	//
// 0 "" 2
	.loc 1 85 0
// 85 "core/arch/arm/kernel/asm-defines.c" 1
	
==>THREAD_CTX_REGS_X4 56 offsetof(struct thread_ctx_regs, x[4])	//
// 0 "" 2
	.loc 1 86 0
// 86 "core/arch/arm/kernel/asm-defines.c" 1
	
==>THREAD_CTX_REGS_X19 176 offsetof(struct thread_ctx_regs, x[19])	//
// 0 "" 2
	.loc 1 89 0
// 89 "core/arch/arm/kernel/asm-defines.c" 1
	
==>THREAD_USER_MODE_REC_EXIT_STATUS0_PTR 0 offsetof(struct thread_user_mode_rec, exit_status0_ptr)	//
// 0 "" 2
	.loc 1 91 0
// 91 "core/arch/arm/kernel/asm-defines.c" 1
	
==>THREAD_USER_MODE_REC_X19 16 offsetof(struct thread_user_mode_rec, x[0])	//
// 0 "" 2
	.loc 1 93 0
// 93 "core/arch/arm/kernel/asm-defines.c" 1
	
==>THREAD_USER_MODE_REC_SIZE 112 sizeof(struct thread_user_mode_rec)	//
// 0 "" 2
	.loc 1 96 0
// 96 "core/arch/arm/kernel/asm-defines.c" 1
	
==>THREAD_CORE_LOCAL_TMP_STACK_VA_END 0 offsetof(struct thread_core_local, tmp_stack_va_end)	//
// 0 "" 2
	.loc 1 98 0
// 98 "core/arch/arm/kernel/asm-defines.c" 1
	
==>THREAD_CORE_LOCAL_CURR_THREAD 8 offsetof(struct thread_core_local, curr_thread)	//
// 0 "" 2
	.loc 1 100 0
// 100 "core/arch/arm/kernel/asm-defines.c" 1
	
==>THREAD_CORE_LOCAL_FLAGS 12 offsetof(struct thread_core_local, flags)	//
// 0 "" 2
	.loc 1 102 0
// 102 "core/arch/arm/kernel/asm-defines.c" 1
	
==>THREAD_CORE_LOCAL_ABT_STACK_VA_END 16 offsetof(struct thread_core_local, abt_stack_va_end)	//
// 0 "" 2
	.loc 1 104 0
// 104 "core/arch/arm/kernel/asm-defines.c" 1
	
==>THREAD_CORE_LOCAL_X0 24 offsetof(struct thread_core_local, x[0])	//
// 0 "" 2
	.loc 1 105 0
// 105 "core/arch/arm/kernel/asm-defines.c" 1
	
==>THREAD_CORE_LOCAL_X2 40 offsetof(struct thread_core_local, x[2])	//
// 0 "" 2
	.loc 1 109 0
// 109 "core/arch/arm/kernel/asm-defines.c" 1
	
==>USER_REGS_SP 0 offsetof(struct proc, user_regs.sp)	//
// 0 "" 2
	.loc 1 110 0
// 110 "core/arch/arm/kernel/asm-defines.c" 1
	
==>USER_REGS_SPSR 16 offsetof(struct proc, user_regs.spsr)	//
// 0 "" 2
	.loc 1 111 0
// 111 "core/arch/arm/kernel/asm-defines.c" 1
	
==>USER_REGS_PC 8 offsetof(struct proc, user_regs.pc)	//
// 0 "" 2
	.loc 1 112 0
// 112 "core/arch/arm/kernel/asm-defines.c" 1
	
==>USER_REGS_X0 24 offsetof(struct proc, user_regs.x[0])	//
// 0 "" 2
	.loc 1 113 0
// 113 "core/arch/arm/kernel/asm-defines.c" 1
	
==>USER_REGS_X1 32 offsetof(struct proc, user_regs.x[1])	//
// 0 "" 2
	.loc 1 114 0
// 114 "core/arch/arm/kernel/asm-defines.c" 1
	
==>USER_REGS_X4 56 offsetof(struct proc, user_regs.x[4])	//
// 0 "" 2
	.loc 1 115 0
// 115 "core/arch/arm/kernel/asm-defines.c" 1
	
==>USER_REGS_X30 264 offsetof(struct proc, user_regs.x[30])	//
// 0 "" 2
	.loc 1 118 0
// 118 "core/arch/arm/kernel/asm-defines.c" 1
	
==>PCB_REGS_SP 0 offsetof(struct pcb_regs, sp)	//
// 0 "" 2
	.loc 1 119 0
// 119 "core/arch/arm/kernel/asm-defines.c" 1
	
==>PCB_REGS_PC 8 offsetof(struct pcb_regs, pc)	//
// 0 "" 2
	.loc 1 120 0
// 120 "core/arch/arm/kernel/asm-defines.c" 1
	
==>PCB_REGS_SPSR 16 offsetof(struct pcb_regs, spsr)	//
// 0 "" 2
	.loc 1 121 0
// 121 "core/arch/arm/kernel/asm-defines.c" 1
	
==>PCB_REGS_X0 24 offsetof(struct pcb_regs, x[0])	//
// 0 "" 2
	.loc 1 122 0
// 122 "core/arch/arm/kernel/asm-defines.c" 1
	
==>PCB_REGS_X1 32 offsetof(struct pcb_regs, x[1])	//
// 0 "" 2
	.loc 1 123 0
// 123 "core/arch/arm/kernel/asm-defines.c" 1
	
==>PCB_REGS_X3 48 offsetof(struct pcb_regs, x[3])	//
// 0 "" 2
	.loc 1 124 0
// 124 "core/arch/arm/kernel/asm-defines.c" 1
	
==>PCB_REGS_X4 56 offsetof(struct pcb_regs, x[4])	//
// 0 "" 2
	.loc 1 125 0
// 125 "core/arch/arm/kernel/asm-defines.c" 1
	
==>PCB_REGS_X30 264 offsetof(struct pcb_regs, x[30])	//
// 0 "" 2
	.loc 1 128 0
// 128 "core/arch/arm/kernel/asm-defines.c" 1
	
==>PROC_INTR_REGS 272 offsetof(struct proc, intr_regs)	//
// 0 "" 2
	.loc 1 129 0
// 129 "core/arch/arm/kernel/asm-defines.c" 1
	
==>PROC_SIZE 384 sizeof(struct proc)	//
// 0 "" 2
	.loc 1 130 0
// 130 "core/arch/arm/kernel/asm-defines.c" 1
	
==>PROC_KSTACK 280 offsetof(struct proc, k_stack)	//
// 0 "" 2
	.loc 1 133 0
// 133 "core/arch/arm/kernel/asm-defines.c" 1
	
==>CPU_LOCAL_X0 16 offsetof(struct cpu_local, x[0])	//
// 0 "" 2
	.loc 1 134 0
// 134 "core/arch/arm/kernel/asm-defines.c" 1
	
==>CPU_LOCAL_CUR_PROC 8 offsetof(struct cpu_local, cur_proc)	//
// 0 "" 2
	.loc 1 135 0
// 135 "core/arch/arm/kernel/asm-defines.c" 1
	
==>CPU_LOCAL_TMP_STACK 0 offsetof(struct cpu_local, tmp_stack)	//
// 0 "" 2
	.loc 1 137 0
#NO_APP
	nop
	ret
	.cfi_endproc
.LFE73:
	.size	__defines, .-__defines
	.text
.Letext0:
	.file 2 "lib/libutils/isoc/include/stdint.h"
	.file 3 "/home/rex/devel/optee/toolchains/aarch64/lib/gcc/aarch64-linux-gnu/6.2.1/include/stddef.h"
	.file 4 "lib/libutils/ext/include/types_ext.h"
	.file 5 "core/arch/arm/include/kernel/wait_queue.h"
	.file 6 "core/arch/arm/include/kernel/mutex.h"
	.file 7 "core/arch/arm/include/kernel/vfp.h"
	.file 8 "lib/libutee/include/tee_api_types.h"
	.file 9 "lib/libutee/include/user_ta_header.h"
	.file 10 "lib/libutils/isoc/include/malloc.h"
	.file 11 "core/include/kernel/tee_ta_manager.h"
	.file 12 "core/arch/arm/include/mm/pgt_cache.h"
	.file 13 "core/arch/arm/include/kernel/thread.h"
	.file 14 "lib/libutils/ext/include/trace.h"
	.file 15 "core/include/mm/tee_mm.h"
	.file 16 "core/arch/arm/include/kernel/proc.h"
	.file 17 "core/arch/arm/include/mm/core_mmu.h"
	.file 18 "core/arch/arm/kernel/thread_private.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xf69
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF190
	.byte	0xc
	.4byte	.LASF191
	.4byte	.LASF192
	.4byte	.Ldebug_ranges0+0
	.8byte	0
	.8byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF1
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x4
	.4byte	.LASF4
	.byte	0x2
	.byte	0x4b
	.4byte	0x58
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0x4
	.4byte	.LASF5
	.byte	0x2
	.byte	0x4c
	.4byte	0x6a
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x4
	.4byte	.LASF7
	.byte	0x2
	.byte	0x4e
	.4byte	0x81
	.uleb128 0x5
	.4byte	0x71
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x4
	.4byte	.LASF9
	.byte	0x2
	.byte	0x56
	.4byte	0x93
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x2
	.byte	0x6f
	.4byte	0x93
	.uleb128 0x4
	.4byte	.LASF12
	.byte	0x3
	.byte	0xd8
	.4byte	0x93
	.uleb128 0x5
	.4byte	0xa5
	.uleb128 0x4
	.4byte	.LASF13
	.byte	0x4
	.byte	0x27
	.4byte	0x9a
	.uleb128 0x4
	.4byte	.LASF14
	.byte	0x4
	.byte	0x2a
	.4byte	0x9a
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF15
	.uleb128 0x6
	.4byte	.LASF16
	.byte	0x8
	.byte	0x5
	.byte	0x22
	.4byte	0xed
	.uleb128 0x7
	.4byte	.LASF18
	.byte	0x5
	.byte	0x22
	.4byte	0x131
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x6
	.4byte	.LASF17
	.byte	0x18
	.byte	0x5
	.byte	0x27
	.4byte	0x131
	.uleb128 0x7
	.4byte	.LASF19
	.byte	0x5
	.byte	0x28
	.4byte	0x38
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.4byte	.LASF20
	.byte	0x5
	.byte	0x29
	.4byte	0x14e
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x8
	.string	"cv"
	.byte	0x5
	.byte	0x2a
	.4byte	0x17c
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x7
	.4byte	.LASF21
	.byte	0x5
	.byte	0x2b
	.4byte	0x137
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0
	.uleb128 0x9
	.byte	0x8
	.4byte	0xed
	.uleb128 0xa
	.byte	0x8
	.byte	0x5
	.byte	0x2b
	.4byte	0x14e
	.uleb128 0x7
	.4byte	.LASF22
	.byte	0x5
	.byte	0x2b
	.4byte	0x131
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF23
	.uleb128 0x6
	.4byte	.LASF24
	.byte	0x10
	.byte	0x6
	.byte	0x51
	.4byte	0x17c
	.uleb128 0x7
	.4byte	.LASF25
	.byte	0x6
	.byte	0x52
	.4byte	0x81
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.string	"m"
	.byte	0x6
	.byte	0x53
	.4byte	0x216
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.byte	0x8
	.4byte	0x155
	.uleb128 0xb
	.4byte	.LASF60
	.byte	0x4
	.4byte	0x81
	.byte	0x6
	.byte	0x22
	.4byte	0x19f
	.uleb128 0xc
	.4byte	.LASF26
	.byte	0
	.uleb128 0xc
	.4byte	.LASF27
	.byte	0x1
	.byte	0
	.uleb128 0xa
	.byte	0x10
	.byte	0x6
	.byte	0x35
	.4byte	0x1c4
	.uleb128 0x7
	.4byte	.LASF28
	.byte	0x6
	.byte	0x35
	.4byte	0x216
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.4byte	.LASF29
	.byte	0x6
	.byte	0x35
	.4byte	0x21c
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0
	.uleb128 0x6
	.4byte	.LASF30
	.byte	0x28
	.byte	0x6
	.byte	0x30
	.4byte	0x216
	.uleb128 0x7
	.4byte	.LASF31
	.byte	0x6
	.byte	0x31
	.4byte	0x182
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.4byte	.LASF25
	.byte	0x6
	.byte	0x32
	.4byte	0x81
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.string	"wq"
	.byte	0x6
	.byte	0x33
	.4byte	0xd2
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x7
	.4byte	.LASF32
	.byte	0x6
	.byte	0x34
	.4byte	0x3f
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x7
	.4byte	.LASF21
	.byte	0x6
	.byte	0x35
	.4byte	0x19f
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.byte	0
	.uleb128 0x9
	.byte	0x8
	.4byte	0x1c4
	.uleb128 0x9
	.byte	0x8
	.4byte	0x216
	.uleb128 0x6
	.4byte	.LASF33
	.byte	0x10
	.byte	0x6
	.byte	0x3b
	.4byte	0x24b
	.uleb128 0x7
	.4byte	.LASF34
	.byte	0x6
	.byte	0x3b
	.4byte	0x216
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.4byte	.LASF35
	.byte	0x6
	.byte	0x3b
	.4byte	0x21c
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0
	.uleb128 0x6
	.4byte	.LASF36
	.byte	0x10
	.byte	0x7
	.byte	0x42
	.4byte	0x264
	.uleb128 0x8
	.string	"v"
	.byte	0x7
	.byte	0x43
	.4byte	0x264
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0xd
	.4byte	0x4d
	.4byte	0x274
	.uleb128 0xe
	.4byte	0xcb
	.byte	0xf
	.byte	0
	.uleb128 0xf
	.4byte	.LASF37
	.2byte	0x210
	.byte	0x7
	.byte	0x46
	.4byte	0x2cc
	.uleb128 0x8
	.string	"reg"
	.byte	0x7
	.byte	0x47
	.4byte	0x2cc
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.4byte	.LASF38
	.byte	0x7
	.byte	0x48
	.4byte	0x71
	.byte	0x3
	.byte	0x23
	.uleb128 0x200
	.uleb128 0x7
	.4byte	.LASF39
	.byte	0x7
	.byte	0x49
	.4byte	0x71
	.byte	0x3
	.byte	0x23
	.uleb128 0x204
	.uleb128 0x7
	.4byte	.LASF40
	.byte	0x7
	.byte	0x4a
	.4byte	0x71
	.byte	0x3
	.byte	0x23
	.uleb128 0x208
	.uleb128 0x7
	.4byte	.LASF41
	.byte	0x7
	.byte	0x4b
	.4byte	0x14e
	.byte	0x3
	.byte	0x23
	.uleb128 0x20c
	.byte	0
	.uleb128 0xd
	.4byte	0x24b
	.4byte	0x2dc
	.uleb128 0xe
	.4byte	0xcb
	.byte	0x1f
	.byte	0
	.uleb128 0x4
	.4byte	.LASF42
	.byte	0x8
	.byte	0x2a
	.4byte	0x71
	.uleb128 0xa
	.byte	0x10
	.byte	0x8
	.byte	0x2c
	.4byte	0x328
	.uleb128 0x7
	.4byte	.LASF43
	.byte	0x8
	.byte	0x2d
	.4byte	0x71
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.4byte	.LASF44
	.byte	0x8
	.byte	0x2e
	.4byte	0x5f
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x7
	.4byte	.LASF45
	.byte	0x8
	.byte	0x2f
	.4byte	0x5f
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x7
	.4byte	.LASF46
	.byte	0x8
	.byte	0x30
	.4byte	0x328
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0
	.uleb128 0xd
	.4byte	0x4d
	.4byte	0x338
	.uleb128 0xe
	.4byte	0xcb
	.byte	0x7
	.byte	0
	.uleb128 0x4
	.4byte	.LASF47
	.byte	0x8
	.byte	0x31
	.4byte	0x2e7
	.uleb128 0xa
	.byte	0x14
	.byte	0x8
	.byte	0x38
	.4byte	0x368
	.uleb128 0x7
	.4byte	.LASF48
	.byte	0x8
	.byte	0x39
	.4byte	0x71
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.4byte	.LASF49
	.byte	0x8
	.byte	0x3a
	.4byte	0x338
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0
	.uleb128 0x4
	.4byte	.LASF50
	.byte	0x8
	.byte	0x3b
	.4byte	0x343
	.uleb128 0xa
	.byte	0x10
	.byte	0x8
	.byte	0x48
	.4byte	0x398
	.uleb128 0x7
	.4byte	.LASF51
	.byte	0x8
	.byte	0x49
	.4byte	0x398
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.4byte	.LASF52
	.byte	0x8
	.byte	0x4a
	.4byte	0x71
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0
	.uleb128 0x10
	.byte	0x8
	.uleb128 0xa
	.byte	0x8
	.byte	0x8
	.byte	0x4c
	.4byte	0x3bb
	.uleb128 0x8
	.string	"a"
	.byte	0x8
	.byte	0x4d
	.4byte	0x71
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.string	"b"
	.byte	0x8
	.byte	0x4e
	.4byte	0x71
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0
	.uleb128 0x11
	.byte	0x10
	.byte	0x8
	.byte	0x47
	.4byte	0x3da
	.uleb128 0x12
	.4byte	.LASF53
	.byte	0x8
	.byte	0x4b
	.4byte	0x373
	.uleb128 0x12
	.4byte	.LASF31
	.byte	0x8
	.byte	0x4f
	.4byte	0x39a
	.byte	0
	.uleb128 0x4
	.4byte	.LASF54
	.byte	0x8
	.byte	0x50
	.4byte	0x3bb
	.uleb128 0xa
	.byte	0x8
	.byte	0x8
	.byte	0xb6
	.4byte	0x40a
	.uleb128 0x7
	.4byte	.LASF55
	.byte	0x8
	.byte	0xb7
	.4byte	0x71
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.4byte	.LASF56
	.byte	0x8
	.byte	0xb8
	.4byte	0x71
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0
	.uleb128 0x4
	.4byte	.LASF57
	.byte	0x8
	.byte	0xb9
	.4byte	0x3e5
	.uleb128 0x4
	.4byte	.LASF58
	.byte	0x8
	.byte	0xd6
	.4byte	0x71
	.uleb128 0x13
	.4byte	.LASF71
	.byte	0xa
	.byte	0x21
	.4byte	0x81
	.byte	0x1
	.byte	0x1
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF59
	.uleb128 0x5
	.4byte	0x42d
	.uleb128 0xb
	.4byte	.LASF61
	.byte	0x4
	.4byte	0x81
	.byte	0x9
	.byte	0x45
	.4byte	0x46e
	.uleb128 0xc
	.4byte	.LASF62
	.byte	0
	.uleb128 0xc
	.4byte	.LASF63
	.byte	0x1
	.uleb128 0xc
	.4byte	.LASF64
	.byte	0x2
	.uleb128 0xc
	.4byte	.LASF65
	.byte	0x3
	.uleb128 0xc
	.4byte	.LASF66
	.byte	0x4
	.uleb128 0xc
	.4byte	.LASF67
	.byte	0x5
	.byte	0
	.uleb128 0x6
	.4byte	.LASF68
	.byte	0x18
	.byte	0x9
	.byte	0x54
	.4byte	0x4a5
	.uleb128 0x7
	.4byte	.LASF69
	.byte	0x9
	.byte	0x55
	.4byte	0x4aa
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.4byte	.LASF70
	.byte	0x9
	.byte	0x56
	.4byte	0x439
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x7
	.4byte	.LASF31
	.byte	0x9
	.byte	0x57
	.4byte	0x4b0
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0
	.uleb128 0x5
	.4byte	0x46e
	.uleb128 0x9
	.byte	0x8
	.4byte	0x434
	.uleb128 0x9
	.byte	0x8
	.4byte	0x4b6
	.uleb128 0x14
	.uleb128 0xd
	.4byte	0x4a5
	.4byte	0x4c2
	.uleb128 0x15
	.byte	0
	.uleb128 0x5
	.4byte	0x4b7
	.uleb128 0x13
	.4byte	.LASF72
	.byte	0x9
	.byte	0x5a
	.4byte	0x4c2
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	.LASF73
	.byte	0x9
	.byte	0x5b
	.4byte	0xb0
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	.LASF74
	.byte	0x9
	.byte	0x5e
	.4byte	0x71
	.byte	0x1
	.byte	0x1
	.uleb128 0xd
	.4byte	0x3da
	.4byte	0x4fe
	.uleb128 0xe
	.4byte	0xcb
	.byte	0x3
	.byte	0
	.uleb128 0x13
	.4byte	.LASF75
	.byte	0x9
	.byte	0x5f
	.4byte	0x4ee
	.byte	0x1
	.byte	0x1
	.uleb128 0x6
	.4byte	.LASF76
	.byte	0x80
	.byte	0xb
	.byte	0x70
	.4byte	0x5ce
	.uleb128 0x7
	.4byte	.LASF21
	.byte	0xb
	.byte	0x71
	.4byte	0x874
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.4byte	.LASF77
	.byte	0xb
	.byte	0x72
	.4byte	0x899
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x8
	.string	"ctx"
	.byte	0xb
	.byte	0x73
	.4byte	0x68e
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x7
	.4byte	.LASF78
	.byte	0xb
	.byte	0x74
	.4byte	0x368
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x7
	.4byte	.LASF79
	.byte	0xb
	.byte	0x75
	.4byte	0x14e
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x7
	.4byte	.LASF80
	.byte	0xb
	.byte	0x76
	.4byte	0x14e
	.byte	0x2
	.byte	0x23
	.uleb128 0x3d
	.uleb128 0x7
	.4byte	.LASF81
	.byte	0xb
	.byte	0x77
	.4byte	0x40a
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x7
	.4byte	.LASF82
	.byte	0xb
	.byte	0x78
	.4byte	0x398
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x7
	.4byte	.LASF83
	.byte	0xb
	.byte	0x79
	.4byte	0x71
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x7
	.4byte	.LASF84
	.byte	0xb
	.byte	0x7a
	.4byte	0x155
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x7
	.4byte	.LASF85
	.byte	0xb
	.byte	0x7b
	.4byte	0x155
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x7
	.4byte	.LASF86
	.byte	0xb
	.byte	0x7c
	.4byte	0x3f
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0x7
	.4byte	.LASF87
	.byte	0xb
	.byte	0x7d
	.4byte	0x14e
	.byte	0x2
	.byte	0x23
	.uleb128 0x7c
	.byte	0
	.uleb128 0x9
	.byte	0x8
	.4byte	0x50b
	.uleb128 0x9
	.byte	0x8
	.4byte	0x5ce
	.uleb128 0x6
	.4byte	.LASF88
	.byte	0x10
	.byte	0xb
	.byte	0x2f
	.4byte	0x603
	.uleb128 0x7
	.4byte	.LASF34
	.byte	0xb
	.byte	0x2f
	.4byte	0x68e
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.4byte	.LASF35
	.byte	0xb
	.byte	0x2f
	.4byte	0x694
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0
	.uleb128 0x6
	.4byte	.LASF89
	.byte	0x50
	.byte	0xb
	.byte	0x64
	.4byte	0x68e
	.uleb128 0x7
	.4byte	.LASF49
	.byte	0xb
	.byte	0x65
	.4byte	0x338
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.string	"ops"
	.byte	0xb
	.byte	0x66
	.4byte	0x86e
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x7
	.4byte	.LASF90
	.byte	0xb
	.byte	0x67
	.4byte	0x71
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x7
	.4byte	.LASF21
	.byte	0xb
	.byte	0x68
	.4byte	0x849
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x7
	.4byte	.LASF91
	.byte	0xb
	.byte	0x69
	.4byte	0x71
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x7
	.4byte	.LASF92
	.byte	0xb
	.byte	0x6a
	.4byte	0x71
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x7
	.4byte	.LASF83
	.byte	0xb
	.byte	0x6b
	.4byte	0x71
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x7
	.4byte	.LASF93
	.byte	0xb
	.byte	0x6c
	.4byte	0x14e
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x7
	.4byte	.LASF94
	.byte	0xb
	.byte	0x6d
	.4byte	0x155
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.byte	0
	.uleb128 0x9
	.byte	0x8
	.4byte	0x603
	.uleb128 0x9
	.byte	0x8
	.4byte	0x68e
	.uleb128 0x6
	.4byte	.LASF95
	.byte	0x8
	.byte	0xb
	.byte	0x33
	.4byte	0x6bf
	.uleb128 0x8
	.string	"a"
	.byte	0xb
	.byte	0x34
	.4byte	0x71
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.string	"b"
	.byte	0xb
	.byte	0x35
	.4byte	0x71
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0
	.uleb128 0x6
	.4byte	.LASF96
	.byte	0x18
	.byte	0xb
	.byte	0x38
	.4byte	0x6f6
	.uleb128 0x7
	.4byte	.LASF97
	.byte	0xb
	.byte	0x39
	.4byte	0x6fc
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.4byte	.LASF52
	.byte	0xb
	.byte	0x3a
	.4byte	0xa5
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x7
	.4byte	.LASF98
	.byte	0xb
	.byte	0x3b
	.4byte	0xa5
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0
	.uleb128 0x16
	.4byte	.LASF97
	.byte	0x1
	.uleb128 0x9
	.byte	0x8
	.4byte	0x6f6
	.uleb128 0x11
	.byte	0x18
	.byte	0xb
	.byte	0x40
	.4byte	0x721
	.uleb128 0x17
	.string	"val"
	.byte	0xb
	.byte	0x41
	.4byte	0x69a
	.uleb128 0x17
	.string	"mem"
	.byte	0xb
	.byte	0x42
	.4byte	0x6bf
	.byte	0
	.uleb128 0x6
	.4byte	.LASF99
	.byte	0x68
	.byte	0xb
	.byte	0x3e
	.4byte	0x748
	.uleb128 0x7
	.4byte	.LASF100
	.byte	0xb
	.byte	0x3f
	.4byte	0x71
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.string	"u"
	.byte	0xb
	.byte	0x43
	.4byte	0x748
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0
	.uleb128 0xd
	.4byte	0x702
	.4byte	0x758
	.uleb128 0xe
	.4byte	0xcb
	.byte	0x3
	.byte	0
	.uleb128 0x6
	.4byte	.LASF101
	.byte	0x30
	.byte	0xb
	.byte	0x4a
	.4byte	0x7b9
	.uleb128 0x7
	.4byte	.LASF102
	.byte	0xb
	.byte	0x4b
	.4byte	0x7e4
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.4byte	.LASF103
	.byte	0xb
	.byte	0x4d
	.4byte	0x809
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x7
	.4byte	.LASF104
	.byte	0xb
	.byte	0x4f
	.4byte	0x81b
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x7
	.4byte	.LASF105
	.byte	0xb
	.byte	0x50
	.4byte	0x82d
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x7
	.4byte	.LASF106
	.byte	0xb
	.byte	0x51
	.4byte	0x82d
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x7
	.4byte	.LASF107
	.byte	0xb
	.byte	0x52
	.4byte	0x843
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.byte	0
	.uleb128 0x5
	.4byte	0x758
	.uleb128 0x18
	.byte	0x1
	.4byte	0x2dc
	.4byte	0x7d8
	.uleb128 0x19
	.4byte	0x5ce
	.uleb128 0x19
	.4byte	0x7d8
	.uleb128 0x19
	.4byte	0x7de
	.byte	0
	.uleb128 0x9
	.byte	0x8
	.4byte	0x721
	.uleb128 0x9
	.byte	0x8
	.4byte	0x415
	.uleb128 0x9
	.byte	0x8
	.4byte	0x7be
	.uleb128 0x18
	.byte	0x1
	.4byte	0x2dc
	.4byte	0x809
	.uleb128 0x19
	.4byte	0x5ce
	.uleb128 0x19
	.4byte	0x71
	.uleb128 0x19
	.4byte	0x7d8
	.uleb128 0x19
	.4byte	0x7de
	.byte	0
	.uleb128 0x9
	.byte	0x8
	.4byte	0x7ea
	.uleb128 0x1a
	.byte	0x1
	.4byte	0x81b
	.uleb128 0x19
	.4byte	0x5ce
	.byte	0
	.uleb128 0x9
	.byte	0x8
	.4byte	0x80f
	.uleb128 0x1a
	.byte	0x1
	.4byte	0x82d
	.uleb128 0x19
	.4byte	0x68e
	.byte	0
	.uleb128 0x9
	.byte	0x8
	.4byte	0x821
	.uleb128 0x18
	.byte	0x1
	.4byte	0x71
	.4byte	0x843
	.uleb128 0x19
	.4byte	0x68e
	.byte	0
	.uleb128 0x9
	.byte	0x8
	.4byte	0x833
	.uleb128 0xa
	.byte	0x10
	.byte	0xb
	.byte	0x68
	.4byte	0x86e
	.uleb128 0x7
	.4byte	.LASF28
	.byte	0xb
	.byte	0x68
	.4byte	0x68e
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.4byte	.LASF29
	.byte	0xb
	.byte	0x68
	.4byte	0x694
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.byte	0x8
	.4byte	0x7b9
	.uleb128 0xa
	.byte	0x10
	.byte	0xb
	.byte	0x71
	.4byte	0x899
	.uleb128 0x7
	.4byte	.LASF28
	.byte	0xb
	.byte	0x71
	.4byte	0x5ce
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.4byte	.LASF29
	.byte	0xb
	.byte	0x71
	.4byte	0x5d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0
	.uleb128 0xa
	.byte	0x10
	.byte	0xb
	.byte	0x72
	.4byte	0x8be
	.uleb128 0x7
	.4byte	.LASF28
	.byte	0xb
	.byte	0x72
	.4byte	0x5ce
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.4byte	.LASF29
	.byte	0xb
	.byte	0x72
	.4byte	0x5d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0
	.uleb128 0x13
	.4byte	.LASF108
	.byte	0xb
	.byte	0x84
	.4byte	0x5da
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	.LASF109
	.byte	0xb
	.byte	0x86
	.4byte	0x1c4
	.byte	0x1
	.byte	0x1
	.uleb128 0xa
	.byte	0x8
	.byte	0xc
	.byte	0x37
	.4byte	0x8ef
	.uleb128 0x7
	.4byte	.LASF22
	.byte	0xc
	.byte	0x37
	.4byte	0x918
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x1b
	.string	"pgt"
	.byte	0x10
	.byte	0xc
	.byte	0x2b
	.4byte	0x918
	.uleb128 0x8
	.string	"tbl"
	.byte	0xc
	.byte	0x2c
	.4byte	0x398
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.4byte	.LASF21
	.byte	0xc
	.byte	0x37
	.4byte	0x8d8
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.byte	0x8
	.4byte	0x8ef
	.uleb128 0x6
	.4byte	.LASF110
	.byte	0x8
	.byte	0xc
	.byte	0x43
	.4byte	0x939
	.uleb128 0x7
	.4byte	.LASF18
	.byte	0xc
	.byte	0x43
	.4byte	0x918
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x6
	.4byte	.LASF111
	.byte	0x24
	.byte	0xd
	.byte	0x30
	.4byte	0x9c4
	.uleb128 0x7
	.4byte	.LASF112
	.byte	0xd
	.byte	0x31
	.4byte	0x71
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.4byte	.LASF113
	.byte	0xd
	.byte	0x32
	.4byte	0x71
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x7
	.4byte	.LASF114
	.byte	0xd
	.byte	0x33
	.4byte	0x71
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x7
	.4byte	.LASF115
	.byte	0xd
	.byte	0x34
	.4byte	0x71
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x7
	.4byte	.LASF116
	.byte	0xd
	.byte	0x35
	.4byte	0x71
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x7
	.4byte	.LASF117
	.byte	0xd
	.byte	0x36
	.4byte	0x71
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x7
	.4byte	.LASF118
	.byte	0xd
	.byte	0x37
	.4byte	0x71
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x7
	.4byte	.LASF119
	.byte	0xd
	.byte	0x38
	.4byte	0x71
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x7
	.4byte	.LASF120
	.byte	0xd
	.byte	0x39
	.4byte	0x71
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.byte	0
	.uleb128 0x13
	.4byte	.LASF111
	.byte	0xd
	.byte	0x3b
	.4byte	0x939
	.byte	0x1
	.byte	0x1
	.uleb128 0xa
	.byte	0x10
	.byte	0xd
	.byte	0x3e
	.4byte	0x9f6
	.uleb128 0x7
	.4byte	.LASF34
	.byte	0xd
	.byte	0x3e
	.4byte	0x5ce
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.4byte	.LASF35
	.byte	0xd
	.byte	0x3e
	.4byte	0x5d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0
	.uleb128 0x6
	.4byte	.LASF121
	.byte	0x40
	.byte	0xd
	.byte	0x3d
	.4byte	0xa65
	.uleb128 0x7
	.4byte	.LASF122
	.byte	0xd
	.byte	0x3e
	.4byte	0x9d1
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.string	"ctx"
	.byte	0xd
	.byte	0x3f
	.4byte	0x68e
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x7
	.4byte	.LASF110
	.byte	0xd
	.byte	0x40
	.4byte	0x91e
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x7
	.4byte	.LASF123
	.byte	0xd
	.byte	0x41
	.4byte	0x398
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x7
	.4byte	.LASF124
	.byte	0xd
	.byte	0x42
	.4byte	0x6fc
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x7
	.4byte	.LASF125
	.byte	0xd
	.byte	0x43
	.4byte	0x88
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x7
	.4byte	.LASF126
	.byte	0xd
	.byte	0x44
	.4byte	0xa5
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.byte	0
	.uleb128 0xf
	.4byte	.LASF127
	.2byte	0x220
	.byte	0xd
	.byte	0x47
	.4byte	0xa9f
	.uleb128 0x8
	.string	"vfp"
	.byte	0xd
	.byte	0x48
	.4byte	0x274
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.4byte	.LASF128
	.byte	0xd
	.byte	0x49
	.4byte	0x14e
	.byte	0x3
	.byte	0x23
	.uleb128 0x210
	.uleb128 0x7
	.4byte	.LASF129
	.byte	0xd
	.byte	0x4a
	.4byte	0x14e
	.byte	0x3
	.byte	0x23
	.uleb128 0x211
	.byte	0
	.uleb128 0x6
	.4byte	.LASF130
	.byte	0x40
	.byte	0xd
	.byte	0x5a
	.4byte	0xb14
	.uleb128 0x8
	.string	"a0"
	.byte	0xd
	.byte	0x5b
	.4byte	0x88
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.string	"a1"
	.byte	0xd
	.byte	0x5c
	.4byte	0x88
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.string	"a2"
	.byte	0xd
	.byte	0x5d
	.4byte	0x88
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x8
	.string	"a3"
	.byte	0xd
	.byte	0x5e
	.4byte	0x88
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x8
	.string	"a4"
	.byte	0xd
	.byte	0x5f
	.4byte	0x88
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x8
	.string	"a5"
	.byte	0xd
	.byte	0x60
	.4byte	0x88
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x8
	.string	"a6"
	.byte	0xd
	.byte	0x61
	.4byte	0x88
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x8
	.string	"a7"
	.byte	0xd
	.byte	0x62
	.4byte	0x88
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.byte	0
	.uleb128 0x4
	.4byte	.LASF131
	.byte	0xd
	.byte	0xcc
	.4byte	0xb1f
	.uleb128 0x9
	.byte	0x8
	.4byte	0xb25
	.uleb128 0x1a
	.byte	0x1
	.4byte	0xb31
	.uleb128 0x19
	.4byte	0xb31
	.byte	0
	.uleb128 0x9
	.byte	0x8
	.4byte	0xa9f
	.uleb128 0x4
	.4byte	.LASF132
	.byte	0xd
	.byte	0xcd
	.4byte	0xb42
	.uleb128 0x9
	.byte	0x8
	.4byte	0xb48
	.uleb128 0x1c
	.byte	0x1
	.uleb128 0x4
	.4byte	.LASF133
	.byte	0xd
	.byte	0xce
	.4byte	0xb55
	.uleb128 0x9
	.byte	0x8
	.4byte	0xb5b
	.uleb128 0x18
	.byte	0x1
	.4byte	0x93
	.4byte	0xb70
	.uleb128 0x19
	.4byte	0x93
	.uleb128 0x19
	.4byte	0x93
	.byte	0
	.uleb128 0x13
	.4byte	.LASF134
	.byte	0xe
	.byte	0x2d
	.4byte	0x3f
	.byte	0x1
	.byte	0x1
	.uleb128 0xd
	.4byte	0x434
	.4byte	0xb88
	.uleb128 0x15
	.byte	0
	.uleb128 0x5
	.4byte	0xb7d
	.uleb128 0x13
	.4byte	.LASF135
	.byte	0xe
	.byte	0x2e
	.4byte	0xb88
	.byte	0x1
	.byte	0x1
	.uleb128 0x6
	.4byte	.LASF136
	.byte	0x18
	.byte	0xf
	.byte	0x27
	.4byte	0xbdf
	.uleb128 0x7
	.4byte	.LASF137
	.byte	0xf
	.byte	0x28
	.4byte	0xc4c
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.4byte	.LASF138
	.byte	0xf
	.byte	0x29
	.4byte	0xc52
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x7
	.4byte	.LASF139
	.byte	0xf
	.byte	0x2a
	.4byte	0x71
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x7
	.4byte	.LASF52
	.byte	0xf
	.byte	0x2b
	.4byte	0x71
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.byte	0
	.uleb128 0x6
	.4byte	.LASF140
	.byte	0x30
	.byte	0xf
	.byte	0x2f
	.4byte	0xc4c
	.uleb128 0x7
	.4byte	.LASF141
	.byte	0xf
	.byte	0x30
	.4byte	0xc63
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.string	"lo"
	.byte	0xf
	.byte	0x31
	.4byte	0xc0
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.string	"hi"
	.byte	0xf
	.byte	0x32
	.4byte	0xc0
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x7
	.4byte	.LASF90
	.byte	0xf
	.byte	0x33
	.4byte	0x71
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x7
	.4byte	.LASF142
	.byte	0xf
	.byte	0x34
	.4byte	0x4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x7
	.4byte	.LASF143
	.byte	0xf
	.byte	0x35
	.4byte	0x81
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x7
	.4byte	.LASF144
	.byte	0xf
	.byte	0x37
	.4byte	0xa5
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.byte	0
	.uleb128 0x9
	.byte	0x8
	.4byte	0xbdf
	.uleb128 0x9
	.byte	0x8
	.4byte	0xb9a
	.uleb128 0x4
	.4byte	.LASF145
	.byte	0xf
	.byte	0x2d
	.4byte	0xb9a
	.uleb128 0x9
	.byte	0x8
	.4byte	0xc58
	.uleb128 0x4
	.4byte	.LASF146
	.byte	0xf
	.byte	0x3a
	.4byte	0xbdf
	.uleb128 0x13
	.4byte	.LASF147
	.byte	0xf
	.byte	0x3d
	.4byte	0xc69
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	.LASF148
	.byte	0xf
	.byte	0x40
	.4byte	0xc69
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	.LASF149
	.byte	0xf
	.byte	0x43
	.4byte	0xc69
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	.LASF150
	.byte	0x10
	.byte	0x12
	.4byte	0x14e
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	.LASF151
	.byte	0x10
	.byte	0x13
	.4byte	0x71
	.byte	0x1
	.byte	0x1
	.uleb128 0xd
	.4byte	0x88
	.4byte	0xcc5
	.uleb128 0xe
	.4byte	0xcb
	.byte	0x1e
	.byte	0
	.uleb128 0x13
	.4byte	.LASF152
	.byte	0x11
	.byte	0xb1
	.4byte	0x93
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	.LASF153
	.byte	0x11
	.byte	0xb2
	.4byte	0x93
	.byte	0x1
	.byte	0x1
	.uleb128 0x6
	.4byte	.LASF154
	.byte	0x10
	.byte	0x11
	.byte	0xc2
	.4byte	0xd08
	.uleb128 0x7
	.4byte	.LASF155
	.byte	0x11
	.byte	0xc3
	.4byte	0x88
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.4byte	.LASF156
	.byte	0x11
	.byte	0xc4
	.4byte	0x71
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0
	.uleb128 0xb
	.4byte	.LASF157
	.byte	0x4
	.4byte	0x81
	.byte	0x12
	.byte	0x28
	.4byte	0xd2b
	.uleb128 0xc
	.4byte	.LASF158
	.byte	0
	.uleb128 0xc
	.4byte	.LASF159
	.byte	0x1
	.uleb128 0xc
	.4byte	.LASF160
	.byte	0x2
	.byte	0
	.uleb128 0xf
	.4byte	.LASF161
	.2byte	0x110
	.byte	0x12
	.byte	0x48
	.4byte	0xd6d
	.uleb128 0x8
	.string	"sp"
	.byte	0x12
	.byte	0x49
	.4byte	0x88
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.string	"pc"
	.byte	0x12
	.byte	0x4a
	.4byte	0x88
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x7
	.4byte	.LASF162
	.byte	0x12
	.byte	0x4b
	.4byte	0x88
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x8
	.string	"x"
	.byte	0x12
	.byte	0x4c
	.4byte	0xcb5
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.byte	0
	.uleb128 0xf
	.4byte	.LASF163
	.2byte	0x440
	.byte	0x12
	.byte	0x59
	.4byte	0xdd0
	.uleb128 0x7
	.4byte	.LASF164
	.byte	0x12
	.byte	0x5a
	.4byte	0x14e
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.4byte	.LASF165
	.byte	0x12
	.byte	0x5b
	.4byte	0x14e
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x7
	.4byte	.LASF166
	.byte	0x12
	.byte	0x5c
	.4byte	0x14e
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x8
	.string	"ns"
	.byte	0x12
	.byte	0x5d
	.4byte	0x274
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x8
	.string	"sec"
	.byte	0x12
	.byte	0x5e
	.4byte	0x274
	.byte	0x3
	.byte	0x23
	.uleb128 0x220
	.uleb128 0x7
	.4byte	.LASF167
	.byte	0x12
	.byte	0x5f
	.4byte	0xdd0
	.byte	0x3
	.byte	0x23
	.uleb128 0x430
	.byte	0
	.uleb128 0x9
	.byte	0x8
	.4byte	0xa65
	.uleb128 0xf
	.4byte	.LASF168
	.2byte	0x600
	.byte	0x12
	.byte	0x64
	.4byte	0xeb5
	.uleb128 0x7
	.4byte	.LASF169
	.byte	0x12
	.byte	0x65
	.4byte	0xd2b
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.4byte	.LASF170
	.byte	0x12
	.byte	0x66
	.4byte	0xd08
	.byte	0x3
	.byte	0x23
	.uleb128 0x110
	.uleb128 0x7
	.4byte	.LASF171
	.byte	0x12
	.byte	0x67
	.4byte	0xb5
	.byte	0x3
	.byte	0x23
	.uleb128 0x118
	.uleb128 0x7
	.4byte	.LASF172
	.byte	0x12
	.byte	0x68
	.4byte	0x71
	.byte	0x3
	.byte	0x23
	.uleb128 0x120
	.uleb128 0x7
	.4byte	.LASF90
	.byte	0x12
	.byte	0x69
	.4byte	0x71
	.byte	0x3
	.byte	0x23
	.uleb128 0x124
	.uleb128 0x7
	.4byte	.LASF155
	.byte	0x12
	.byte	0x6a
	.4byte	0xcdf
	.byte	0x3
	.byte	0x23
	.uleb128 0x128
	.uleb128 0x7
	.4byte	.LASF173
	.byte	0x12
	.byte	0x6b
	.4byte	0x14e
	.byte	0x3
	.byte	0x23
	.uleb128 0x138
	.uleb128 0x7
	.4byte	.LASF174
	.byte	0x12
	.byte	0x6d
	.4byte	0xb5
	.byte	0x3
	.byte	0x23
	.uleb128 0x140
	.uleb128 0x7
	.4byte	.LASF37
	.byte	0x12
	.byte	0x70
	.4byte	0xd6d
	.byte	0x3
	.byte	0x23
	.uleb128 0x150
	.uleb128 0x7
	.4byte	.LASF175
	.byte	0x12
	.byte	0x72
	.4byte	0x398
	.byte	0x3
	.byte	0x23
	.uleb128 0x590
	.uleb128 0x7
	.4byte	.LASF176
	.byte	0x12
	.byte	0x73
	.4byte	0x88
	.byte	0x3
	.byte	0x23
	.uleb128 0x598
	.uleb128 0x7
	.4byte	.LASF177
	.byte	0x12
	.byte	0x74
	.4byte	0x6fc
	.byte	0x3
	.byte	0x23
	.uleb128 0x5a0
	.uleb128 0x7
	.4byte	.LASF178
	.byte	0x12
	.byte	0x75
	.4byte	0x222
	.byte	0x3
	.byte	0x23
	.uleb128 0x5a8
	.uleb128 0x8
	.string	"tsd"
	.byte	0x12
	.byte	0x76
	.4byte	0x9f6
	.byte	0x3
	.byte	0x23
	.uleb128 0x5b8
	.byte	0
	.uleb128 0x13
	.4byte	.LASF179
	.byte	0x12
	.byte	0xab
	.4byte	0x4b0
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	.LASF180
	.byte	0x12
	.byte	0xac
	.4byte	0x7c
	.byte	0x1
	.byte	0x1
	.uleb128 0xd
	.4byte	0xdd6
	.4byte	0xeda
	.uleb128 0x15
	.byte	0
	.uleb128 0x13
	.4byte	.LASF181
	.byte	0x12
	.byte	0xad
	.4byte	0xecf
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	.LASF182
	.byte	0x12
	.byte	0xae
	.4byte	0xb14
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	.LASF183
	.byte	0x12
	.byte	0xaf
	.4byte	0xb37
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	.LASF184
	.byte	0x12
	.byte	0xb0
	.4byte	0xb4a
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	.LASF185
	.byte	0x12
	.byte	0xb1
	.4byte	0xb4a
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	.LASF186
	.byte	0x12
	.byte	0xb2
	.4byte	0xb4a
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	.LASF187
	.byte	0x12
	.byte	0xb3
	.4byte	0xb4a
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	.LASF188
	.byte	0x12
	.byte	0xb4
	.4byte	0xb4a
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	.LASF189
	.byte	0x12
	.byte	0xb5
	.4byte	0xb4a
	.byte	0x1
	.byte	0x1
	.uleb128 0x1d
	.byte	0x1
	.4byte	.LASF193
	.byte	0x1
	.byte	0x26
	.byte	0x1
	.8byte	.LFB73
	.8byte	.LFE73
	.byte	0x2
	.byte	0x8f
	.sleb128 0
	.byte	0x1
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x8
	.byte	0
	.2byte	0
	.2byte	0
	.8byte	.LFB73
	.8byte	.LFE73-.LFB73
	.8byte	0
	.8byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.8byte	.LFB73
	.8byte	.LFE73
	.8byte	0
	.8byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF187:
	.string	"thread_cpu_resume_handler_ptr"
.LASF172:
	.string	"hyp_clnt_id"
.LASF97:
	.string	"mobj"
.LASF107:
	.string	"get_instance_id"
.LASF155:
	.string	"user_map"
.LASF77:
	.string	"link_tsd"
.LASF148:
	.string	"tee_mm_vcore"
.LASF75:
	.string	"ta_params"
.LASF101:
	.string	"tee_ta_ops"
.LASF83:
	.string	"ref_count"
.LASF56:
	.string	"millis"
.LASF51:
	.string	"buffer"
.LASF127:
	.string	"thread_user_vfp_state"
.LASF173:
	.string	"have_user_map"
.LASF193:
	.string	"__defines"
.LASF8:
	.string	"unsigned int"
.LASF138:
	.string	"next"
.LASF84:
	.string	"refc_cv"
.LASF102:
	.string	"enter_open_session"
.LASF71:
	.string	"__malloc_spinlock"
.LASF14:
	.string	"paddr_t"
.LASF67:
	.string	"USER_TA_PROP_TYPE_BINARY_BLOCK"
.LASF151:
	.string	"migrate_pid"
.LASF33:
	.string	"mutex_head"
.LASF156:
	.string	"asid"
.LASF53:
	.string	"memref"
.LASF28:
	.string	"tqe_next"
.LASF105:
	.string	"dump_state"
.LASF186:
	.string	"thread_cpu_suspend_handler_ptr"
.LASF190:
	.string	"GNU C99 6.2.1 20161016 -mstrict-align -mgeneral-regs-only -march=armv8-a -mlittle-endian -mabi=lp64 -g -gdwarf-2 -O0 -std=gnu99 -ffunction-sections -fdata-sections"
.LASF133:
	.string	"thread_pm_handler_t"
.LASF27:
	.string	"MUTEX_VALUE_LOCKED"
.LASF126:
	.string	"rpc_fs_payload_size"
.LASF161:
	.string	"thread_ctx_regs"
.LASF169:
	.string	"regs"
.LASF103:
	.string	"enter_invoke_cmd"
.LASF73:
	.string	"ta_num_props"
.LASF93:
	.string	"busy"
.LASF7:
	.string	"uint32_t"
.LASF29:
	.string	"tqe_prev"
.LASF48:
	.string	"login"
.LASF131:
	.string	"thread_smc_handler_t"
.LASF66:
	.string	"USER_TA_PROP_TYPE_STRING"
.LASF91:
	.string	"panicked"
.LASF30:
	.string	"mutex"
.LASF142:
	.string	"shift"
.LASF87:
	.string	"unlink"
.LASF175:
	.string	"rpc_arg"
.LASF112:
	.string	"std_smc_entry"
.LASF129:
	.string	"saved"
.LASF192:
	.string	"/home/rex/devel/optee/optee_os"
.LASF152:
	.string	"default_nsec_shm_paddr"
.LASF189:
	.string	"thread_system_reset_handler_ptr"
.LASF146:
	.string	"tee_mm_pool_t"
.LASF31:
	.string	"value"
.LASF183:
	.string	"thread_nintr_handler_ptr"
.LASF82:
	.string	"user_ctx"
.LASF176:
	.string	"rpc_carg"
.LASF113:
	.string	"fast_smc_entry"
.LASF12:
	.string	"size_t"
.LASF78:
	.string	"clnt_id"
.LASF139:
	.string	"offset"
.LASF26:
	.string	"MUTEX_VALUE_UNLOCKED"
.LASF23:
	.string	"_Bool"
.LASF128:
	.string	"lazy_saved"
.LASF157:
	.string	"thread_state"
.LASF49:
	.string	"uuid"
.LASF58:
	.string	"TEE_ErrorOrigin"
.LASF154:
	.string	"core_mmu_user_map"
.LASF61:
	.string	"user_ta_prop_type"
.LASF13:
	.string	"vaddr_t"
.LASF100:
	.string	"types"
.LASF136:
	.string	"_tee_mm_entry_t"
.LASF40:
	.string	"cpacr_el1"
.LASF110:
	.string	"pgt_cache"
.LASF164:
	.string	"ns_saved"
.LASF42:
	.string	"TEE_Result"
.LASF59:
	.string	"char"
.LASF72:
	.string	"ta_props"
.LASF160:
	.string	"THREAD_STATE_ACTIVE"
.LASF145:
	.string	"tee_mm_entry_t"
.LASF96:
	.string	"param_mem"
.LASF123:
	.string	"rpc_fs_payload"
.LASF185:
	.string	"thread_cpu_off_handler_ptr"
.LASF120:
	.string	"system_reset_entry"
.LASF88:
	.string	"tee_ta_ctx_head"
.LASF39:
	.string	"fpcr"
.LASF178:
	.string	"mutexes"
.LASF4:
	.string	"uint8_t"
.LASF64:
	.string	"USER_TA_PROP_TYPE_UUID"
.LASF85:
	.string	"lock_cv"
.LASF171:
	.string	"stack_va_end"
.LASF167:
	.string	"uvfp"
.LASF38:
	.string	"fpsr"
.LASF124:
	.string	"rpc_fs_payload_mobj"
.LASF143:
	.string	"lock"
.LASF16:
	.string	"wait_queue"
.LASF135:
	.string	"trace_ext_prefix"
.LASF121:
	.string	"thread_specific_data"
.LASF24:
	.string	"condvar"
.LASF57:
	.string	"TEE_Time"
.LASF153:
	.string	"default_nsec_shm_size"
.LASF60:
	.string	"mutex_value"
.LASF62:
	.string	"USER_TA_PROP_TYPE_BOOL"
.LASF140:
	.string	"_tee_mm_pool_t"
.LASF108:
	.string	"tee_ctxes"
.LASF150:
	.string	"found_mp"
.LASF89:
	.string	"tee_ta_ctx"
.LASF44:
	.string	"timeMid"
.LASF52:
	.string	"size"
.LASF109:
	.string	"tee_ta_mutex"
.LASF41:
	.string	"force_save"
.LASF159:
	.string	"THREAD_STATE_SUSPENDED"
.LASF43:
	.string	"timeLow"
.LASF55:
	.string	"seconds"
.LASF17:
	.string	"wait_queue_elem"
.LASF116:
	.string	"cpu_resume_entry"
.LASF177:
	.string	"rpc_mobj"
.LASF180:
	.string	"stack_tmp_stride"
.LASF158:
	.string	"THREAD_STATE_FREE"
.LASF20:
	.string	"done"
.LASF46:
	.string	"clockSeqAndNode"
.LASF104:
	.string	"enter_close_session"
.LASF18:
	.string	"slh_first"
.LASF188:
	.string	"thread_system_off_handler_ptr"
.LASF5:
	.string	"uint16_t"
.LASF25:
	.string	"spin_lock"
.LASF90:
	.string	"flags"
.LASF76:
	.string	"tee_ta_session"
.LASF81:
	.string	"cancel_time"
.LASF191:
	.string	"core/arch/arm/kernel/asm-defines.c"
.LASF163:
	.string	"thread_vfp_state"
.LASF1:
	.string	"short int"
.LASF130:
	.string	"thread_smc_args"
.LASF45:
	.string	"timeHiAndVersion"
.LASF2:
	.string	"long int"
.LASF166:
	.string	"sec_lazy_saved"
.LASF144:
	.string	"max_allocated"
.LASF117:
	.string	"cpu_suspend_entry"
.LASF9:
	.string	"uint64_t"
.LASF36:
	.string	"vfp_reg"
.LASF95:
	.string	"param_val"
.LASF147:
	.string	"tee_mm_sec_ddr"
.LASF182:
	.string	"thread_std_smc_handler_ptr"
.LASF69:
	.string	"name"
.LASF162:
	.string	"cpsr"
.LASF149:
	.string	"tee_mm_shm"
.LASF47:
	.string	"TEE_UUID"
.LASF11:
	.string	"uintptr_t"
.LASF92:
	.string	"panic_code"
.LASF34:
	.string	"tqh_first"
.LASF165:
	.string	"sec_saved"
.LASF15:
	.string	"sizetype"
.LASF50:
	.string	"TEE_Identity"
.LASF10:
	.string	"long unsigned int"
.LASF111:
	.string	"thread_vector_table"
.LASF122:
	.string	"sess_stack"
.LASF181:
	.string	"threads"
.LASF184:
	.string	"thread_cpu_on_handler_ptr"
.LASF125:
	.string	"rpc_fs_payload_cookie"
.LASF118:
	.string	"fiq_entry"
.LASF134:
	.string	"trace_level"
.LASF141:
	.string	"entry"
.LASF70:
	.string	"type"
.LASF132:
	.string	"thread_nintr_handler_t"
.LASF3:
	.string	"unsigned char"
.LASF106:
	.string	"destroy"
.LASF63:
	.string	"USER_TA_PROP_TYPE_U32"
.LASF21:
	.string	"link"
.LASF68:
	.string	"user_ta_property"
.LASF65:
	.string	"USER_TA_PROP_TYPE_IDENTITY"
.LASF80:
	.string	"cancel_mask"
.LASF98:
	.string	"offs"
.LASF79:
	.string	"cancel"
.LASF170:
	.string	"state"
.LASF35:
	.string	"tqh_last"
.LASF114:
	.string	"cpu_on_entry"
.LASF32:
	.string	"owner_id"
.LASF0:
	.string	"signed char"
.LASF99:
	.string	"tee_ta_param"
.LASF6:
	.string	"short unsigned int"
.LASF168:
	.string	"thread_ctx"
.LASF19:
	.string	"handle"
.LASF22:
	.string	"sle_next"
.LASF179:
	.string	"stack_tmp_export"
.LASF119:
	.string	"system_off_entry"
.LASF86:
	.string	"lock_thread"
.LASF54:
	.string	"TEE_Param"
.LASF94:
	.string	"busy_cv"
.LASF37:
	.string	"vfp_state"
.LASF74:
	.string	"ta_param_types"
.LASF115:
	.string	"cpu_off_entry"
.LASF137:
	.string	"pool"
.LASF174:
	.string	"kern_sp"
	.ident	"GCC: (Linaro GCC 6.2-2016.11) 6.2.1 20161016"
	.section	.note.GNU-stack,"",@progbits
