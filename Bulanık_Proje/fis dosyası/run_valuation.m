%%
% Main script to run Fuzzy Land Valuation
clc; clear; close all;

% 1. Load the FIS (directly from file instead of creating)
fis = readfis('arsa_degerleme.fis');

% 2. Plot membership functions (optional, saves to file)
% figure; plotmf(fis, 'input', 1); title('Alan'); saveas(gcf, 'mf_alan.png');
% figure; plotmf(fis, 'input', 2); title('Konum'); saveas(gcf, 'mf_konum.png');

% 3. Define Test Cases (from Table 2)
input1 = [416.85, 350, 150, 0.40];
input2 = [635.48, 750, 645, 1.00];
input3 = [713.32, 750, 645, 1.50];
input4 = [391.86, 150, 425, 0.50];
input5 = [750.24, 750, 645, 1.50];

inputs = [input1; input2; input3; input4; input5];

% 4. Evaluate
results = evalfis(fis, inputs);

% 5. Display Results
disp('--- Valuation Results ---');
disp('   Alan     Konum(Sc)  Geom(Sc)   KAKS      Calculated(TL/m2)');
for i = 1:size(inputs, 1)
    fprintf('%d. %6.2f   %6.2f     %6.2f     %4.2f     -> %6.2f\n', ...
        i, inputs(i,1), inputs(i,2), inputs(i,3), inputs(i,4), results(i));
end

disp(' ');
disp('Expected Reference (Table 3):');
disp('1. ~260');
disp('2. ~439');
disp('3. ~508');
disp('4. ~172');
disp('5. ~511');

disp('FIS loaded successfully with 81 rules!');