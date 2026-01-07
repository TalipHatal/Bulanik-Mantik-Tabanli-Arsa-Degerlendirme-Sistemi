% RUN_ALL_SCRIPTS.M
% Master script to run all analysis and visualization scripts in order
% This provides a complete demonstration of the fuzzy logic land valuation system

clc; clear; close all;

disp('========================================');
disp('BULANIK MANTIK İLE ARSA DEĞERLEME');
disp('Tüm Scriptlerin Çalıştırılması');
disp('========================================');
disp(' ');

%% Step 1: Create FIS and Run Basic Valuation
disp('ADIM 1: FIS Oluşturma ve Temel Değerleme');
disp('----------------------------------------');
run_valuation;
disp(' ');
disp('Devam etmek için bir tuşa basın...');
pause;
close all;

%% Step 2: Generate All Figures from PDF
disp(' ');
disp('ADIM 2: PDF Şekillerini Oluşturma');
disp('----------------------------------------');
visualize_all_figures;
disp(' ');
disp('Devam etmek için bir tuşa basın...');
pause;
close all;

%% Step 3: Plot Detailed Membership Functions
disp(' ');
disp('ADIM 3: Detaylı Üyelik Fonksiyonları');
disp('----------------------------------------');
plot_membership_functions;
disp(' ');
disp('Devam etmek için bir tuşa basın...');
pause;
close all;

%% Step 4: Visualize FIS Structure
disp(' ');
disp('ADIM 4: FIS Yapısı ve Yüzey Grafikleri');
disp('----------------------------------------');
visualize_fis_structure;
disp(' ');
disp('Devam etmek için bir tuşa basın...');
pause;
close all;

%% Step 5: Analyze Results
disp(' ');
disp('ADIM 5: Sonuç Analizi');
disp('----------------------------------------');
analyze_results;
disp(' ');
disp('Devam etmek için bir tuşa basın...');
pause;
close all;

%% Step 6: Sensitivity Analysis
disp(' ');
disp('ADIM 6: Duyarlılık Analizi');
disp('----------------------------------------');
sensitivity_analysis;
disp(' ');

%% Final Summary
disp(' ');
disp('========================================');
disp('TÜM İŞLEMLER TAMAMLANDI!');
disp('========================================');
disp(' ');
disp('Oluşturulan Dosyalar:');
disp(' ');
disp('FIS Dosyası:');
disp('  - arsa_degerleme.fis');
disp(' ');
disp('PDF Şekilleri:');
disp('  - Sekil_2_Bulanik_Kume.png');
disp('  - Sekil_3_Uyelik_Fonksiyonu_Bolumleri.png');
disp('  - Sekil_4_X_Bulanik_Girdisi.png');
disp('  - Sekil_5_Y_Bulanik_Girdisi.png');
disp('  - Sekil_6_XY_Bulanik_Ciktisi.png');
disp('  - Sekil_7_Giris_Uyelik_Fonksiyonlari.png');
disp('  - Sekil_8_Cikis_Uyelik_Fonksiyonu.png');
disp('  - Sekil_9_Yuzey_Grafigi.png');
disp(' ');
disp('Üyelik Fonksiyonları:');
disp('  - Uyelik_Fonksiyonlari_Detayli.png');
disp('  - MF_Alan_Detayli.png');
disp('  - MF_Konum_Detayli.png');
disp('  - MF_Geometri_Detayli.png');
disp('  - MF_KAKS_Detayli.png');
disp('  - MF_Deger_Detayli.png');
disp(' ');
disp('Yüzey Grafikleri:');
disp('  - Yuzey_Konum_KAKS.png');
disp('  - Yuzey_Alan_Konum.png');
disp('  - Yuzey_Geometri_KAKS.png');
disp('  - Yuzey_Alan_Geometri.png');
disp('  - Test_Vakalari_3D.png');
disp(' ');
disp('Analiz Grafikleri:');
disp('  - Karsilastirma_Grafigi.png');
disp('  - Hata_Analizi.png');
disp('  - Korelasyon_Grafigi.png');
disp(' ');
disp('Duyarlılık Analizi:');
disp('  - Duyarlilik_Analizi_Detayli.png');
disp('  - Duyarlilik_Karsilastirma.png');
disp('  - Duyarlilik_Normalize.png');
disp('  - Etkilesim_Konum_KAKS.png');
disp(' ');
disp('========================================');
disp('Proje tamamlandı! Tüm görseller ve analizler hazır.');
disp('========================================');

%% Quick Reference Guide
disp(' ');
disp('HIZLI KULLANIM REHBERİ:');
disp('----------------------------------------');
disp('Özel bir arsa değerlemesi yapmak için:');
disp(' ');
disp('  fis = readfis(''arsa_degerleme.fis'');');
disp('  alan = 500;        % m²');
disp('  konum = 750;       % Merkezi');
disp('  geometri = 645;    % Düzgün');
disp('  kaks = 1.2;        % Yüksek');
disp('  deger = evalfis(fis, [alan, konum, geometri, kaks]);');
disp('  fprintf(''Arsa Değeri: %.2f TL/m²\n'', deger);');
disp(' ');
disp('Daha fazla bilgi için README.md dosyasına bakın.');
disp('========================================');
