mov ah, 0x0e ; tty modu
mov al, 'M'
int 0x10
mov al, 'e'
int 0x10
mov al, 'r'
int 0x10
mov al, 'h'
int 0x10
mov al, 'a'
int 0x10
mov al, 'b'
int 0x10
mov al, 'a'
int 0x10

jmp $ ; şu anki adrese atla = sonsuz döngü

; BIOS'a "bu sektör çalıştırılabilir" diyoruz.
times 510 - ($-$$) db 0
dw 0xaa55 
