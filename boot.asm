[org 0x7c00]
mov ah, 0x0e
mov bx, welcomemessage

print:
    mov al, [bx]
    cmp al, 0
    je end
    int 0x10
    inc bx
    jmp print

end:
    mov ah, 0
    int 0x16
    cmp al, 1
    je help
    jg checkapps
    jl end
welcomemessage:
    db "Welcome To Akiva! To Get Help, Press 1. To View Your Apps, Press 2. To Modify User Settings, Press 3. To Shut Down, Press 4.", 0
checkapps:
    cmp al, 2
    je apps
    jg checksettings
checksettings:
    cmp al, 3
    je settings
    jg checkshutdown
checkshutdown:
    cmp al, 4
    je shutdown
    jg end
    jl end
help:
    mov ah, 0x0e
    mov al, "H"
    int 0x10
apps:
settings:
shutdown:
times 510-($-$$) db 0
dw 0xaa55