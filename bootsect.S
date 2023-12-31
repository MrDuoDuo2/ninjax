.code16

.global _bootstart

.equ BOOTSEG, 0x07c0

.text
# 16-real model
# SEG:OFFSET e.g 0x07c0:0x0000 -> SEG<<4 + OFFSET = 0x07c00

ljmp $BOOTSEG, $_bootstart

_bootstart:
    mov $0x03, %ah
    int $0x10

    mov $BOOTSEG, %ax
    mov %ax, %es
    mov $_string, %bp
    mov $0x1301, %ax
    mov $0x000c, %bx
    mov $15, %cx
    int $0x10
loop:   jmp loop

_string:
    .ascii "Hello World!"
    .byte 13, 10, 13, 10
.= 510

signature:
    .word 0xaa55
    