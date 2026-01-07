function fis = create_land_valuation_fis()
    % Create new Fuzzy Inference System
    fis = mamfis('Name', 'ArsaDegerleme');

    %% 1. INPUT: Alan (Area) [m^2]
    fis = addInput(fis, [0 780], 'Name', 'Alan');
    fis = addMF(fis, 'Alan', 'trapmf', [0 100 200 300], 'Name', 'Kucuk');
    fis = addMF(fis, 'Alan', 'trapmf', [200 300 400 500], 'Name', 'Orta');
    fis = addMF(fis, 'Alan', 'trapmf', [450 500 600 780], 'Name', 'Buyuk');

    %% 2. INPUT: Konum (Location) [Score]
    fis = addInput(fis, [0 1000], 'Name', 'Konum');
    fis = addMF(fis, 'Konum', 'trapmf', [0 100 200 300], 'Name', 'MerkeziDegil');
    fis = addMF(fis, 'Konum', 'trapmf', [200 300 400 500], 'Name', 'AzMerkezi');
    fis = addMF(fis, 'Konum', 'trapmf', [500 600 700 1000], 'Name', 'Merkezi');

    %% 3. INPUT: Geometrik Sekil (Shape) [Score]
    fis = addInput(fis, [0 740], 'Name', 'Geometri');
    fis = addMF(fis, 'Geometri', 'trapmf', [0 100 200 300], 'Name', 'DuzgunDegil');
    fis = addMF(fis, 'Geometri', 'trapmf', [250 400 550 600], 'Name', 'AzDuzgun');
    fis = addMF(fis, 'Geometri', 'trapmf', [550 600 700 740], 'Name', 'Duzgun');

    %% 4. INPUT: KAKS [Ratio]
    fis = addInput(fis, [0 2.0], 'Name', 'KAKS');
    fis = addMF(fis, 'KAKS', 'trapmf', [0.0 0.3 0.4 0.55], 'Name', 'Dusuk'); 
    fis = addMF(fis, 'KAKS', 'trapmf', [0.45 0.6 0.7 1.1], 'Name', 'Orta'); 
    fis = addMF(fis, 'KAKS', 'trapmf', [0.9 1.2 1.6 2.0], 'Name', 'Yuksek');

    %% 5. OUTPUT: Deger (Value) [TL/m^2]
    fis = addOutput(fis, [0 800], 'Name', 'Deger');
    fis = addMF(fis, 'Deger', 'trimf', [0 150 300], 'Name', 'Dusuk');
    fis = addMF(fis, 'Deger', 'trimf', [200 350 480], 'Name', 'Orta');
    fis = addMF(fis, 'Deger', 'trimf', [420 500 600], 'Name', 'Yuksek');
    fis = addMF(fis, 'Deger', 'trimf', [500 650 800], 'Name', 'CokYuksek');

    %% 6. RULES
    rules = [];
    
    % --- 1. Primary Drivers (Konum) ---
    rules = [rules; 1 0 0 0, 1, 1, 1]; % MerkeziDegil -> Dusuk
    rules = [rules; 2 0 0 0, 2, 1, 1]; % AzMerkezi -> Orta
    rules = [rules; 3 0 0 0, 3, 1, 1]; % Merkezi -> Yuksek
    
    % --- 2. KAKS Modifiers (Context Specific) ---
    
    % KAKS=Dusuk -> Pull Down (Always valid)
    rules = [rules; 0 0 0 1, 1, 0.5, 1]; 
    
    % KAKS=Orta -> Pull Mid
    % CRITICAL FIX: Only apply KAKS=Orta boost if Konum is NOT bad.
    % If Konum is Bad(1), KAKS=Orta should NOT pull price up.
    rules = [rules; 2 0 0 2, 2, 0.6, 1]; % AzMerkezi & KAKS Orta -> Orta
    rules = [rules; 3 0 0 2, 2, 0.6, 1]; % Merkezi & KAKS Orta -> Orta (Helpers for Case 2)
    
    % KAKS=Yuksek -> Pull High
    rules = [rules; 0 0 0 3, 3, 0.6, 1]; 
    
    % --- 3. Shape Modifiers ---
    rules = [rules; 0 0 1 0, 1, 0.3, 1]; % DuzgunDegil -> Pull Down
    
    % --- 4. Explicit Overrides/Stabilizers ---
    
    % Case 4 Fix: MerkeziDegil(1) + AzDuzgun(2) + KAKS(0.5)
    % Ensure this stays LOW.
    rules = [rules; 1 0 2 0, 1, 1, 1]; % MerkeziDegil & AzDuzgun -> Dusuk (Strong)
    rules = [rules; 1 0 0 2, 1, 1, 1]; % MerkeziDegil & KAKS Orta -> Dusuk (Strong Suppressor)
    
    % Case 1 Stability: AzMerkezi(2) + DuzgunDegil(1)
    % Handled by DuzgunDegil->Dusuk (0.3) + KAKS Dusuk->Dusuk.
    
    % Case 2: Merkezi(3) + KAKS(Orta) -> Should be ~439
    % Handled by Rules: Konum(3)->Yuksek(500) AND Konum(3)&KAKS(2)->Orta(350).
    % Blend 500 & 350 -> ~430-450. Good.
    
    fis = addRule(fis, rules);
    fis.DefuzzMethod = 'centroid';
end
