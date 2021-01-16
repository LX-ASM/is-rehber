mov ah, 0x0e ; tty modu

mov bp, 0x8000 ; bu 0x7c00'den uzak bir adrestir, böylece üzerine yazılmamış mov sp, bp; yığın boşsa sp bp'yi gösterir

push 'A'
push 'B'
push 'C'

; yığının nasıl aşağı doğru büyüdüğünü göstermek için
mov al, [0x7ffe] ; 0x8000 - 2
int 0x10

; ancak, çalışmayacağı için şimdi [0x8000] 'e erişmeyi denemeyin
; yalnızca yığının tepesine erişebilirsiniz, bu nedenle bu noktada yalnızca 0x7ffe (yukarıya bakın)
mov al, [0x8000]
int 0x10


; karakterlerimizi standart prosedürü kullanarak kurtarın: 'pop'
; Sadece tam kelimeleri doldurabiliriz, bu yüzden manipüle etmek için bir yardımcı kayıt gerekir.
; alt bayt
pop bx
mov al, bl
int 0x10 ; prints C

pop bx
mov al, bl
int 0x10 ; prints B

pop bx
mov al, bl
int 0x10 ; prints A

; yığından çıkan veriler artık çöp
mov al, [0x8000]
int 0x10


jmp $
times 510-($-$$) db 0
dw 0xaa55
