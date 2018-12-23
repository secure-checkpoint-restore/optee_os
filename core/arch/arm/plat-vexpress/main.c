/*
 * Copyright (c) 2016, Linaro Limited
 * Copyright (c) 2014, STMicroelectronics International N.V.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

#include <platform_config.h>

#include <stdint.h>
#include <string.h>

#include <drivers/gic.h>
#include <drivers/pl011.h>
#include <drivers/tzc400.h>

#include <arm.h>
#include <kernel/generic_boot.h>
#include <kernel/pm_stubs.h>
#include <trace.h>
#include <kernel/misc.h>
#include <kernel/panic.h>
#include <kernel/tee_time.h>
#include <tee/entry_fast.h>
#include <tee/entry_std.h>
#include <mm/core_memprot.h>
#include <mm/core_mmu.h>
#include <console.h>
#include <keep.h>
#include <initcall.h>


static void main_fiq(void);

static const struct thread_handlers handlers = {
	.std_smc = tee_entry_std,
	.fast_smc = tee_entry_fast,
	.nintr = main_fiq,
#if defined(CFG_WITH_ARM_TRUSTED_FW)
	.cpu_on = cpu_on_handler,
	.cpu_off = pm_do_nothing,
	.cpu_suspend = pm_do_nothing,
	.cpu_resume = pm_do_nothing,
	.system_off = pm_do_nothing,
	.system_reset = pm_do_nothing,
#else
	.cpu_on = pm_panic,
	.cpu_off = pm_panic,
	.cpu_suspend = pm_panic,
	.cpu_resume = pm_panic,
	.system_off = pm_panic,
	.system_reset = pm_panic,
#endif
};

static struct gic_data gic_data;
static struct pl011_data console_data;

register_phys_mem(MEM_AREA_IO_SEC, CONSOLE_UART_BASE, PL011_REG_SIZE);
register_nsec_ddr(DRAM0_BASE, DRAM0_SIZE);

const struct thread_handlers *generic_boot_get_handlers(void)
{
	return &handlers;
}

#ifdef GIC_BASE

register_phys_mem(MEM_AREA_IO_SEC, GICD_BASE, GIC_DIST_REG_SIZE);
register_phys_mem(MEM_AREA_IO_SEC, GICC_BASE, GIC_DIST_REG_SIZE);

void main_init_gic(void)
{
	vaddr_t gicc_base;
	vaddr_t gicd_base;

	gicc_base = (vaddr_t)phys_to_virt(GIC_BASE + GICC_OFFSET,
					  MEM_AREA_IO_SEC);
	gicd_base = (vaddr_t)phys_to_virt(GIC_BASE + GICD_OFFSET,
					  MEM_AREA_IO_SEC);
	if (!gicc_base || !gicd_base)
		panic();

#if defined(PLATFORM_FLAVOR_fvp) || defined(PLATFORM_FLAVOR_juno) || \
	defined(PLATFORM_FLAVOR_qemu_armv8a)
	/* On ARMv8, GIC configuration is initialized in ARM-TF */
	gic_init_base_addr(&gic_data, gicc_base, gicd_base);
#else
	/* Initialize GIC */
	gic_init(&gic_data, gicc_base, gicd_base);
#endif
	itr_init(&gic_data.chip);
}
#endif

static void main_fiq(void)
{
	struct proc *p __maybe_unused = NULL;
	gic_it_handle(&gic_data);
	if(final_boot_finish && (uint32_t)get_core_pos() == get_tee_core_pos())
	{
		p = get_cur_proc();
        	if(p == NULL)
        	{
                	DMSG("no proc running!\n");
        	}
        	else if(p->rt_quota == 0)
        	{
			p->rt_quota = 1024;
			p->flags |= P_INTR;
                	enqueue(p);
        	}
		else
		{
			p->flags |= P_INTR;
                        enqueue_head(p);
		}
		proc_schedule();

	}
}

void console_init(void)
{
	pl011_init(&console_data, CONSOLE_UART_BASE, CONSOLE_UART_CLK_IN_HZ,
		   CONSOLE_BAUDRATE);
	register_serial_console(&console_data.chip);
}

#ifdef IT_CONSOLE_UART
static enum itr_return console_itr_cb(struct itr_handler *h __unused)
{
	struct serial_chip *cons = &console_data.chip;

	while (cons->ops->have_rx_data(cons)) {
		int ch __maybe_unused = cons->ops->getchar(cons);

		DMSG("cpu %zu: got 0x%x", get_core_pos(), ch);
	}
	return ITRR_HANDLED;
}

static struct itr_handler console_itr = {
	.it = IT_CONSOLE_UART,
	.flags = ITRF_TRIGGER_LEVEL,
	.handler = console_itr_cb,
};
KEEP_PAGER(console_itr);

static TEE_Result init_console_itr(void)
{
	itr_add(&console_itr);
	itr_enable(IT_CONSOLE_UART);
	return TEE_SUCCESS;
}
driver_init(init_console_itr);
#endif

#ifdef CFG_TZC400
register_phys_mem(MEM_AREA_IO_SEC, TZC400_BASE, TZC400_REG_SIZE);

static TEE_Result init_tzc400(void)
{
	void *va;

	DMSG("Initializing TZC400");

	va = phys_to_virt(TZC400_BASE, MEM_AREA_IO_SEC);
	if (!va) {
		EMSG("TZC400 not mapped");
		panic();
	}

	tzc_init((vaddr_t)va);
	tzc_dump_state();

	return TEE_SUCCESS;
}

service_init(init_tzc400);
#endif /*CFG_TZC400*/

//rex_do 2018-12-2
#ifdef IT_SECURE_TIMER

#define SYS_COUNTER_FREQ_IN_TICKS	((1000 * 1000 * 1000) / 16)

static void reset_secure_timer(void)
{
	uint64_t cval;
	uint32_t ctl = 0;
	/* Ensure that the timer did assert the interrupt */
	assert(read_cntps_ctl_el1() >> 2 & 1);
	/*
	 * Disable the timer and reprogram it. The barriers ensure that there is
	 * no reordering of instructions around the reprogramming code.
	 */
	isb();

	write_cntps_ctl_el1(0);
	
	cval = read_cntpct_el0() + (read_cntfrq_el0() >> 11);
	write_cntps_cval_el1(cval);

	/* Enable the secure physical timer */
	ctl |= 1 << 0; 
	write_cntps_ctl_el1(ctl);
	isb();
	
}

static enum itr_return timer_itr_cb(struct itr_handler *h __unused)
{
	struct proc *p = NULL;
        reset_secure_timer();
	p = get_cur_proc();
	if(p != NULL)
	{
		if(p->rt_quota > 0)
		{
			p->rt_quota--;
		}
	}
        return ITRR_HANDLED;                       
}

static struct itr_handler timer_itr = {
	.it = IT_SECURE_TIMER,
	.flags = ITRF_TRIGGER_LEVEL,
	.handler = timer_itr_cb,
};

KEEP_PAGER(timer_itr);

static TEE_Result init_secure_timer(void)
{
	
	itr_add(&timer_itr);
	itr_enable(IT_SECURE_TIMER);
	
	return TEE_SUCCESS;
}

driver_init(init_secure_timer);
#endif
