*Önceden araştırmak isteyebileceğiniz bazı konular: interrupts, CPU
registers*

**Hedef: Önceki önyükleme sektörümüzün bazı yazılar yazmasını sağlamak**

Sonsuz döngü önyükleme sektörümüzü biraz iyileştireceğiz ve yazdıracağız ekranda bir şey. Bunun için bir kesme salacağız.

Bu örnekte "Merhaba" kelimesinin her karakterini yazacağız. "al" yazmacına kelime ("ax" ın alt kısmı), bayt "0x0e" "ah" a ("balta" nın yüksek kısmı) ve "0x10" kesmesini yükseltin görüntü hizmetleri için genel bir kesmedir.

"Ah" üzerindeki "0x0e", video kesintisine, çalıştırmak istediğimiz asıl işlevin 'tty modunda `al`'ın içeriğini yaz' olduğunu söyler.

Tty modunu yalnızca bir kez ayarlayacağız, ancak gerçek dünyada "ah" ın içeriğinin sabit olduğundan emin olamayız. Biz uyurken işlemci üzerinde başka bir işlem çalışabilir, düzgün temizlenmeyebilir ve gereksiz verileri `ah`'da bırakabilir.

Bu örnek için, işlemci üzerinde çalışan tek şey biz olduğumuz için bununla ilgilenmemize gerek yok.

Yeni önyükleme sektörümüz şöyle gözüküyor:
```nasm
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
```

İkili verileri `xxd file.bin` ile inceleyebilirsiniz.

Her neyse, ne yapacağını biliyorsun:

`nasm -fbin boot_sect_hello.asm -o boot_sect_hello.bin`

`qemu boot_sect_hello.bin`

Önyükleme sektörünüz 'Merhaba' diyecek ve sonsuz bir döngüde kalacak
