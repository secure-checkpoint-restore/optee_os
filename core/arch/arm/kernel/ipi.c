/*
	rex_do 2018-12-16
*/
#include <keep.h>
#include <kernel/interrupt.h>
#include <kernel/misc.h>
#include <kernel/thread.h>
#include <platform_config.h>
#include <trace.h>
#include <kernel/ipi.h>
#include <assert.h>
#include <initcall.h>
#include <kernel/proc.h>

#define MIGRATE_GO	11
#define MIGRATE_BACK	12

extern struct proc procs[];
#ifdef MIGRATE_GO
static enum itr_return ipi_mg_handle(struct itr_handler *handler __unused)
{
	struct proc *mp = &procs[migrate_pid];
	mp->prio = 0;
	mp->user_regs.spsr =0x180;
	mp->user_regs.x[29]= mp->user_regs.sp;
	enqueue(mp);
	return ITRR_HANDLED;
}
KEEP_PAGER(ipi_mg_handle);

struct itr_handler ipi_mg_itr = {
	.it = MIGRATE_GO,
	.handler = ipi_mg_handle,
};

static TEE_Result init_ipi_mg(void)
{
	itr_add(&ipi_mg_itr);
	itr_enable(MIGRATE_GO);
	return TEE_SUCCESS;
}
driver_init(init_ipi_mg);
#endif

#ifdef MIGRATE_BACK
static enum itr_return ipi_mb_handle(struct itr_handler *handler __unused)
{
        size_t core_num = get_core_pos();

        assert(core_num < CFG_TEE_CORE_NB_CORE);

        DMSG("SGI interrupt handle cpu: %u\n", (uint32_t)core_num);

        return ITRR_HANDLED;
}
KEEP_PAGER(ipi_mb_handle);

struct itr_handler ipi_mb_itr = {
        .it = MIGRATE_BACK,
        .handler = ipi_mb_handle,
};

static TEE_Result init_ipi_mb(void)
{
        itr_add(&ipi_mb_itr);
        itr_enable(MIGRATE_BACK);
        return TEE_SUCCESS;
}
driver_init(init_ipi_mb);

#endif

void raise_ipi(uint32_t mode, uint32_t cpu_id)
{
	switch(mode)
	{
		case IPI_MG:
		{
			itr_raise_sgi(MIGRATE_GO, (uint8_t)(1 << cpu_id));
			break;
		}
		case IPI_MB:
		{
			itr_raise_sgi(MIGRATE_BACK, (uint8_t)(1 << cpu_id));
			break;
		}
		default:
			return;
	}
}

