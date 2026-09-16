OUTPUT_ARCH( "riscv" )
ENTRY( _entry )

BASE_ADDRESS = 0x80200000;

SECTIONS
{
    . = BASE_ADDRESS;

    .text : {
        KEEP(*(.text.entry))
        *(.text .text.*)
    }

    . = ALIGN(4K);

    .rodata : {
        *(.rodata .rodata.*)
    }

    . = ALIGN(4K);

    .data : {
        *(.data .data.*)
    }

    . = ALIGN(4K);

    .bss : {
        *(.bss .bss.*)
    }
}
