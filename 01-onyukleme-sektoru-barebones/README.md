*Okumadan önce araştırmak isteyebileceğiniz kelimeler: Assembler, BIOS*


**Hedef: BIOS'a kendini çalıştırılabilir bir disk olarak gösteren bir dosya oluşturmak**


Bu çok heyecanlı, kendi boot sektörümüzü yapacağız!


Teori
------

Bilgisayar başlatıldığında, BIOS işletim sistemini nasıl yükleyeceğini bilmez, bu nedenle bu görevi önyükleme sektörüne devreder. Bu nedenle, boot sektörü bilinen, standart bir konuma yerleştirilmelidir. Bu konum diskin ilk sektörüdür (silindir 0, kafa 0, sektör 0 (ÇN: Ben de anlamadım burayı.) ) ve 512 bayt alır.


BIOS, diskin çalıştırılabilir olup olmadığını kontrol etmek için 511 ve 512. baytların 0xAA55 olup olmadığını kontrol eder.


Bu olası en basit bootloader'dır:

```
e9 fd ff 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[ 29 tane daha içerisinde 16 tane boş bayt bulunan satır. ]
00 00 00 00 00 00 00 00 00 00 00 00 00 00 55 aa
```


Temelde tümü sıfırdır ve 16 bitlik değer `0xAA55` ile biter (Endianness'a dikkat edin, x86 bir küçük endian'dır). İlk üç bayt sistemin sonsuza kadar çalışmasını sağlıyor.

**ÇN:** endian/endianness: Önemli baytların sağda veya solda olması durumu. Küçük endian, önemli bayt sağda, büyük endian, önemli bayt solda demektir.

En basit başlatma sektörü
-------------------------

Yukarıdaki 512 baytı bir ikili düzenleyici ile yazabilir veya çok basit bir Assembly kodu yazabilirsiniz:


```nasm
; Sonsuz döngü (e9 fd ff)
loop:
jmp loop

; Son iki bayt ve bundan önceki baytlar hariç olan kısmı boşalt (bütün baytları 00 yap.)
times 510-($-$$) db 0
; BIOS'a bu sektörün çalıştırılabilir olduğunu açıklıyoruz.
dw 0xaa55
```


Derlemek için: `nasm -f bin boot_sect_simple.asm -o boot_sect_simple.bin`


> OSX uyarısı: hata verirse, bölüm 00'ı tekrar okuyun.


Denemek için sabırsızlandığını biliyorum (ben de!), öyleyse hadi yapalım:

`qemu boot_sect_simple.bin`


> Bazı sistemlerde, şunu çalıştırmanız gerekebilir: `qemu-system-x86_64 boot_sect_simple.bin`. Eğer bir SDL hatası verirse, --nographic ve/veya --curses bayraklarını atlamayı deneyin. (ÇN: yine anlamadım.).


"Booting from Hard Disk..." diyen bir açılır pencereyi göreceksiniz ve başka bir şey görmeyeceksiniz. En son ne zaman bir sonsuz döngüyü görmek için çok sabırsızlanmıştınız? ;-) 
