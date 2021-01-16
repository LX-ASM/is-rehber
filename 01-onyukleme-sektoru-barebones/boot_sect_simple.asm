; Sonsuz döngüye giren basit bir önyükleme sektör programı.
loop:
    jmp loop

times 510-($-$$) db 0
dw 0xaa55
