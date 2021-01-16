is-rehber
===========
Yandaki rehberin çevirisidir: https://github.com/cfenollosa/os-tutorial
Çevirileyen/çevirildiğinde anlam saçmalaşan yerler çıkarılmış olabilir. Bunlar, dersi etkilemeyecek değişikliklerdir.

Nasıl sıfırdan bir İS yazılır!

İlham veren: [bu belge](http://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf)
ve [OSDev wiki](http://wiki.osdev.org/), Adım adım kısa README'ler ve
herkesin takip etmesi için kod örnekleri yapmaya çalışacağım. Dürüst olmak gerekirse, bu eğitim temelde ilk belgedir, ancak
teori olmadan daha küçük parçalara bölündü.

Güncelleme: daha fazla kaynak: [işletim sistemi yapımı hakkında küçük kitapçık](https://littleosbook.github.io),
[JamesM'ın çekirdek yapım dersleri](https://web.archive.org/web/20160412174753/http://www.jamesmolloy.co.uk/tutorial_html/index.html)


Özellikler
--------
- Bu kurs, düşük seviyeli bilgi işlem konusunda merakı olan kişilere yönelik bir kod dersidir. Örneğin,
bir işletim sisteminin nasıl çalıştığına dair merakı olan ancak Linux çekirdeğini baştan aşağı okumaya başlamak için zamanı veya iradesi olmayan programcılar.
- Çok az teori var. Evet, bu bir özelliktir. Google sizin teori öğretmeninizdir. Üniversiteyi bitirdikten sonra, aşırı teori, hiç teori olmamasından daha kötüdür çünkü işleri gerçekte olduğundan daha zor gösterir.
- Dersler çok küçük ve tamamlanması 5-15 dakika sürebilir. Bana güvenin ve kendinize güvenin. Bunu yapabilirsin!


Bu rehber naıl kullanılır?
------------------------

1. Birinci klasörle başlayın ve aşağı doğru gidin. Önceki kod üzerine inşaa edilen derslerdir, yani 5. derse gidip orada neden mov ah, 0x0e olduğunu anlamazsanız, bu 2. dersi okumadığınız içindir.
Gerçekten, sırayla gidin. Her zaman bildiğiniz şeyleri atlayabilirsiniz.

2. README'yi açın ve ilk satırı okuyun, aşina olmanız gerek konuların bulunduğu satır. Aşina olmadığınız konuları araştırın. İkinci satır her ders için hedefi belirtir.
Okuyun, çünkü yaptığımız şeyi neden yaptığımızı açıklıyorlar. "Neden", "nasıl" kadar önemlidir.
 
3. README'nin geri kalanını okuyun. Bu **çok kısa**.

4. (İsteğe bağlı) README'yi okuduktan sonra kod dosyalarını kendiniz yazmaya çalışın.

5. Kod örneklerine bakın. Son derece iyi yorumlandılar.

6. (İsteğe bağlı) Onlarla deney yapın ve bir şeyleri kırmaya çalışın. Bir şeyi anladığınızdan emin olmanın tek yolu
kırmak veya farklı komutlarla değiştirmektir.


Uzun lafın kısası: Önce her klasördeki README dosyasını okuyun, ardından kod dosyalarını. Eğer cesursanız, kendiniz kodlamayı da deneyebilirsiniz.


Strateji
--------

İşletim sistemimizle bazı şeyler yapmak istiyoruz:

- GRUB olmadan, sıfırdan önyükleme - TAMAM!
- 32-bit moda girmek - TAMAM!
-  Assembly'den C'ye geçmek - TAMAM!
- Kesinti işleme (ÇN:?) - TAMAM!
- Ekran çıktısı ve klavye girdisi - TAMAM!
- İhtiyaçlarımıza uyacak şekilde büyüyen küçük, temel bir "libc" - TAMAM!
- Bellek yönetimi
- Dosyaları saklamak için bir dosya sistemi yazmak
- Çok basit bir kabuk oluşturmak (ÇN: Linux'daki terminal, Windows'daki CMD gibi.)
- Kullanıcı modu
- Belki basit bir metin düzenleyici
- Çoklu işlemler ve zamanlama

Muhtemelen onları bu sırayla inceleyeceğiz, ancak yakında anlatılacak.

Eğer yeterince cesur hisseiyorsak:

- Bir BASIC yorumlayıcı, 70'lerdeki gibi!
- Bir GUI (ÇN: Grafiksel Kullanıcı Arayüzü)!
- Ağ bağlantısı



Katkı
------------

Bu kişisel bir öğrenme projesi ve uzun süredir güncellenmemiş olsa da, bir noktada hala içine girme umutlarım var.

Hatalara işaret eden ve çekme talepleri (ÇN: pull request) gönderen herkese minnettarım. Her şeyi gözden geçirmek için biraz zamana ihtiyacım olacak ve şu anda bunu garanti edemem.

Lütfen bu depoyu çatallamaktan çekinmeyin. Birçoğunuz projeye devam etmekle ilgileniyorsanız, bana bildirin ve buradan "ana çatal" ı bağlayacağım (ÇN: virgülden sonrasını ben de anlamadım, Google Çeviri'den bakmam gerekti.).
