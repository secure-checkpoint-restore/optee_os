/*	
	rex_do 2018-12-16
*/
#ifndef KERNEL_IPI_H
#define KERNEL_IPI_H

enum ipi_mode
{
	IPI_MG = 0,
	IPI_MB,
};

void raise_ipi(uint32_t mode, uint32_t cpu_id);
#endif
