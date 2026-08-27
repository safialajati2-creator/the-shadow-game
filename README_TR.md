# 🌑 THE SHADOW

<p align="center">
  <a href="README.md">English</a> | <b>Türkçe</b>
</p>

![Godot](https://img.shields.io/badge/Godot-4.6-478CBF?logo=godot-engine&logoColor=white)
![GDScript](https://img.shields.io/badge/GDScript-Oyun%20Sistemleri-478CBF)
![Tür](https://img.shields.io/badge/T%C3%BCr-2D%20Action%20Platformer-black)
![Durum](https://img.shields.io/badge/Durum-Portf%C3%B6y%20Projesi-success)

**THE SHADOW**, **Godot 4** ve **GDScript** kullanılarak geliştirilen 2D aksiyon-platform oyun projesidir. Proje; akıcı karakter hareketi, yönlü saldırılar, farklı düşman davranışları, tuzaklar, checkpoint sistemi, kayıt/devam sistemi, rune tabanlı mağaza mekaniği, bölüm geçişleri, kullanıcı arayüzü ve çok seviyeli ilerleme yapısını tek bir oyun içinde birleştirir.

Geliştirme sürecinde **OpenAI Codex** dahil olmak üzere AI destekli geliştirme araçlarından hata ayıklama, uygulama desteği, kod iterasyonu ve geliştirme akışını hızlandırmak amacıyla yararlanılmıştır. Oyun tasarımı, sistem entegrasyonu, test ve proje kararları geliştirme sürecinin temel parçası olarak yürütülmüştür.

<p align="center">
  <img src="asset/THE%20SHADOW%20GAME%20SCREEN.png" width="78%" alt="THE SHADOW oyun ekranı" />
</p>

## 🎮 Temel Oynanış Sistemleri

### Oyuncu Kontrolü
- Hızlanma ve sürtünme ile yatay hareket
- Zıplama ve yerçekimi tabanlı platform mekaniği
- Normal dash
- Sınırlı kullanım ve yeniden dolum süresine sahip açılabilir özel dash
- Öne, yukarı ve aşağı yönlü saldırılar
- Combo odaklı saldırı akışı
- Can, hasar bağışıklığı, knockback, hit ve ölüm durumları
- Freeze / durum efekti sistemi
- Respawn ve checkpoint entegrasyonu

### Savaş ve Düşmanlar
Projede farklı düşman ve savaş sistemleri bulunmaktadır:

- Standart enemy davranışı
- Skeleton düşmanı
- Guard düşmanı
- Wizard düşmanı / encounter mantığı
- Oyuncuya hasar verme ve hit reaction sistemi
- Attack area ve collision tabanlı savaş
- Düşman ölüm durumları ve saldırı zamanlaması

### Dünya ve Tuzaklar
- Birden fazla oynanabilir bölüm ve scene
- Sabit ve hareketli platformlar
- Spike tuzakları
- Bölümlere özel saw trap çeşitleri
- Ateş tehlikeleri
- Kill zone alanları
- Portal ve scene geçişleri
- Etkileşimli tabela / mesaj sistemi
- Oyuncunun ilerleyişine bağlı gündüz-akşam renk geçişi

### İlerleme Sistemleri
- Rune / coin toplama sistemi
- Oyun içi mağaza etkileşimi
- Ability satın alma mantığı
- Special Dash yeteneğinin açılması
- Checkpoint aktivasyonu
- Godot `ConfigFile` ile kalıcı kayıt
- Kaydedilen checkpoint üzerinden oyuna devam etme

## 🕹️ Varsayılan Kontroller

| Aksiyon | Tuş |
|---|---|
| Sola Git | Sol Ok |
| Sağa Git | Sağ Ok |
| Zıpla | Space |
| Saldırı | Z |
| Yukarı Saldırı | Yukarı Ok |
| Aşağı Saldırı | Aşağı Ok |
| Dash | C |
| Special Dash | X |
| Etkileşim | E |

## 🧰 Kullanılan Teknolojiler

| Teknoloji | Kullanım |
|---|---|
| Godot 4.6 | Oyun motoru |
| GDScript | Oynanış, düşmanlar, UI, save sistemi ve etkileşimler |
| CharacterBody2D | Oyuncu ve karakter hareketleri |
| Area2D / CollisionShape2D | Savaş, tuzaklar ve etkileşim alanları |
| AnimatedSprite2D | Karakter ve çevre animasyonları |
| ConfigFile | Save / checkpoint kalıcılığı |
| Tween | Ana menü ve UI animasyonları |
| CanvasModulate | Gündüz-akşam görsel geçişi |

## 🏗️ Proje Yapısı

```text
├── project.godot
├── scripts/
│   ├── character_body_2d.gd
│   ├── enemy.gd
│   ├── skeleton.gd
│   ├── guard.gd
│   ├── wizard.gd
│   ├── game_manager.gd
│   ├── save_manager.gd
│   ├── checkpoint.gd
│   ├── shop.gd
│   ├── portal_exit.gd
│   ├── day_night_controller.gd
│   └── ...
├── secnes/
│   ├── game.tscn
│   ├── level_2.tscn
│   ├── level_3_new.tscn
│   ├── level_4.tscn
│   ├── character_body_2d.tscn
│   ├── enemy.tscn
│   ├── skeleton.tscn
│   ├── wizard.tscn
│   └── ...
└── asset/
    └── oyun görselleri, sesler, fontlar ve çevre assetleri
```

> `secnes/` klasör adı mevcut Godot resource path'lerinin bir parçası olduğu için korunmuştur. Tüm referanslar güncellenmeden klasörü yeniden adlandırmak projeyi bozabilir.

## 💾 Kayıt Sistemi

`SaveManager`, Godot autoload olarak çalışır ve checkpoint verisini şu konumda saklar:

```text
user://save_game.cfg
```

Kayıt dosyasında mevcut scene, checkpoint pozisyonu ve checkpoint durumu tutulur. Ana menü mevcut bir kayıt olup olmadığını kontrol eder ve geçerli kayıt varsa **Continue** seçeneğini etkinleştirir.

## 🧠 Geliştirme Özellikleri

Bu proje aşağıdaki alanlarda pratik deneyimi gösterir:

- Yeniden kullanılabilir Godot scene yapısı
- Karakter state ve combat mantığı
- Enemy AI ve encounter davranışları
- Collision tabanlı gameplay sistemleri
- Level progression ve scene transition
- Save / checkpoint mimarisi
- Gameplay UI ve menü etkileşimleri
- Ability progression ve shop mekanikleri
- Harici ve özel görsel assetleri çalışan bir oyuna entegre etme
- Iteratif debugging ve AI destekli yazılım geliştirme

## 🚀 Projeyi Çalıştırma

1. **Godot 4.6** veya uyumlu bir Godot 4.x sürümü kurun.
2. Repository'yi klonlayın.
3. Godot Project Manager'ı açın.
4. `project.godot` dosyasını seçerek proje klasörünü içe aktarın.
5. Projeyi çalıştırın.

```bash
git clone https://github.com/safialajati2-creator/the-shadow-game.git
cd the-shadow-game
```

Ayarlanmış ana scene:

```text
res://secnes/game.tscn
```

## ✅ Proje Bütünlüğü Kontrolü

Portföy sürümü hazırlanırken:

- ZIP dosyasının tam Godot kaynak projesini içerdiği doğrulandı.
- `project.godot` ve ayarlanmış ana scene bulundu.
- 47 GDScript ve 30 `.tscn` scene dosyası tespit edildi.
- Scene dosyalarındaki `res://` dosya referansları eksik path açısından statik olarak kontrol edildi; eksik dosya yolu bulunmadı.
- Godot tarafından oluşturulan cache/build klasörleri version control dışında bırakıldı.

İnceleme ortamında Godot executable bulunmadığından tam runtime playthrough **yapılmadı**. Final release yayınlanmadan önce oyun Godot editor üzerinden çalıştırılarak tekrar doğrulanmalıdır.

## 🎨 Assetler ve Haklar

Projede oyun geliştirme sürecinde kullanılan görsel assetler, fontlar, sesler, özel/üretilmiş çalışmalar ve üçüncü taraf asset paketleri bulunmaktadır. Asset dosyaları ve repository içinde yer alan lisans belgeleri kendi orijinal kullanım şartlarına tabidir.

Bu repository bir **yazılım / oyun geliştirme portföy projesi** olarak sunulmaktadır. Ticari dağıtım yapılacaksa kullanılan üçüncü taraf assetlerin lisans koşullarının hedef dağıtım modeline göre ayrıca kontrol edilmesi önerilir.

## 🎯 Proje Amacı

THE SHADOW; **Godot 4, GDScript, 2D platformer mekanikleri, savaş sistemleri, düşman davranışları, oyun durum yönetimi, save/checkpoint sistemleri, level design entegrasyonu, UI geliştirme ve AI destekli geliştirme iş akışları** konularındaki uygulamalı becerileri göstermeyi amaçlar.
