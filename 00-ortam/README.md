*Önceden araştırmak isteyebileceğiniz kavramlar: linux, mac, terminal, compiler, emulator, nasm, qemu*

**Hedef: Rehberi tamamlamak için gerekli yazılımları indirmek**

Ben bir Mac'de çalışıyorum, Linux daha iyidir çünkü zaten sizin için uygun tüm standart araçlara sahip olacaktır.

Bir Mac'de, [Homebrew'i indirin](http://brew.sh) ve `brew install qemu nasm` komutunu çalıştırın.

Don't use the Xcode developer tools `nasm` if you have them installed, they won't work for the most cases. Always use `/usr/local/bin/nasm` (ÇN: Çeviremedim.)

Bazı sistemlerde qemu birden fazla komuta bölünmüştür. `qemu-system-x86_64 bindosyasi` olarak çalıştırmak isteyebilirsiniz.
