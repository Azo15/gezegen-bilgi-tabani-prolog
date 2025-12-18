# Gezegen Bilgi Tabanı ve Formal Concept Analysis (FCA)

Bu proje, Prolog dili kullanılarak oluşturulmuş basit bir **gezegen bilgi tabanı** üzerinde
**Formal Concept Analysis (FCA)** yaklaşımını uygulamayı amaçlamaktadır.
Sistem; gezegen–özellik ilişkilerini tanımlar, ortak nitelikleri ve ortak nesneleri bulur
ve kavram (closure) hesaplaması yapar.

---

## 📌 Projenin Amacı

- Gezegenler ile onların özellikleri arasındaki ilişkileri mantıksal kurallar ile ifade etmek
- Zincir (linked list benzeri) yapı kullanarak liste işlemlerini gerçekleştirmek
- FCA operatörlerini (intent ve extent) Prolog ortamında uygulamak
- Kavram bulma (closure) işlemini adım adım modellemek

---

## 🧠 Kullanılan Teknolojiler

- **Programlama Dili:** Prolog  
- **Yaklaşım:** Mantıksal Programlama  
- **Kavramsal Yöntem:** Formal Concept Analysis (FCA)

---

## 📂 Kod Yapısı

Kod dört ana bölümden oluşmaktadır:

### 1️⃣ Bilgi Tabanı (Gezegenler)

Bu bölümde gezegenler ile onların özellikleri arasındaki ilişkiler tanımlanmıştır.

Örnek özellikler:
- `kayasal`
- `gaz_devi`
- `sicak`
- `soguk`
- `halkali`
- `uydulu`
- `yasam_var`

İlişkiler `iliski(Gezegen, Ozellik)` yapısı ile ifade edilmiştir.

---

### 2️⃣ Zincir Yapısı ve Hata Ayıklama

Bu bölümde özel bir **zincir (z/2)** yapısı kullanılarak liste işlemleri gerçekleştirilmiştir.

Tanımlanan temel kurallar:
- `eleman_mi/2` → Bir elemanın zincirde olup olmadığını kontrol eder
- `kapsar_mi/2` → Bir zincirin başka bir zinciri kapsayıp kapsamadığını kontrol eder

Ayrıca, zincirin sonunu belirlemek için `son` atomu kullanılarak
sonsuz döngü hataları engellenmiştir.

---

### 3️⃣ FCA Operatörleri

Bu bölüm Formal Concept Analysis’in temel operatörlerini içerir.

#### 🔹 Ortak Nitelikler (Intent)

ortak_nitelikler(Nesneler, NitelikZinciri).
Verilen nesnelerin ortak sahip olduğu özellikleri bulur.

🔹 Ortak Nesneler (Extent)
prolog
Copy code
ortak_nesneler(Nitelikler, NesneZinciri).
Verilen özelliklere sahip olan tüm nesneleri döndürür.

4️⃣ Kavram Bulma (Closure)
prolog
Copy code
kavram_bul(Giris, SonucNesne, SonucNitelik).
Bu kural FCA’deki closure (kapanış) işlemini gerçekleştirir:

Girilen nesnelerden ortak nitelikler bulunur (Intent)

Bu niteliklere sahip tüm nesneler hesaplanır (Extent)

Sonuçta bir formal kavram elde edilir.

▶️ Örnek Kullanım
prolog
Copy code
?- kavram_bul(z(dunya, z(mars, son)), Nesneler, Nitelikler).
Bu sorgu:

Dünya ve Mars’ın ortak özelliklerini bulur

Bu özelliklere sahip olan tüm gezegenleri listeler

✅ Sonuç
Bu proje ile:

Prolog kullanarak bilgi tabanı oluşturma

Zincir veri yapısı ile liste işlemleri

FCA’nin temel kavramlarının (intent, extent, closure) uygulanması
başarılı şekilde gerçekleştirilmiştir.

Çalışma, mantıksal programlama ve kavramsal veri analizi konularını
öğrenmek için örnek bir uygulama niteliğindedir.


Bu proje, eğitim amaçlı olarak hazırlanmıştır.

