; ÇN: Hepsini çeviremedim, isterseniz buyrun açıklamaları: https://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf
mov ah, 0x0e

; deneme 1
; Başarısız olur.
mov al, "1"
int 0x10
mov al, the_secret
int 0x10

; deneme 2
mov al, "2"
int 0x10
mov al, [the_secret]
int 0x10

; deneme 3
mov al, "3"
int 0x10
mov bx, the_secret
add bx, 0x7c00
mov al, [bx]
int 0x10

; deneme 4
mov al, "4"
int 0x10
mov al, [0x7c2d]
int 0x10


jmp $ ; infinite loop

the_secret:
    db "X"
times 510-($-$$) db 0
dw 0xaa55
