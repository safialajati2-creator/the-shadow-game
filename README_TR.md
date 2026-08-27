# 🌑 THE SHADOW

<p align="center">
  <a href="README.md">English</a> | <b>Türkçe</b>
</p>

![Godot](https://img.shields.io/badge/Godot-4.6-478CBF?logo=godot-engine&logoColor=white)
![GDScript](https://img.shields.io/badge/GDScript-Oyun%20Sistemleri-478CBF)
![Tür](https://img.shields.io/badge/T%C3%BCr-2D%20Action%20Platformer-black)
![Durum](https://img.shields.io/badge/Durum-Portf%C3%B6y%20Projesi-success)

**THE SHADOW**, **Godot 4.6** ve **GDScript** ile geliştirilen 2D aksiyon-platform oyun projesidir. Proje; karakter hareketi, yönlü saldırılar, dash mekanikleri, farklı düşman davranışları, tuzaklar, checkpoint sistemi, kayıt/devam sistemi, rune tabanlı mağaza mekaniği, bölüm geçişleri ve çok seviyeli ilerleme yapısını bir araya getirir.

Geliştirme sürecinde **OpenAI Codex**, kod iterasyonu, hata ayıklama ve geliştirme akışını hızlandıran bir yardımcı araç olarak kullanılmıştır. Oyun tasarımı, scene yapısı, sistem entegrasyonu ve proje kararları geliştirme sürecinin temel parçası olarak yürütülmüştür.

## 🎮 Temel Oynanış Sistemleri

- Yatay hareket ve zıplama
- Normal Dash ve Special Dash
- Öne, yukarı ve aşağı yönlü saldırılar
- Combo odaklı savaş sistemi
- Can, hasar, knockback ve freeze durumları
- Skeleton, Guard ve Wizard dahil farklı düşman davranışları
- Kill zone, saw trap ve çevresel tehlikeler
- Checkpoint ve respawn akışı
- Portal ile bölüm geçişleri
- Rune / shop sistemi
- `SaveManager` ile kayıt ve devam sistemi
- Gündüz / akşam çevresel geçişleri
- Birden fazla bölüm ve oyun scene'i

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
| GDScript | Oynanış ve oyun sistemi kodları |
| Godot Scenes (`.tscn`) | Bölüm ve obje kompozisyonu |
| CharacterBody2D | Karakter hareketi |
| Area2D / CollisionShape2D | Savaş, tuzaklar ve etkileşim alanları |
| ConfigFile | Save / checkpoint kalıcılığı |
| OpenAI Codex | AI destekli kodlama, debugging ve iterasyon desteği |

## 🏗️ Proje Yapısı

Projede oyuncu kontrolü, düşmanlar, checkpoint, mağaza/rune sistemi, tuzaklar, platformlar, portallar, save yönetimi, çevresel geçişler, kullanıcı arayüzleri ve birden fazla bölüm için tekrar kullanılabilir Godot scene ve script yapısı bulunmaktadır.

Ana proje ayarı `project.godot` dosyasındadır ve ana oyun scene'i proje içindeki scene klasöründen başlatılır.

> Mevcut projede `secnes/` klasör adı resource path'lerin parçası olduğu için korunmuştur. Tüm referanslar güncellenmeden yeniden adlandırılması projeyi bozabilir.

## 💾 Kayıt Sistemi

`SaveManager`, Godot autoload olarak çalışır ve checkpoint verilerini `user://save_game.cfg` üzerinden saklar. Sistem mevcut scene, checkpoint pozisyonu ve ilerleme bilgisini koruyarak oyuna devam akışını destekler.

## 🤖 AI Destekli Geliştirme

OpenAI Codex, geliştirme sürecinde yardımcı araç olarak kullanılmıştır. Kod düzenleme, troubleshooting ve gameplay mantığının iyileştirilmesi gibi görevlerde destek sağlamıştır. Oyun tasarımı, entegrasyon, test ve genel proje yönü geliştirme sürecinin parçası olarak ele alınmıştır.

## 🎨 Assetler ve Haklar

Projede görsel, ses ve üçüncü taraf oyun assetleri bulunmaktadır. Asset dosyaları ve repository içindeki lisans belgeleri kendi orijinal kullanım şartlarına tabidir. Repository, ticari asset dağıtım paketi değil; oyun geliştirme ve yazılım portföy projesi olarak sunulmaktadır.

## 🚀 Projeyi Çalıştırma

1. **Godot 4.6** veya uyumlu bir Godot 4.x sürümü kurun.
2. Repository'yi klonlayın.
3. Godot Project Manager üzerinden `project.godot` dosyasını içe aktarın.
4. Asset import işleminin tamamlanmasını bekleyin.
5. Ana scene'i / projeyi çalıştırın.

```bash
git clone https://github.com/safialajati2-creator/the-shadow-game.git
```

## 📸 Ekran Görüntüleri / Gameplay

Gameplay ekran görüntüleri ve ek portföy görselleri bu bölüme eklenecektir.

## ✅ Proje Kontrolü

Portföy hazırlığı sırasında Godot proje yapısı, GDScript dosyaları, scene dosyaları, proje ayarları ve `res://` resource referansları statik olarak incelendi. Godot tarafından üretilen cache/import dosyaları ve gereksiz editör/işletim sistemi dosyaları version control dışında bırakıldı.

> İnceleme ortamında tam Godot gameplay playthrough yapılmadı. Final runtime davranışı hedef sistemde Godot editor üzerinden ayrıca doğrulanmalıdır.

## 🎯 Proje Amacı

THE SHADOW; **Godot 4, GDScript, 2D character controller, combat sistemleri, enemy behavior, scene mimarisi, checkpoint/persistence, gameplay UI, level progression, debugging ve AI destekli game development** alanlarındaki uygulamalı becerileri göstermeyi amaçlar.
