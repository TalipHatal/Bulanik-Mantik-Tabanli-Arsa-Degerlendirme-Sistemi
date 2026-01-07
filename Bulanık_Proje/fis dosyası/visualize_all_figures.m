% VISUALIZE_ALL_FIGURES.M
% Master script to generate all figures from the PDF
% "Bulanık Mantık ile Arsa Değerleme Modelinin Oluşturulması"

clc; clear; close all;

%% Figure 2: Fuzzy Set Representation (Şekil 2)
% Shows intersecting sets A, B and independent set C
% A: Triangle, B: Trapezoid (overlapping with A), C: Triangle (separate)
figure('Name', 'Şekil 2: Bulanık Küme Gösterimi', 'NumberTitle', 'off');
x = 0:0.01:1.5;

% Define membership functions for sets A, B, C
% A: Triangular (üçgen) - positioned at left
mu_A = max(0, min((x - 0.1) / 0.4, (0.9 - x) / 0.4));

% B: Trapezoidal (yamuk) - overlaps with A, flat top in middle
mu_B = zeros(size(x));
for i = 1:length(x)
    if x(i) >= 0.4 && x(i) <= 0.6
        mu_B(i) = (x(i) - 0.4) / 0.2;  % Rising edge
    elseif x(i) > 0.6 && x(i) <= 0.9
        mu_B(i) = 1.0;  % Flat top
    elseif x(i) > 0.9 && x(i) <= 1.1
        mu_B(i) = (1.1 - x(i)) / 0.2;  % Falling edge
    end
end

% C: Triangular (üçgen) - completely separate on the right
mu_C = max(0, min((x - 1.15) / 0.15, (1.45 - x) / 0.15));

plot(x, mu_A, 'b-', 'LineWidth', 2.5); hold on;
plot(x, mu_B, 'Color', [1 0.5 0], 'LineWidth', 2.5);  % Orange color for B
plot(x, mu_C, 'Color', [0.5 0.5 0.5], 'LineWidth', 2.5);  % Gray color for C
xlabel('Küme Değerleri', 'FontSize', 12);
ylabel('Üyelik Derecesi', 'FontSize', 12);
title('Bulanık Küme Gösterimi', 'FontSize', 14, 'FontWeight', 'bold');
legend('A', 'B', 'C', 'Location', 'northeast', 'FontSize', 11);
grid on;
ylim([0 1.2]);
xlim([0 1.5]);
saveas(gcf, 'Sekil_2_Bulanik_Kume.png');

%% Figure 3: Membership Function Components (Şekil 3)
% Shows core (öz) and support (dayanak) of a trapezoidal membership function
figure('Name', 'Şekil 3: Üyelik Fonksiyonunun Bölümleri', 'NumberTitle', 'off');
x = 0:0.01:10;
% Trapezoidal membership function
a = 2; b = 4; c = 6; d = 8;
mu = max(0, min((x-a)/(b-a), min(1, (d-x)/(d-c))));

plot(x, mu, 'b-', 'LineWidth', 2.5); hold on;
% Mark the core
plot([b c], [1 1], 'r-', 'LineWidth', 3);
text((b+c)/2, 1.05, 'ÖZ (Core)', 'HorizontalAlignment', 'center', 'FontSize', 11, 'FontWeight', 'bold');
% Mark the support
plot([a d], [0 0], 'g-', 'LineWidth', 3);
text((a+d)/2, -0.08, 'DAYANAK (Support)', 'HorizontalAlignment', 'center', 'FontSize', 11, 'FontWeight', 'bold');
xlabel('Değerler', 'FontSize', 12);
ylabel('Üyelik Derecesi', 'FontSize', 12);
title('Üyelik Fonksiyonunun Bölümleri', 'FontSize', 14, 'FontWeight', 'bold');
grid on;
ylim([-0.15 1.15]);
saveas(gcf, 'Sekil_3_Uyelik_Fonksiyonu_Bolumleri.png');

%% Figure 4: X Fuzzy Input (Şekil 4)
% Single trapezoidal membership function for X input - max at 0.5
figure('Name', 'Şekil 4: X Bulanık Girdisi', 'NumberTitle', 'off');
x = 0:0.01:10;

% Single trapezoidal membership function - proper trapezoid with flat top at 0.5
mu_X = zeros(size(x));
for i = 1:length(x)
    if x(i) >= 2 && x(i) <= 4
        mu_X(i) = (x(i) - 2) / 2 * 0.5;  % Rising edge from 0 to 0.5
    elseif x(i) > 4 && x(i) <= 6
        mu_X(i) = 0.5;  % Flat top at 0.5
    elseif x(i) > 6 && x(i) <= 8
        mu_X(i) = 0.5 - ((x(i) - 6) / 2) * 0.5;  % Falling edge from 0.5 to 0
    end
end

plot(x, mu_X, 'b-', 'LineWidth', 2.5);
xlabel('X Değerleri', 'FontSize', 12);
ylabel('Üyelik Derecesi', 'FontSize', 12);
title('X Bulanık Girdisi', 'FontSize', 14, 'FontWeight', 'bold');
grid on;
ylim([0 0.6]);
xlim([0 10]);
saveas(gcf, 'Sekil_4_X_Bulanik_Girdisi.png');

%% Figure 5: Y Fuzzy Input (Şekil 5)
% Single triangular membership function for Y input - max at 0.5
figure('Name', 'Şekil 5: Y Bulanık Girdisi', 'NumberTitle', 'off');
y = 0:0.01:10;

