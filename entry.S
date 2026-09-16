.section .text.entry
.global _entry

_entry:
    la sp, boot_stack_top

    call kernel_main

1:
    j 1b

.section .bss.stack
.balign 16

boot_stack:
    .space 16384

boot_stack_top:
