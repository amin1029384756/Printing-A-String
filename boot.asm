[org 0x7c00]
mov ah, 0x0e
mov bx, helloworld

print:
    mov al, [bx]
    cmp al, 0
    je end
    int 0x10
    inc bx
    jmp print

end:

helloworld:
    db "Hello World!", 0

times 510-($-$$) db 0
dw 0xaa55