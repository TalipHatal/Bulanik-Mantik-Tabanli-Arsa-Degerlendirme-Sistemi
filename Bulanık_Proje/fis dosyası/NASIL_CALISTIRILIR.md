# MATLAB Scriptlerini Nasıl Çalıştırırım?

## Hızlı Başlangıç (En Kolay Yöntem)

### Adım 1: MATLAB'ı Açın
1. MATLAB programını başlatın
2. Çalışma dizinini projeye ayarlayın:
   ```matlab
   cd 'C:\Users\hp\Desktop\BulanıkMantık'
   ```

### Adım 2: Tüm Scriptleri Çalıştırın
MATLAB komut penceresine şunu yazın:
```matlab
run_all_scripts
```

Bu komut tüm scriptleri sırayla çalıştırır ve:
- FIS'i oluşturur
- Tüm şekilleri oluşturur
- Analizleri yapar
- Sonuçları gösterir

**NOT**: Her adım arasında "Devam etmek için bir tuşa basın..." mesajı göreceksiniz. Herhangi bir tuşa basarak devam edin.

---

## Adım Adım Çalıştırma (Detaylı Kontrol)

Eğer her scripti ayrı ayrı çalıştırmak isterseniz:

### 1. Temel Değerleme
```matlab
run_valuation
```
**Ne yapar?**: FIS'i oluşturur, 5 test vakasını değerlendirir ve sonuçları gösterir.

### 2. PDF Şekillerini Oluşturma
```matlab
visualize_all_figures
```
**Ne yapar?**: PDF'teki Şekil 2-9'u oluşturur ve PNG olarak kaydeder.

### 3. Detaylı Üyelik Fonksiyonları
```matlab
plot_membership_functions
```
**Ne yapar?**: Her parametre için detaylı üyelik fonksiyonu grafikleri oluşturur.

### 4. FIS Yapısı ve Yüzey Grafikleri
```matlab
visualize_fis_structure
```
**Ne yapar?**: FIS yapısını gösterir, kuralları listeler ve 3D yüzey grafikleri oluşturur.

### 5. Sonuç Analizi
```matlab
analyze_results
```
**Ne yapar?**: Test sonuçlarını analiz eder, hata hesaplar ve karşılaştırma grafikleri oluşturur.

### 6. Duyarlılık Analizi
```matlab
sensitivity_analysis
```
**Ne yapar?**: Her parametrenin etkisini analiz eder ve önem sırasını gösterir.

---

## Özel Arsa Değerleme Yapmak

Kendi arsanızı değerlemek için:

```matlab
% 1. FIS'i yükleyin
fis = readfis('arsa_degerleme.fis');

% 2. Arsa özelliklerini girin
alan = 500;        % Arsa alanı (m²)
konum = 750;       % Konum skoru (0-1000)
                   % 150=Merkezi Değil, 350=Az Merkezi, 750=Merkezi
geometri = 645;    % Geometri skoru (0-740)
                   % 150=Düzgün Değil, 425=Az Düzgün, 645=Düzgün
kaks = 1.2;        % KAKS değeri (0-2.0)

% 3. Değeri hesaplayın
deger = evalfis(fis, [alan, konum, geometri, kaks]);

% 4. Sonucu gösterin
fprintf('Arsa Değeri: %.2f TL/m²\n', deger);
```

### Konum Skoru Rehberi:
- **Merkezi Değil**: 150
- **Az Merkezi**: 350
- **Merkezi**: 750

### Geometri Skoru Rehberi:
- **Düzgün Değil**: 150
- **Az Düzgün**: 425
- **Düzgün**: 645

### KAKS Değerleri:
- **Düşük**: 0.3 - 0.5
- **Orta**: 0.6 - 1.0
- **Yüksek**: 1.2 - 2.0

---

## Oluşturulan Dosyalar

Scriptler çalıştıktan sonra şu dosyalar oluşturulacak:

### FIS Dosyası
- `arsa_degerleme.fis` - Kaydedilmiş bulanık çıkarım sistemi

### PDF Şekilleri (8 adet)
- `Sekil_2_Bulanik_Kume.png`
- `Sekil_3_Uyelik_Fonksiyonu_Bolumleri.png`
- `Sekil_4_X_Bulanik_Girdisi.png`
- `Sekil_5_Y_Bulanik_Girdisi.png`
- `Sekil_6_XY_Bulanik_Ciktisi.png`
- `Sekil_7_Giris_Uyelik_Fonksiyonlari.png`
- `Sekil_8_Cikis_Uyelik_Fonksiyonu.png`
- `Sekil_9_Yuzey_Grafigi.png`

### Üyelik Fonksiyonları (6 adet)
- `Uyelik_Fonksiyonlari_Detayli.png`
- `MF_Alan_Detayli.png`
- `MF_Konum_Detayli.png`
- `MF_Geometri_Detayli.png`
- `MF_KAKS_Detayli.png`
- `MF_Deger_Detayli.png`

### Yüzey Grafikleri (5 adet)
- `Yuzey_Konum_KAKS.png`
- `Yuzey_Alan_Konum.png`
- `Yuzey_Geometri_KAKS.png`
- `Yuzey_Alan_Geometri.png`
- `Test_Vakalari_3D.png`

### Analiz Grafikleri (3 adet)
- `Karsilastirma_Grafigi.png`
- `Hata_Analizi.png`
- `Korelasyon_Grafigi.png`

### Duyarlılık Analizi (4 adet)
- `Duyarlilik_Analizi_Detayli.png`
- `Duyarlilik_Karsilastirma.png`
- `Duyarlilik_Normalize.png`
- `Etkilesim_Konum_KAKS.png`

**TOPLAM: 26 görsel dosya + 1 FIS dosyası**

---

## Sorun Giderme

### "Fuzzy Logic Toolbox bulunamadı" hatası
MATLAB'da Fuzzy Logic Toolbox yüklü olmalı. Kontrol için:
```matlab
ver
```

### "Dosya bulunamadı" hatası
Çalışma dizinini kontrol edin:
```matlab
pwd  % Mevcut dizini gösterir
cd 'C:\Users\hp\Desktop\BulanıkMantık'  % Doğru dizine geçin
```

### Grafik pencereleri açılmıyor
```matlab
close all  % Tüm pencereleri kapat
run_all_scripts  % Tekrar çalıştır
```

---

## İpuçları

1. **İlk kez çalıştırıyorsanız**: `run_all_scripts` kullanın
2. **Sadece görsel istiyorsanız**: `visualize_all_figures` yeterli
3. **Analiz yapmak istiyorsanız**: `analyze_results` ve `sensitivity_analysis`
4. **Özel değerleme için**: Yukarıdaki "Özel Arsa Değerleme" bölümünü kullanın

---

## Sonraki Adımlar

1. ✅ MATLAB'ı açın
2. ✅ Dizini ayarlayın: `cd 'C:\Users\hp\Desktop\BulanıkMantık'`
3. ✅ Çalıştırın: `run_all_scripts`
4. ✅ Oluşturulan görselleri inceleyin
5. ✅ Kendi değerlemelerinizi yapın!
