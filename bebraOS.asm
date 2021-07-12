section .text
use16
org 0x7c00
start:
    mov ax, cs
    mov ds, ax
    mov es, ax
    cld
    mov ax,3
    int 10h
    mov si,msg
    call ps
    .lp
    mov ax,0
    int 16h
    ;ah -ASCII
    cmp al,27
    jz .q
    mov ah,0x0e
    int 10h
    cmp al,8
    jz .f
    jmp .l
    .f
    mov al,0
    int 10h
    mov al,8
    int 10h
    .l
    cmp al,13
    jz .j
    jmp .k
    .j
    mov al,8
    int 10h
    mov al,10
    int 10h
    mov al,13
    int 10h
    .k
    mov di,0xb800
    mov al,32
    stosb
    mov al,244
    stosb
    jmp .lp
    .q
    jmp $

ps:
    mov ah,0x0e
    .l
    lodsb
    test al,al
    jz .q
    int 10h
    jmp .l
    .q
    ret
msg  db 'Welcome to BebraOS', 10,13,0