OUTPUT_FORMAT(elf64-littleaarch64)
OUTPUT_ARCH(aarch64)
ENTRY(_start)
SECTIONS
{
 . = 0x06000000;
 __text_start = .;
 __flatmap_unpg_rx_start = (((__text_start) / (4096)) * (4096));
 .text : {
  KEEP(*(.text.boot.vectab1))
  KEEP(*(.text.boot.vectab2))
  KEEP(*(.text.boot))
  . = ALIGN(8);
  __initcall_start = .;
  KEEP(*(.initcall1))
  KEEP(*(.initcall2))
  KEEP(*(.initcall3))
  KEEP(*(.initcall4))
  __initcall_end = .;
  *(.text .text.*)
  *(.sram.text.glue_7* .gnu.linkonce.t.*)
  . = ALIGN(8);
 }
 __text_end = .;
 __flatmap_unpg_rx_size = . - __flatmap_unpg_rx_start;
 __flatmap_unpg_ro_start = .;
 .rodata : ALIGN(8) {
  __rodata_start = .;
  *(.gnu.linkonce.r.*)
  *(.rodata .rodata.*)
  . = ALIGN(8);
  __start_ta_head_section = . ;
  KEEP(*(ta_head_section))
  __stop_ta_head_section = . ;
  . = ALIGN(8);
  __start_phys_mem_map_section = . ;
  KEEP(*(phys_mem_map_section))
  __end_phys_mem_map_section = . ;
  . = ALIGN(8);
  __start_phys_sdp_mem_section = . ;
  KEEP(*(phys_sdp_mem_section))
  __end_phys_sdp_mem_section = . ;
  . = ALIGN(8);
  __start_phys_nsec_ddr_section = . ;
  KEEP(*(phys_nsec_ddr_section))
  __end_phys_nsec_ddr_section = . ;
  . = ALIGN(8);
  __rodata_end = .;
 }
 .interp : { *(.interp) }
 .hash : { *(.hash) }
 .dynsym : { *(.dynsym) }
 .dynstr : { *(.dynstr) }
 .rel.text : { *(.rel.text) *(.rel.gnu.linkonce.t*) }
 .rela.text : { *(.rela.text) *(.rela.gnu.linkonce.t*) }
 .rel.data : { *(.rel.data) *(.rel.gnu.linkonce.d*) }
 .rela.data : { *(.rela.data) *(.rela.gnu.linkonce.d*) }
 .rel.rodata : { *(.rel.rodata) *(.rel.gnu.linkonce.r*) }
 .rela.rodata : { *(.rela.rodata) *(.rela.gnu.linkonce.r*) }
 .rel.got : { *(.rel.got) }
 .rela.got : { *(.rela.got) }
 .rel.ctors : { *(.rel.ctors) }
 .rela.ctors : { *(.rela.ctors) }
 .rel.dtors : { *(.rel.dtors) }
 .rela.dtors : { *(.rela.dtors) }
 .rel.init : { *(.rel.init) }
 .rela.init : { *(.rela.init) }
 .rel.fini : { *(.rel.fini) }
 .rela.fini : { *(.rela.fini) }
 .rel.bss : { *(.rel.bss) }
 .rela.bss : { *(.rela.bss) }
 .rel.plt : { *(.rel.plt) }
 .rela.plt : { *(.rela.plt) }
 .init : { *(.init) } =0x9090
 .plt : { *(.plt) }
 .ARM.exidx : {
  __exidx_start = .;
  *(.ARM.exidx* .gnu.linkonce.armexidx.*)
  __exidx_end = .;
 }
 .ARM.extab : {
  __extab_start = .;
  *(.ARM.extab*)
  __extab_end = .;
 }
 . = ALIGN(4096);
 __flatmap_unpg_ro_size = . - __flatmap_unpg_ro_start;
 __flatmap_unpg_rw_start = .;
 .data : ALIGN(8) {
  __data_start_rom = .;
  __data_start = .;
  *(.data .data.* .gnu.linkonce.d.*)
  . = ALIGN(8);
 }
 .ctors : ALIGN(8) {
  __ctor_list = .;
  KEEP(*(.ctors .ctors.* .init_array .init_array.*))
  __ctor_end = .;
 }
 .dtors : ALIGN(8) {
  __dtor_list = .;
  KEEP(*(.dtors .dtors.* .fini_array .fini_array.*))
  __dtor_end = .;
 }
 .got : { *(.got.plt) *(.got) }
 .dynamic : { *(.dynamic) }
 .bss : {
  __data_end = .;
  __bss_start = .;
  *(.bss .bss.*)
  *(.gnu.linkonce.b.*)
  *(COMMON)
  . = ALIGN(8);
  __bss_end = .;
 }
 .heap1 (NOLOAD) : {
  __heap1_start = .;
  . += 65536;
  . = ALIGN(16 * 1024);
  __heap1_end = .;
 }
 .nozi (NOLOAD) : {
  __nozi_start = .;
  ASSERT(!(__nozi_start & (16 * 1024 - 1)), "align nozi to 16kB");
  KEEP(*(.nozi .nozi.*))
  . = ALIGN(16);
  __nozi_end = .;
  __nozi_stack_start = .;
  KEEP(*(.nozi_stack))
  . = ALIGN(8);
  __nozi_stack_end = .;
 }
 __end = .;
 __init_size = __data_end - 0x06000000;
 __init_mem_usage = __end - 0x06000000;
 ASSERT(. <= (0x06000000 + (2 * 1024 * 1024)),
  "CFG_TEE_RAM_VA_SIZE is too small")
 . = 0x06000000 + (2 * 1024 * 1024);
 _end_of_ram = .;
 __flatmap_unpg_rw_size = _end_of_ram - __flatmap_unpg_rw_start;
 /DISCARD/ : {
  *(.comment .note .eh_frame)
  *(__keep_meta_vars*)
 }
}
PROVIDE(__vcore_unpg_rx_start = __flatmap_unpg_rx_start);
PROVIDE(__vcore_unpg_ro_start = __flatmap_unpg_ro_start);
PROVIDE(__vcore_unpg_rx_size = __flatmap_unpg_rx_size +
    __flatmap_unpg_ro_size);
PROVIDE(__vcore_unpg_ro_size = 0);
PROVIDE(__vcore_unpg_rw_start = __flatmap_unpg_rw_start);
PROVIDE(__vcore_unpg_rw_size = __flatmap_unpg_rw_size);
