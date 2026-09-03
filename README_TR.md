# The Shadow

> Godot 4 ile geliştirilmiş 2D karanlık-fantezi aksiyon platform oyunu.

[English README](README.md)

## Proje Hakkında

**The Shadow**, hızlı oynanış, keşif, düşman karşılaşmaları, checkpoint sistemi, ilerleme ve boss savaşı üzerine kurulu bir 2D aksiyon-platform oyun projesidir. Proje **Godot 4** ve **GDScript** kullanılarak geliştirildi; geliştirme ve iterasyon sürecinde AI destekli geliştirme araçlarından da yararlanıldı.

Oyun, pixel-art ortamları karanlık-fantezi atmosferiyle birleştirir ve birden fazla oynanış bölgesi içerir. Savaş sisteminde oyuncu can ve enerji yönetimi, yapay zekâ davranışlarına sahip standart düşmanlar ve daha gelişmiş özel davranışlara sahip bir boss karşılaşması bulunur.

## Oynanış Görselleri

### Ana Menü
![The Shadow ana menü](screenshots/main-menu.png)

### Keşif ve Savaş
![Kale bölgesi](screenshots/castle-gameplay.png)

![Köy bölgesi](screenshots/village-gameplay.png)

![Yanan bölge](screenshots/burning-area.png)

### Boss Karşılaşması
![Boss karşılaşması](screenshots/boss-encounter.png)

Boss, oyuncuyu takip etme, özel saldırılar gerçekleştirme, oyuncuyu geçici olarak dondurma ve oyuncunun çevresindeki savaş alanında teleport/yeniden konumlanma gibi özel davranışlara sahiptir. Normal düşmanlar da oyuncuyu algılayan, takip eden ve savaşa giren yapay zekâ davranışları kullanır.

### Oyun Durumları
![Boss yenildi](screenshots/boss-defeated.png)

![Oyuncu ölüm ekranı](screenshots/death-screen.png)

## Temel Özellikler

- 2D aksiyon-platform oynanışı
- Birden fazla pixel-art ortam ve oyun bölgesi
- Oyuncu can ve enerji sistemleri
- Yakın dövüş / aksiyon mekanikleri
- Algılama, takip ve savaş davranışlarına sahip standart düşman yapay zekâsı
- Özel saldırı ve hareket davranışlarına sahip boss yapay zekâsı
- Boss'un oyuncunun çevresinde teleport/yeniden konumlanma mekaniği
- Boss savaşında oyuncuyu dondurma mekaniği
- Checkpoint ve yeniden doğma akışı
- Kayıt ve Continue desteği
- Deneme/can ve ölüm durumu yönetimi
- Shop ve yardımcı oynanış sistemleri
- New Game, Continue ve Quit seçenekli ana menü
- Boss yenme / oyun başarı durumu

## Düşman ve Boss Yapay Zekâsı

Düşman davranışları yalnızca sabit animasyonlardan veya sahneye yerleştirilmiş karakterlerden oluşmaz. Standart düşmanlarda oyuncuya tepki vermek, oyuncuyu takip etmek ve savaş karşılaşmasına katılmak için kullanılan otonom oynanış davranışları bulunur.

Boss karşılaşması bu sistemi daha ileri taşır. Boss oyuncuyu takip edebilir, belirli saldırılar gerçekleştirebilir, oyuncuyu geçici olarak dondurabilir ve savaş alanında oyuncunun çevresinde yeniden konumlanabilir/teleport olabilir. Bu mekanikler boss savaşını standart düşman karşılaşmalarından daha dinamik hale getirir.

## Oyun Akışı

Projede **New Game**, **Continue** ve **Quit** seçeneklerini içeren bir ana menü akışı bulunur. Oyuncu oyun sırasında farklı bölgelerde ilerler, düşmanlarla savaşır, checkpoint sistemini kullanır ve sonunda boss karşılaşmasına ulaşır. Oyuncunun yenilmesi ve boss'un yenilmesi için ayrı oyun durumu ekranları bulunmaktadır.

## Teknik Özellikler

| Alan | Kullanılan Yapı |
|---|---|
| Oyun Motoru | Godot 4 |
| Programlama Dili | GDScript |
| Tür | 2D Action Platformer |
| Görsel Yön | Pixel-art / Dark Fantasy |
| Düşman Sistemleri | Algılama, takip ve savaş davranışları |
| Boss Sistemleri | Özel AI, takip, saldırı, dondurma ve teleport davranışları |
| İlerleme | Checkpoint, respawn ve save/continue akışı |
| Yardımcı Sistemler | Shop ve oyun yöneticileri |

## Proje Yapısı

Repository, Godot proje yapılandırmasını ve oynanış scriptlerini içerir. Önemli yardımcı scriptler arasında checkpoint yönetimi, oyun durumu yönetimi ve kayıt sistemi bulunur. Bunlara oyuncu, düşman, boss ve oynanışa özel scriptler eşlik eder.

```text
project.godot
scripts/
  checkpoint.gd
  game_manager.gd
  save_manager.gd
area_2d.gd
blue.gd
shop.gd
screenshots/
```

## Projeyi Çalıştırma

1. Uyumlu bir **Godot 4.x** sürümü kurun.
2. Repository'yi klonlayın veya indirin.
3. Godot Project Manager'ı açın.
4. `project.godot` dosyasının bulunduğu klasörü içe aktarın.
5. Projeyi açıp Godot editöründen çalıştırın.

## Geliştirme Notları

Bu repository; Godot, GDScript, gameplay programlama, state management ve düşman/boss davranış tasarımı konularındaki pratik deneyimi göstermek amacıyla portfolio projesi olarak sunulmaktadır. Kodlama ve geliştirme sürecinde AI destekli geliştirme araçlarından da yararlanılmıştır.

## Mevcut Proje Durumu

Oyunun temel projesi çalışmakta ve ana oynanış sistemleri uygulanmış durumdadır. Bilinen eksik alanlardan biri, **bazı haritalar arasındaki teleport/geçiş sisteminin** ek entegrasyon gerektirmesidir.

## Geliştirici

**Mustafa Alajati**  
Software Developer · Business Automation · AI-Assisted Development · Godot 4
