# 🌑 THE SHADOW

<p align="center">
  <a href="README.md">English</a> | <b>Türkçe</b>
</p>

![Godot](https://img.shields.io/badge/Godot-4.6-478CBF?logo=godot-engine&logoColor=white)
![GDScript](https://img.shields.io/badge/GDScript-Oyun%20Sistemleri-478CBF)
![Tür](https://img.shields.io/badge/T%C3%BCr-2D%20Action%20Platformer-black)
![Geliştirme](https://img.shields.io/badge/Geli%C5%9Ftirme-AI%20Destekli-6f42c1)
![Durum](https://img.shields.io/badge/Durum-Oynanabilir%20Portf%C3%B6y%20S%C3%BCr%C3%BCm%C3%BC-success)

**THE SHADOW**, **Godot 4.6** ve **GDScript** ile geliştirilen 2D aksiyon-platform oyun projesidir. Proje; akıcı platform hareketleri, yönlü savaş sistemi, farklı düşman davranışları, boss encounter, tuzaklar ve hareketli platformlar, checkpoint sistemi, kalıcı save/continue yapısı, rune tabanlı ilerleme, ability mağazası, kullanıcı arayüzü ve çevresel geçişleri tek oyun yapısında birleştirir.

Geliştirme süreci iteratif olarak yürütülmüştür. **OpenAI Codex**, hata ayıklama, kod iterasyonu, uygulama desteği ve geliştirme sürecini hızlandırmak amacıyla AI destekli geliştirme aracı olarak kullanılmıştır. Oynanış tasarımı, scene entegrasyonu, test, dengeleme kararları ve genel proje yönü geliştirme sürecinin parçası olarak sürdürülmüştür.

> **Mevcut geliştirme durumu:** portföy sürümü Godot üzerinde açılıp çalıştırılmıştır ve temel oynanış sistemleri çalışmaktadır. Haritalar arası portal/teleport altyapısı projede mevcut olsa da tüm map bağlantıları henüz tamamlanmış değildir ve geliştirme aşamasındadır.

## 🎮 Oyun Genel Yapısı

Temel oyun döngüsü; 2D platform bölümlerini keşfetme, düşmanlarla savaşma, çevresel tuzaklardan kaçınma, checkpointleri aktive etme, yenilen düşmanlardan rune toplama ve bu rune'ları yeni hareket yetenekleri açmak için kullanma üzerine kuruludur.

Proje tek büyük script yerine yeniden kullanılabilir Godot scene ve sistemlerine ayrılmıştır. Oyuncu kontrolü, düşmanlar, checkpointler, tuzaklar, UI, mağaza, save sistemi, portallar ve çevresel efektler bağımsız script/component yapılarıyla yönetilir.

## 🧍 Oyuncu Hareketi ve Karakter Kontrolü

Ana oyuncu kontrol sistemi `CharacterBody2D` kullanır ve şu özellikleri içerir:

- Anlık hız değişimi yerine acceleration tabanlı yatay hareket
- Yerde friction ve havada ayrı air-friction davranışı
- Gravity tabanlı zıplama ve platform mekaniği
- Hareket yönüne göre karakterin sağa/sola dönmesi
- Idle, koşu, zıplama, saldırı, dash, hasar ve ölüm durumlarına göre animation yönetimi
- Karakterin baktığı yöne göre normal dash
- Yerde dash sırasında toz efekti / görsel geri bildirim
- Hasar alındığında knockback
- Geçici invincibility / hit-state yönetimi
- Checkpoint ile bağlantılı respawn pozisyonu

### Dash Sistemi

Oyuncuda iki ayrı dash mekaniği vardır:

**Normal Dash**
- Temel hareket yeteneği olarak kullanılabilir
- Oyuncunun baktığı yöne uygulanır
- Kısa süreliğine normal hareketi devralır
- Ayrı dash animasyonu ve toz efekti kullanır

**Special Dash**
- Başlangıçta kilitlidir ve oyun içi mağazadan açılır
- Normal dash'ten daha hızlı ayrı bir state kullanır
- En fazla **3 charge** tutar
- Her kullanım bir charge tüketir
- Charge'lar zaman içinde yeniden dolar
- HUD mevcut charge sayısını günceller

## ⚔️ Savaş Sistemi

Savaş sistemi `Area2D` ve `CollisionShape2D` tabanlı hitbox bölgeleriyle çalışır.

### Yönlü Saldırılar

Oyuncu üç farklı yönde saldırabilir:

- **Ön Saldırı** — ana saldırı
- **Yukarı Saldırı** — zeminde kullanıldığında oyuncuyu yukarı doğru hareket ettirerek dikey saldırı oluşturur
- **Aşağı Saldırı** — havadayken aşağı yönlü saldırı

Saldırı alanının yönü, oyuncunun baktığı yön ve seçilen saldırı tipine göre güncellenir.

### Combo Sistemi

Ön saldırıda zamanlamaya bağlı combo mantığı bulunur:

- İlk saldırı kısa bir combo penceresi açar
- Bu süre içinde ikinci saldırı input'u alınırsa sonraki combo aksiyonu istenir
- Attack state, combo state ve hit collision süreleri ayrı yönetilerek hatalı üst üste saldırılar engellenir

### Hasar ve Oyuncu Durumları

Karakter sistemi şu yapıları içerir:

- 3 canlık sağlık sistemi
- HUD sağlık göstergesi
- Hasar alma animasyonları
- Knockback
- Invincibility yönetimi
- Ölüm state'i
- Death Menu entegrasyonu
- Checkpoint tabanlı respawn
- Freeze status effect
- Freeze sırasında mavi renk efekti ve particle kullanımı
- Zaman kontrollü çözülme / recovery

## 👾 Düşman ve Boss Sistemleri

Projede tek bir enemy scriptinin kopyalanması yerine farklı davranışlara sahip birden fazla düşman sistemi bulunmaktadır.

### Standart Enemy

Temel enemy davranışı:

- Oyuncu algılama / hedef takibi
- Attack range mantığı
- Zaman kontrollü saldırı hit'i
- Hasar alma
- Hit knockback
- Ölüm state'i
- Öldüğünde rune ödülü

### Skeleton

Skeleton düşmanı:

- Patrol benzeri hareket
- Kenar ve duvar kontrolü
- Encounter sırasında oyuncuya dönme
- Yakın mesafe saldırısı
- Varsayılan **3 can**
- Hasar ve hit reaction state'leri
- Öldüğünde rune ödülü

### Wizard

Wizard daha güçlü bir düşman yapısına sahiptir:

- Kenar/duvar farkındalığı
- Oyuncuya yönelme
- `attack` ve `attack2` animasyonları arasında geçiş
- Eski gecikmeli saldırıların yanlış zamanda hasar vermesini engellemek için attack ID sistemi
- Varsayılan **5 can**
- Yapılandırılmış saldırıda **2 hasar**
- Standart düşmanlardan daha yüksek rune ödülü

### Guard

Guard için ayrı movement ve bekleyip yön değiştirme mantığına sahip bağımsız controller bulunmaktadır. Böylece Skeleton ve Wizard'dan farklı bir navigation davranışı sağlar.

### BLUE Boss Encounter

Projede **BLUE** isimli ayrı bir boss controller da bulunmaktadır:

- Varsayılan **15 can**
- Oyuncu detection ve yön takibi
- Mesafeye göre aksiyon seçimi
- Oyuncu uzaktaysa dash/chase davranışı
- İki farklı randomized attack tipi
- Attack 1 ve Attack 2 için ayrı hasar değerleri
- Timed attack hit ve collision pencereleri
- Saldırılardan biri oyuncuya freeze effect uygulayabilir
- Boss hit reaction ve damage sistemi
- Encounter içinde teleport-away davranışı
- Ölüm sistemi
- Boss health UI ile canlı senkronizasyon

Boss sunumu için ayrıca:

- Boss intro fade ekranı
- Boss adı
- Boss health bar
- Runtime health update

bulunmaktadır.

## 💎 Rune Ekonomisi ve Ability İlerlemesi

`GameManager`, rune/coin tabanlı basit bir progression sistemi yönetir.

Yenilen düşmanlar rune kazandırabilir. Rune miktarı ayrı Rune UI üzerinde gösterilir ve mağazada ability satın almak için kullanılır.

### Mağaza Sistemi

Shop sistemi şu özellikleri içerir:

- Oyuncu proximity detection
- `E` ile etkileşim
- Shop UI açma / kapatma
- Ability adı ve ayarlanabilir fiyat
- Yetersiz rune mesajı
- Daha önce satın alınmış ability kontrolü
- Satın alma işleminin `GameManager` üzerinden doğrulanması

Mevcut satın alınabilir ability **Special Dash**'tir ve satın alındıktan sonra oyuncunun hareket seçeneklerini genişletir.

## ❤️ HUD ve Oynanış Geri Bildirimi

Projede çeşitli runtime UI sistemleri bulunur:

- Health / heart göstergeleri
- Health fill UI
- Special Dash charge göstergesi
- Rune counter
- Death Menu
- Message UI
- Transition UI
- Boss intro UI
- Boss adı ve boss health bar

Health ve dash göstergeleri oynanış state'ine göre dinamik olarak güncellenir.

## 💾 Checkpoint, Save ve Continue Sistemi

Kalıcı ilerleme, Godot Autoload olarak çalışan `SaveManager` üzerinden yönetilir.

Checkpoint aktive edildiğinde şu bilgiler kaydedilir:

- Mevcut scene path
- Checkpoint dünya pozisyonu
- Geçerli checkpoint olup olmadığı

Veriler Godot `ConfigFile` kullanılarak şu konuma yazılır:

```text
user://save_game.cfg
```

### Continue Akışı

Ana menü şunları içerir:

- New Game
- Continue
- Quit
- Animated menu giriş efekti
- Button hover animasyonu

Save dosyası mevcutsa Continue, kayıtlı scene'i açar ve oyuncuyu kayıtlı checkpoint pozisyonuna geri yerleştirir.

## 🚩 Checkpoint ve Respawn Akışı

Checkpoint scene'i trigger ile yalnızca bir kez aktive olur, oyuncunun respawn noktasını günceller, mevcut scene ve pozisyonu `SaveManager` ile kaydeder ve checkpoint animasyonunu oynatır.

Oyuncu öldüğünde Death UI açılır ve respawn sırasında:

- Oyuncu pozisyonu
- Can
- Movement/combat state'leri
- Freeze state'i
- Attack collision state'i
- Karakter animasyonu

sıfırlanır.

## 🌍 Bölümler, Portallar ve Dünya İlerlemesi

Kaynak projede ana oyun scene'ine ek olarak `level_2`, `level_3_new` ve `level_4` gibi birden fazla level scene bulunmaktadır.

### Portal / Transition Altyapısı

Portal sistemi şunları içerir:

- Oyuncu yakınlık kontrolü
- `E` interaction
- Portal activate animasyonu
- Transition ekranı
- Kelime kelime ilerleyen transition metni
- Animasyonlu üç nokta efekti
- Scene değiştirmeden önce confirmation state
- `PackedScene` hedef ataması
- `change_scene_to_packed()` ile scene değişimi

**Geliştirme notu:** portal/teleport altyapısı mevcut; ancak tüm haritaların birbirine bağlanması henüz tamamlanmamıştır. Bu durum GitHub için yapılan temizliğin oluşturduğu bir hata değil, oyunda önceden bulunan geliştirme maddesidir.

## 🌅 Çevresel Geçiş Sistemi

`day_night_controller.gd`, oyuncunun level içindeki yatay ilerleyişine göre atmosferi değiştirir.

`CanvasModulate`, oyuncu level başlangıcından sonuna doğru ilerledikçe daha açık sabah tonundan daha koyu akşam tonuna interpolate edilir. Böylece gerçek zamanlı saat sistemi olmadan ilerlemeye bağlı görsel atmosfer değişimi oluşturulur.

## ⚠️ Tuzaklar ve Etkileşimli Dünya Objeleri

Kaynak projede şu sistemler bulunmaktadır:

- Spike damage
- Kill zone / instant-death alanları
- Saw trap
- Bölümlere özel saw trap varyasyonları
- Fire objeleri ve level-specific fire scriptleri
- Moving platform
- Up/down moving platform
- Box / çevre objeleri
- House / dekorasyon objeleri
- Sign ve player message sistemi
- Portal decoration
- Spawn point

Bu sistemler farklı level'larda tekrar kullanılabilecek şekilde ayrı scene/script olarak tutulmuştur.

## 🕹️ Varsayılan Kontroller

| Aksiyon | Tuş |
|---|---|
| Sola Git | Sol Ok |
| Sağa Git | Sağ Ok |
| Zıpla | Space |
| Ön Saldırı | Z |
| Yukarı Saldırı | Yukarı Ok |
| Aşağı Saldırı | Aşağı Ok |
| Dash | C |
| Special Dash | X |
| Etkileşim / Portal / Shop | E |

## 🧰 Teknolojiler ve Godot Özellikleri

| Teknoloji / Özellik | Kullanım |
|---|---|
| Godot 4.6 | Oyun motoru |
| GDScript | Gameplay ve sistem scriptleri |
| CharacterBody2D | Oyuncu / karakter hareketleri |
| Area2D | Combat, detection, checkpoint, hazard ve interaction alanları |
| CollisionShape2D | Hitbox ve trigger collision |
| AnimatedSprite2D | Karakter, düşman, portal ve çevre animasyonları |
| GPUParticles2D | Freeze ve gameplay görsel geri bildirimi |
| ConfigFile | Save/checkpoint kalıcılığı |
| Autoload | Global `SaveManager` |
| Tween | Menü ve boss-intro UI animasyonları |
| CanvasModulate | İlerlemeye bağlı çevresel renk geçişi |
| PackedScene | Portal/level hedef referansları |

## 🏗️ Kaynak Proje Yapısı

Tam Godot kaynak paketinde yaklaşık **47 GDScript** ve **30 `.tscn` scene** bulunmaktadır. Temel sistemler:

```text
project.godot
scripts/
├── character_body_2d.gd
├── enemy.gd
├── skeleton.gd
├── wizard.gd
├── guard.gd
├── checkpoint.gd
├── save_manager.gd
├── game_manager.gd
├── shop.gd
├── rune_ui.gd
├── health_dash_ui.gd
├── main_menu.gd
├── death_menu.gd
├── portal_exit.gd
├── transition_ui.gd
├── day_night_controller.gd
├── killzone.gd
├── saw_trap.gd
├── spike.gd
├── platform.gd
└── ...

secnes/
├── game.tscn
├── level_2.tscn
├── level_3_new.tscn
├── level_4.tscn
├── character_body_2d.tscn
├── enemy.tscn
├── skeleton.tscn
├── wizard.tscn
├── boss_intro.*
├── boss_ui.*
└── ...
```

> Mevcut `secnes/` klasör adı bilinçli olarak korunmaktadır; Godot resource path'leri bu ismi kullanır. Tüm `res://` referansları güncellenmeden yeniden adlandırmak scene/resource bağlantılarını bozabilir.

## 🤖 Codex ile AI Destekli Geliştirme

OpenAI Codex geliştirme sırasında özellikle şu alanlarda yardımcı araç olarak kullanılmıştır:

- GDScript hata ayıklama
- Gameplay logic iterasyonu
- Scene/script entegrasyon sorunlarını inceleme
- Tekil sistemleri refactor etme ve iyileştirme
- Geliştirme sırasında hızlı denemeler yapma

Bu proje **AI destekli geliştirme** olarak sunulmaktadır; otonom olarak AI tarafından yapılmış bir oyun olarak değil. Oyun; gameplay kararları, Godot scene oluşturma, entegrasyon, tuning, test ve manuel iterasyon gerektirmiştir.

## 🚀 Projeyi Çalıştırma

1. **Godot 4.6** veya uyumlu Godot 4.x sürümü kurun.
2. Repository'yi klonlayın / indirin.
3. Godot Project Manager'ı açın.
4. `project.godot` dosyasını import edin.
5. Gerekirse Godot'un assetleri yeniden işlemesini bekleyin.
6. **F6/F5 / Run Project** ile oyunu başlatın.

```bash
git clone https://github.com/safialajati2-creator/the-shadow-game.git
cd the-shadow-game
```

Ayarlanmış ana scene:

```text
res://secnes/game.tscn
```

## ✅ Doğrulama ve Mevcut Durum

Portföy hazırlığı sırasında:

- Orijinal Godot ZIP, exported executable olarak değil kaynak proje olarak incelendi.
- `project.godot` doğrulandı.
- Ayarlanmış main scene belirlendi.
- Orijinal kaynak pakette 47 GDScript ve 30 scene dosyası tespit edildi.
- Temizlenen paket içindeki `res://` referansları statik olarak tarandı ve bu kontrolde eksik referanslı dosya bulunmadı.
- Cache/generated içerikler kaynak dosyalardan konservatif şekilde ayrıldı.
- Temizlenen portföy kopyası geliştiricinin bilgisayarında Godot'a import edilip başarıyla çalıştırıldı.
- Haritalar arası teleport/portal bağlantılarının tamamlanması mevcut geliştirme maddesi olarak devam etmektedir.

## 🎨 Assetler ve Haklar

Projede oyun geliştirme sırasında kullanılan görsel assetler, fontlar, sesler, custom/generated çalışmalar ve üçüncü taraf asset paketleri bulunmaktadır. İlgili assetlerin varsa orijinal lisans ve kullanım şartları geçerliliğini korur.

Repository bir **oyun geliştirme ve yazılım mühendisliği portföy projesi** olarak sunulmaktadır.

## 🎯 Bu Proje Neyi Gösteriyor?

THE SHADOW; **Godot 4, GDScript, player controller geliştirme, platformer fiziği, yönlü combat, combo logic, collision tabanlı hit sistemleri, enemy AI, boss davranışı, state management, status effect, checkpoint, save/persistence, UI/HUD, progression economy, ability unlock, çevresel efektler, level entegrasyonu, debugging ve AI destekli geliştirme** alanlarındaki pratik deneyimi gösterir.