% Single triangular membership function - peaks at 0.5, spans x=2 to x=8
mu_Y = max(0, min((y - 2) / 3, (8 - y) / 3)) * 0.5;

plot(y, mu_Y, 'Color', [1 0.5 0], 'LineWidth', 2.5);  % Orange color
xlabel('Y Değerleri', 'FontSize', 12);
ylabel('Üyelik Derecesi', 'FontSize', 12);
title('Y Bulanık Girdisi', 'FontSize', 14, 'FontWeight', 'bold');
grid on;
ylim([0 0.6]);
xlim([0 10]);
saveas(gcf, 'Sekil_5_Y_Bulanik_Girdisi.png');

%% Figure 6: X and Y Fuzzy Output (Şekil 6)
% Combined fuzzy output - single continuous shape (trapezoid + triangle), spans x=2 to x=8
figure('Name', 'Şekil 6: X ve Y Bulanık Küme Çıktısı', 'NumberTitle', 'off');
z = 0:0.01:10;

% Create single combined membership function (trapezoid transitions into triangle)
mu_combined = zeros(size(z));
for i = 1:length(z)
    % Trapezoid part: rises and stays flat
    if z(i) >= 2 && z(i) <= 3
        mu_combined(i) = (z(i) - 2) / 1 * 0.5;  % Rising edge from 0 to 0.5
    elseif z(i) > 3 && z(i) <= 4.5
        mu_combined(i) = 0.5;  % Flat top at 0.5
    % Triangle part: continues flat, then dips and rises
    elseif z(i) > 4.5 && z(i) <= 5.5
        mu_combined(i) = 0.5;  % Continues flat top
    elseif z(i) > 5.5 && z(i) <= 6
        mu_combined(i) = 0.5 - ((z(i) - 5.5) / 0.5) * 0.25;  % Falls from 0.5 to 0.25
    elseif z(i) > 6 && z(i) <= 7
        mu_combined(i) = 0.25 + ((z(i) - 6) / 1) * 0.25;  % Rises from 0.25 to 0.5 (peak)
    elseif z(i) > 7 && z(i) <= 8
        mu_combined(i) = 0.5 - ((z(i) - 7) / 1) * 0.5;  % Falls from 0.5 to 0
    end
end

% Plot as single continuous line
plot(z, mu_combined, 'Color', [0.6 0.6 0.6], 'LineWidth', 2.5);
xlabel('Çıktı Değerleri', 'FontSize', 12);
ylabel('Üyelik Derecesi', 'FontSize', 12);
title('X ve Y Bulanık Küme Çıktısı', 'FontSize', 14, 'FontWeight', 'bold');
grid on;
ylim([0 0.6]);
xlim([0 10]);
saveas(gcf, 'Sekil_6_XY_Bulanik_Ciktisi.png');

%% Figure 7-9: FIS Visualizations
% These require the actual FIS to be loaded
if exist('arsa_degerleme.fis', 'file')
    fis = readfis('arsa_degerleme.fis');
    
    % Figure 7: Membership functions for all inputs
    figure('Name', 'Şekil 7: Tüm Giriş Üyelik Fonksiyonları', 'NumberTitle', 'off');
    subplot(2,2,1); plotmf(fis, 'input', 1); title('Alan (m²)', 'FontSize', 12);
    subplot(2,2,2); plotmf(fis, 'input', 2); title('Konum Özellikleri', 'FontSize', 12);
    subplot(2,2,3); plotmf(fis, 'input', 3); title('Geometrik Şekil', 'FontSize', 12);
    subplot(2,2,4); plotmf(fis, 'input', 4); title('KAKS', 'FontSize', 12);
    saveas(gcf, 'Sekil_7_Giris_Uyelik_Fonksiyonlari.png');
    
    % Figure 8: Output membership function
    figure('Name', 'Şekil 8: Çıkış Üyelik Fonksiyonu', 'NumberTitle', 'off');
    plotmf(fis, 'output', 1);
    title('Değer (TL/m²)', 'FontSize', 14, 'FontWeight', 'bold');
    saveas(gcf, 'Sekil_8_Cikis_Uyelik_Fonksiyonu.png');
    
    % Figure 9: Surface plot (Konum vs KAKS -> Değer)
    figure('Name', 'Şekil 9: Yüzey Grafiği (Konum-KAKS-Değer)', 'NumberTitle', 'off');
    gensurf(fis, [2 4], 1); % Konum (input 2) vs KAKS (input 4) -> Değer (output 1)
    title('Konum ve KAKS''a Göre Arsa Değeri', 'FontSize', 14, 'FontWeight', 'bold');
    xlabel('Konum', 'FontSize', 12);
    ylabel('KAKS', 'FontSize', 12);
    zlabel('Değer (TL/m²)', 'FontSize', 12);
    colorbar;
    saveas(gcf, 'Sekil_9_Yuzey_Grafigi.png');
else
    warning('arsa_degerleme.fis file not found. Run create_land_valuation_fis.m first.');
end

disp('All figures generated successfully!');
disp('Saved files:');
disp('  - Sekil_2_Bulanik_Kume.png');
disp('  - Sekil_3_Uyelik_Fonksiyonu_Bolumleri.png');
disp('  - Sekil_4_X_Bulanik_Girdisi.png');
disp('  - Sekil_5_Y_Bulanik_Girdisi.png');
disp('  - Sekil_6_XY_Bulanik_Ciktisi.png');
disp('  - Sekil_7_Giris_Uyelik_Fonksiyonlari.png');
disp('  - Sekil_8_Cikis_Uyelik_Fonksiyonu.png');
disp('  - Sekil_9_Yuzey_Grafigi.png');
