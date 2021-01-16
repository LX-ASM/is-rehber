*Concepts you may want to Google beforehand: memory offsets, pointers*

**Goal: Learn how the computer memory is organized**

Lütfen [bu belgenin] 14. sayfasını açın.(
http://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf)
ve hafıza düzenine sahip şekle bakın.

Bu dersin tek amacı, önyükleme sektörünün nerede depolandığını öğrenmektir.

Size açıkça söyleyebilirim ki, BIOS bunu "0x7C00" e koyar ve halleder, ancak yanlış çözümlere sahip bir örnek işleri daha net hale getirecektir.

Ekranda bir X yazdırmak istiyoruz. 4 farklı strateji deneyeceğiz ve hangilerinin işe yaradığını ve neden işe yaradığını göreceğiz.

**`boot_sect_memory.asm` dosyasını açın**

Öncelikle, X'i bir etiketle veri olarak tanımlayacağız:
```nasm
gizem:
    db "X"
```

Ardından `gizem` verisine birkaç farklı yolla ulaşmaya çalışacağız:

1. `mov al, gizem`
2. `mov al, [gizem]`
3. `mov al, gizem + 0x7C00`
4. `mov al, 2d + 0x7C00`, burada "2d", ikili dosyadaki 'X' baytının gerçek konumudur

Koda bir göz atın ve yorumları okuyun.

Kodu derleyin ve çalıştırın. "1 [2 ¢ 3X4X" e benzer bir dize görmelisiniz, burada
1 ve 2 olan baytlar sadece rastgele çöplerdir.

Talimat ekler veya çıkarırsanız, baytları sayarak X'in yeni ofsetini hesaplamayı unutmayın, ve "0x2d" yi yenisiyle değiştirin.

Önyükleme sektörü ofsetini ve bellek adreslemesini %100 anlamadıysanız lütfen sonraki bölüme devam etmeyin.

Genel denge
-----------------

Şimdi, "0x7c00" ü her yerde dengelemek çok sakıncalı olduğundan, derleyiciler
"org" komutuyla her bellek konumu için bir "global ofset" tanımlarız:

```nasm
[org 0x7c00]
```

Devam edin ve **`boot_sect_memory_org.asm`**'ı açın ve şimdi 2. denenen önyükleme kesimi ile verileri yazdırmanın kurallı yolunu göreceksiniz. Kodu derleyin ve çalıştırın, ve `org`un nasıl önceki her çözümü etkilediğini göreceksiniz.
`org` içeren ve içermeyen değişikliklerin tam açıklaması için yorumları okuyun.
