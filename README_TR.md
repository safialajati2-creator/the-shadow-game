# 🌑 THE SHADOW

<p align="center">
  <a href="README.md">English</a> | <b>Türkçe</b>
</p>

![Godot](https://img.shields.io/badge/Godot-4.6-478CBF?logo=godot-engine&logoColor=white)
![GDScript](https://img.shields.io/badge/GDScript-Oyun%20Sistemleri-478CBF)
![Tür](https://img.shields.io/badge/T%C3%BCr-2D%20Action%20Platformer-black)
![AI](https://img.shields.io/badge/Oyun%20AI-D%C3%BC%C5%9Fman%20%26%20Boss-6f42c1)
![Durum](https://img.shields.io/badge/Durum-Oynanabilir%20Portf%C3%B6y%20S%C3%BCr%C3%BCm%C3%BC-success)

**THE SHADOW**, **Godot 4.6** ve **GDScript** ile geliştirilen 2D aksiyon-platform oyun projesidir. Akıcı platform hareketlerini, yönlü savaş sistemini, davranış tabanlı düşman yapay zekasını, adaptif boss karşılaşmasını, tuzakları, checkpoint/save sistemini, rune tabanlı ilerlemeyi, ability mağazasını, UI sistemlerini ve çevresel geçişleri bir araya getirir.

> **Mevcut durum:** portföy sürümü Godot üzerinde açılıp çalıştırılmıştır ve temel oynanış sistemleri oynanabilir durumdadır. Haritalar arası portal/teleport bağlantılarının tamamlanması halen geliştirme aşamasındadır.

## 🎮 Oynanış Sistemleri

### Oyuncu Hareketi
- Acceleration tabanlı yatay hareket ve yer/hava friction davranışı
- Gravity tabanlı zıplama
- Yöne ve state'e göre karakter/animasyon yönetimi
- Normal dash ve görsel geri bildirim
- Mağazadan açılan daha hızlı **Special Dash**
- Special Dash için en fazla **3 charge**, tüketim, yeniden dolum ve HUD senkronizasyonu
- Knockback, geçici invincibility, ölüm, checkpoint respawn ve status-effect yönetimi

### ⚔️ Yönlü Savaş Sistemi
Savaş `Area2D` / `CollisionShape2D` hitbox yapılarıyla çalışır ve şunları içerir:

- Ön saldırı
- Yukarı saldırı
- Havada aşağı saldırı
- Zaman kontrollü combo penceresi
- Karakter yönüne göre değişen attack hitbox
- Ayrı attack/combo/collision/damage state yönetimi
- Görsel efekt ve süreli recovery içeren Freeze status effect

## 🧠 Davranış Tabanlı Düşman Yapay Zekası

Düşmanlar yalnızca sabit animasyon oynatan engeller değildir. Projede düşmanların oyuncuya ve çevreye tepki vermesini sağlayan **Game AI / behavior-based AI** mantığı kullanılır. Bu yapı Machine Learning değil, oyun içinde karar veren deterministik davranış sistemidir.

Genel enemy karar akışı şu mantığa dayanır:

**Oyuncuyu Algıla → Hedefi Takip Et → Yön/Hareket Kararı → Mesafeyi Değerlendir → Saldırı Kararı → Attack Timing/Cooldown → Hasar/Ölüm State'i**

Her düşman tipi bu yapıyı farklı davranışlarla genişletir.

### Standart Enemy AI
- Oyuncuyu algılama ve hedef takibi
- Attack range değerlendirmesi
- Encounter sırasında oyuncuya yönelme
- Sürekli collision damage yerine zaman kontrollü attack hit
- Hasar, knockback, ölüm state'i ve rune ödülü

### Skeleton AI
- Patrol benzeri hareket
- Kenar ve duvar farkındalığı
- Oyuncuyla karşılaştığında davranış değiştirme
- Yakın dövüş öncesi oyuncuya yönelme
- Zaman kontrollü melee attack
- Varsayılan **3 can**
- Hit reaction, ölüm state'i ve rune ödülü

### Wizard AI
- Kenar/duvar farkındalığı
- Oyuncuya yönelme ve combat davranışı
- Birden fazla saldırı (`attack` / `attack2`)
- Saldırı davranışında çeşitlilik
- Eski gecikmeli saldırıların yanlış zamanda hasar vermesini engelleyen attack ID sistemi
- Varsayılan **5 can**
- Yapılandırılmış saldırılarda **2 damage**
- Standart düşmanlardan daha yüksek rune ödülü

### Guard Davranışı
Guard için Skeleton ve Wizard'dan ayrı movement, bekleme ve yön değiştirme mantığına sahip bağımsız bir controller bulunur.

## 👑 BLUE — Adaptif Boss Yapay Zekası

**BLUE**, standart düşmanlardan daha gelişmiş davranış/state sistemine sahip özel bir boss encounter'dır. Boss tek bir sabit animasyon sırasını tekrarlamak yerine oyuncunun konumuna ve mesafesine göre davranışını yeniden değerlendirir.

### Boss Karar Mekanizması
- Oyuncuyu algılama ve target tracking
- Sürekli oyuncuya yönelme
- **Mesafeye göre aksiyon seçimi**
- Oyuncu uzaktayken dash/chase ile yaklaşma
- Combat mesafesinde saldırı davranışına geçme
- Karşılaşmayı daha az tahmin edilebilir yapan iki randomized attack tipi
- Attack 1 / Attack 2 için ayrı damage değerleri ve zaman kontrollü hit pencereleri
- Hit reaction, damage, death state ve boss-health UI senkronizasyonu

Boss karar akışı kavramsal olarak:

**Oyuncuyu Takip Et → Mesafeyi Ölç → Chase / Dash / Attack Seç → Zaman Kontrollü Aksiyonu Uygula → Oyuncunun Yeni Konumunu Tekrar Değerlendir**

### ❄️ Freeze Saldırısı
BLUE'nun saldırılarından biri oyuncuya **Freeze status effect** uygulayabilir. Bu saldırı yalnızca normal health damage vermekle kalmaz; oyuncu controller'ındaki status/state sistemiyle etkileşime girerek karakteri geçici olarak dondurur, görsel freeze feedback'i oluşturur ve belirlenen sürenin ardından recovery sağlar.

### ⚡ Dinamik Arena Repositioning / Teleport
BLUE encounter içinde teleport/repositioning davranışına da sahiptir. Boss, savaş alanında önceden tasarlanmış **teleport noktaları** arasında konum değiştirebilir ve bu konumlandırma mantığında oyuncunun mevcut pozisyonu dikkate alınır.

Bu nedenle sistem basitçe “oyuncunun etrafına rastgele teleport” olarak tanımlanmamıştır. Boss, tasarlanmış arena noktalarını ve oyuncuya göre konum ilişkisini kullanarak savaş mesafesini değiştirir ve oyuncuyu yeni pozisyona adapte olmaya zorlar.

### Boss Sunumu
- Varsayılan **15 can**
- Boss intro / fade ekranı
- Boss adı
- Özel boss health bar
- Runtime health update

Standart düşmanlar ve BLUE boss birlikte; **target tracking, çevre farkındalığı, mesafeye göre karar verme, state-driven combat, attack timing, status effect ve adaptif encounter behavior** konularında pratik Game AI uygulamasını gösterir.

## 💎 Rune Ekonomisi ve Ability İlerlemesi

Yenilen düşmanlar rune kazandırabilir. `GameManager` rune ekonomisini yönetir ve Rune UI mevcut miktarı gösterir.

Mağaza sistemi:
- Player proximity detection
- `E` ile interaction
- Shop UI açma/kapatma
- Ayarlanabilir ability fiyatı
- Yetersiz rune mesajı
- Önceden satın alınmış ability kontrolü
- `GameManager` üzerinden satın alma doğrulaması

Satın alınabilir mevcut ability **Special Dash**'tir.

## ❤️ HUD ve Oynanış Geri Bildirimi
- Health / heart göstergesi
- Health fill UI
- Special Dash charge göstergesi
- Rune counter
- Death Menu
- Message UI
- Transition UI
- Boss intro, boss adı ve boss health UI

UI bileşenleri gameplay state'ine göre dinamik olarak güncellenir.

## 💾 Checkpoint, Save ve Continue

`SaveManager`, Godot Autoload olarak çalışır ve `ConfigFile` kullanarak checkpoint bilgisini kalıcı şekilde saklar:

```text
user://save_game.cfg
```

Save verisi mevcut scene'i, checkpoint dünya pozisyonunu ve checkpoint durumunu içerir. Ana menü **New Game**, **Continue** ve **Quit** seçeneklerine sahiptir. Geçerli save varsa Continue kayıtlı scene/checkpoint'i geri yükler.

Respawn sırasında oyuncunun pozisyonu, canı, movement/combat state'leri, freeze state'i, attack collision ve animation state'i sıfırlanır.

## 🌍 Bölümler, Portal ve Dünya İlerlemesi

Projede `game.tscn`, `level_2.tscn`, `level_3_new.tscn` ve `level_4.tscn` dahil birden fazla level scene bulunur.

Portal altyapısı:
- Player proximity detection
- `E` interaction
- Portal activation animasyonu
- Transition ekranı
- İlerleyen transition metni ve animasyonlu noktalar
- Confirmation state
- `PackedScene` hedefi
- `change_scene_to_packed()` ile scene değişimi

> **Geliştirme notu:** portal/teleport altyapısı mevcuttur ancak bütün map bağlantılarının tamamlanması halen geliştirme maddesidir. Bu durum GitHub temizliği nedeniyle oluşmamıştır.

## 🌅 Çevresel Geçiş

`day_night_controller.gd`, `CanvasModulate` kullanarak oyuncunun level içindeki yatay ilerlemesine göre atmosferi sabah tonlarından akşam tonlarına doğru interpolate eder.

## ⚠️ Tuzaklar ve Etkileşimli Dünya
- Spike damage
- Kill zone / instant death
- Saw trap ve level-specific varyasyonlar
- Fire hazard
- Moving / vertical platform
- Environment objeleri
- Interactive sign/message
- Portal decoration ve spawn point

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
| CharacterBody2D | Oyuncu/karakter hareketi |
| Area2D / CollisionShape2D | Combat, AI detection, hazard ve trigger |
| AnimatedSprite2D | Karakter, düşman ve dünya animasyonu |
| GPUParticles2D | Freeze/gameplay feedback |
| ConfigFile + Autoload | Save/checkpoint kalıcılığı |
| Tween | Menü ve boss intro UI |
| CanvasModulate | Çevresel renk geçişi |
| PackedScene | Level/portal hedefleri |

## 🏗️ Kaynak Proje Yapısı

Orijinal Godot kaynak paketi yaklaşık **47 GDScript** ve **30 `.tscn` scene** içerir. Player mechanics, enemy AI, boss encounter, checkpoint, save management, progression, UI, hazards, portals ve environmental sistemler ayrı script/scene yapılarıyla ele alınmıştır.

> Mevcut `secnes/` klasör adı Godot resource path'lerinde kullanıldığı için bilinçli olarak korunmuştur. Bütün `res://` referansları güncellenmeden yeniden adlandırılması resource bağlantılarını bozabilir.

## 🤖 Codex ile AI Destekli Geliştirme

**OpenAI Codex**; GDScript debugging, gameplay logic iterasyonu, scene/script entegrasyon problemlerini inceleme, belirli sistemleri refactor etme ve geliştirme deneylerini hızlandırma amacıyla mühendislik asistanı olarak kullanılmıştır. Bu kullanım **AI-assisted development** olarak sunulur; otonom oyun üretimi olarak değil. Gameplay kararları, Godot scene yapımı, entegrasyon, tuning, test ve proje yönü geliştirme sürecinin parçasıdır.

## 🚀 Projeyi Çalıştırma

1. **Godot 4.6** veya uyumlu Godot 4.x sürümü kurun.
2. Repository'yi clone/download edin.
3. Godot Project Manager'dan `project.godot` dosyasını import edin.
4. Gerekirse Godot'un assetleri işlemesini bekleyin.
5. Projeyi çalıştırın.

```bash
git clone https://github.com/safialajati2-creator/the-shadow-game.git
cd the-shadow-game
```

Ayarlanmış main scene: `res://secnes/game.tscn`

## ✅ Doğrulama ve Mevcut Durum

Portföy hazırlığında kaynak paket ve Godot yapısı incelendi, temizlenmiş paket üzerinde statik `res://` referans kontrolü yapıldı ve temiz portföy kopyası geliştiricinin bilgisayarında Godot'a import edilerek başarıyla çalıştırıldı. Map-to-map portal bağlantılarının tamamlanması bilinen aktif geliştirme maddesidir.

## 🎨 Assetler ve Haklar

Projede görsel assetler, fontlar, audio, custom/generated çalışmalar ve üçüncü taraf asset paketleri bulunur. İlgili orijinal lisans koşulları geçerliliğini korur. Repository bir **game-development ve software-engineering portföy projesi** olarak sunulmaktadır.

## 🎯 Bu Proje Neyi Gösteriyor?

THE SHADOW; **Godot 4, GDScript, behavior-based Game AI, enemy detection/targeting, patrol ve çevre farkındalığı, adaptif boss logic, mesafeye göre karar verme, chase/dash davranışı, dinamik arena repositioning, status effects, yönlü combat, combo logic, collision tabanlı hit sistemleri, checkpoint, persistence, UI/HUD, progression economy, ability unlocking, environmental effects, level integration, debugging ve AI-assisted development** konularındaki uygulamalı deneyimi gösterir.
