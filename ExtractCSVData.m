close all; clear all;

% 1. Place cell files in folderPath
folderPath = 'C:\Temp\';

% 2. Replace all , with .
% 3. replace all ; with ,

% Set cathegory names
cats = {'Found in frame ID','Covered by regions','Scale factor [µm/pxl]','Laser wavelength [nm]',...
    'Refractive index cell','Refractive index medium','Area (pxl)','Area (µm²)','Boxed breadth (pxl)',...
    'Boxed breadth (µm)','Boxed center pos X (pxl)','Boxed center pos Y (pxl)','Boxed length (pxl)',...
    'Boxed length (µm)','Centroid pos X (pxl)','Centroid pos Y (pxl)','Eccentricity','Hull convexity',...
    'Irregularity','Optical path length avg (µm)','Optical path length max (µm)','Peak pos X (pxl)',...
    'Peak pos Y (pxl)','Perimeter length (pxl)','Perimeter length (µm)','Phaseshift avg','Phaseshift max',...
    'Phaseshift min','Phaseshift std. dev.','Phaseshift sum','Roughness avg','Roughness kurtosis',...
    'Roughness RMS','Roughness skewness','Shape convexity','Texture clustershade','Texture clustertendency',...
    'Texture contrast','Texture correlation','Texture correlation info1','Texture correlation info2',...
    'Texture energy','Texture entropy','Texture homogeneity','Texture maxprob','Thickness avg (µm)',...
    'Thickness max (µm)','Volume (µm³)'};
%indecesToKeep = [7,17];
%indecesToKeep = [7,17,18,19,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45]; %All
% indecesToKeep = [7,17,18,19,26,27,28,29,30,31,32,33,34,36,37,38,39,42,43,44]; %All except obvious irrelevant
%indecesToKeep = [7,17,18,19,24,26,27,28,29,30,31,32,33,34,35,36,37,38,39,42,43,44]; % 22 tested
%indecesToKeep = [7,24,30,32,34,38,39,42,43,44]; %Stat.sig 1µM
indecesToKeep = [7,24,30,32,34,38,39,42,43,44]; %Stat.sig 1µM
cats = removeIrrelevant(cats,cats,indecesToKeep,'cell')

% 4. Read in cell data
% Day 1 *********************************************************
cells_D1_E5_1a = csvread('C:\Temp\cells_D1_E5_1.csv');
cells_D1_E5_1b = csvread('C:\Temp\cells_D1_E5_2.csv');
D1_E5 = [cells_D1_E5_1a;cells_D1_E5_1b];

cells_D1_E1_1a = csvread('C:\Temp\cells_D1_E1_1 (2).csv');
cells_D1_E1_1b = csvread('C:\Temp\cells_D1_E1_1.csv');
cells_D1_E1_2a = csvread('C:\Temp\cells_D1_E1_2 (2).csv');
cells_D1_E1_2b = csvread('C:\Temp\cells_D1_E1_2.csv');
D1_E1 = [cells_D1_E1_1a;cells_D1_E1_1b;cells_D1_E1_2a;cells_D1_E1_2b];

cells_D1_E05_1a = csvread('C:\Temp\cells_D1_E05_1 (2).csv');
cells_D1_E05_1b = csvread('C:\Temp\cells_D1_E05_1 (3).csv');
cells_D1_E05_1c = csvread('C:\Temp\cells_D1_E05_1.csv');
cells_D1_E05_1d = csvread('C:\Temp\cells_D1_E05_1 (4).csv');
cells_D1_E05_2a = csvread('C:\Temp\cells_D1_E05_2 (2).csv');
cells_D1_E05_2b = csvread('C:\Temp\cells_D1_E05_2 (3).csv');
cells_D1_E05_2c = csvread('C:\Temp\cells_D1_E05_2.csv');
cells_D1_E05_2d = csvread('C:\Temp\cells_D1_E05_2 (4).csv');
D1_E05 = [cells_D1_E05_1a;cells_D1_E05_1b;cells_D1_E05_1c;cells_D1_E05_1d; ... 
	cells_D1_E05_2a;cells_D1_E05_2b;cells_D1_E05_2c;cells_D1_E05_2d];

cells_D1_E025_1a = csvread('C:\Temp\cells_D1_E025_1 (2).csv');
cells_D1_E025_1b = csvread('C:\Temp\cells_D1_E025_1.csv');
cells_D1_E025_1c = csvread('C:\Temp\cells_D1_E025_1 (3).csv');
cells_D1_E025_2a = csvread('C:\Temp\cells_D1_E025_2 (2).csv');
cells_D1_E025_2b = csvread('C:\Temp\cells_D1_E025_2.csv');
cells_D1_E025_2c = csvread('C:\Temp\cells_D1_E025_2 (3).csv');
D1_E025 = [cells_D1_E025_1a;cells_D1_E025_1b;cells_D1_E025_1c; ...
	cells_D1_E025_2a;cells_D1_E025_2b;cells_D1_E025_2c];

cells_D1_K_1a = csvread('C:\Temp\cells_D1_K_1 (2).csv');
cells_D1_K_1b = csvread('C:\Temp\cells_D1_K_1 (3).csv');
cells_D1_K_1c = csvread('C:\Temp\cells_D1_K_1 (4).csv');
cells_D1_K_1d = csvread('C:\Temp\cells_D1_K_1.csv');
cells_D1_K_1e = csvread('C:\Temp\cells_D1_K_1 (5).csv');
cells_D1_K_2a = csvread('C:\Temp\cells_D1_K_2 (2).csv');
cells_D1_K_2b = csvread('C:\Temp\cells_D1_K_2 (3).csv');
cells_D1_K_2c = csvread('C:\Temp\cells_D1_K_2 (4).csv');
cells_D1_K_2d = csvread('C:\Temp\cells_D1_K_2.csv');
cells_D1_K_2e = csvread('C:\Temp\cells_D1_K_2 (5).csv');
D1_K = [cells_D1_K_1a;cells_D1_K_1b;cells_D1_K_1c;cells_D1_K_1d; ... 
    cells_D1_K_1e;cells_D1_K_2a;cells_D1_K_2b;cells_D1_K_2c; ...
    cells_D1_K_2d;cells_D1_K_2e];

% Day 2: *************************************************
cells_D2_E5_1a = csvread('C:\Temp\cells_D2_E5_1.csv');
cells_D2_E5_1b = csvread('C:\Temp\cells_D2_E5_2.csv');
D2_E5 = [cells_D2_E5_1a;cells_D2_E5_1b];

cells_D2_E1_1a = csvread('C:\Temp\cells_D2_E1_1 (2).csv');
cells_D2_E1_1b = csvread('C:\Temp\cells_D2_E1_1.csv');
cells_D2_E1_2a = csvread('C:\Temp\cells_D2_E1_2 (2).csv');
cells_D2_E1_2b = csvread('C:\Temp\cells_D2_E1_2.csv');
D2_E1 = [cells_D2_E1_1a;cells_D2_E1_1b;cells_D2_E1_2a;cells_D2_E1_2b];

cells_D2_E05_1a = csvread('C:\Temp\cells_D2_E05_1 (2).csv');
cells_D2_E05_1b = csvread('C:\Temp\cells_D2_E05_1 (3).csv');
cells_D2_E05_1c = csvread('C:\Temp\cells_D2_E05_1.csv');
cells_D2_E05_1d = csvread('C:\Temp\cells_D2_E05_1 (4).csv');
cells_D2_E05_2a = csvread('C:\Temp\cells_D2_E05_2 (2).csv');
cells_D2_E05_2b = csvread('C:\Temp\cells_D2_E05_2 (3).csv');
cells_D2_E05_2c = csvread('C:\Temp\cells_D2_E05_2.csv');
cells_D2_E05_2d = csvread('C:\Temp\cells_D2_E05_2 (4).csv');
D2_E05 = [cells_D2_E05_1a;cells_D2_E05_1b;cells_D2_E05_1c; ...
	cells_D2_E05_1d;cells_D2_E05_2a;cells_D2_E05_2b;cells_D2_E05_2c;cells_D2_E05_2d];

cells_D2_E025_1a = csvread('C:\Temp\cells_D2_E025_1 (2).csv');
cells_D2_E025_1b = csvread('C:\Temp\cells_D2_E025_1.csv');
cells_D2_E025_1c = csvread('C:\Temp\cells_D2_E025_1 (3).csv');
cells_D2_E025_2a = csvread('C:\Temp\cells_D2_E025_2 (2).csv');
cells_D2_E025_2b = csvread('C:\Temp\cells_D2_E025_2.csv');
cells_D2_E025_2c = csvread('C:\Temp\cells_D2_E025_2 (3).csv');
D2_E025 = [cells_D2_E025_1a;cells_D2_E025_1b;cells_D2_E025_1c; ...
	cells_D2_E025_2a;cells_D2_E025_2b;cells_D2_E025_2c];

cells_D2_K_1a = csvread('C:\Temp\cells_D2_K_1 (2).csv');
cells_D2_K_1b = csvread('C:\Temp\cells_D2_K_1 (3).csv');
cells_D2_K_1c = csvread('C:\Temp\cells_D2_K_1 (4).csv');
cells_D2_K_1d = csvread('C:\Temp\cells_D2_K_1.csv');
cells_D2_K_1e = csvread('C:\Temp\cells_D2_K_1 (5).csv');
cells_D2_K_2a = csvread('C:\Temp\cells_D2_K_2 (2).csv');
cells_D2_K_2b = csvread('C:\Temp\cells_D2_K_2 (3).csv');
cells_D2_K_2c = csvread('C:\Temp\cells_D2_K_2 (4).csv');
cells_D2_K_2d = csvread('C:\Temp\cells_D2_K_2.csv');
cells_D2_K_2e = csvread('C:\Temp\cells_D2_K_2 (5).csv');
D2_K = [cells_D2_K_1a;cells_D2_K_1b;cells_D2_K_1c;cells_D2_K_1d; ... 
    cells_D2_K_1e;cells_D2_K_2a;cells_D2_K_2b;cells_D2_K_2c;cells_D2_K_2d;cells_D2_K_2e];

% Day 3: *************************************************
cells_D3_E5_1a = csvread('C:\Temp\cells_D3_E5_1.csv');
cells_D3_E5_1b = csvread('C:\Temp\cells_D3_E5_2.csv');
D3_E5 = [cells_D3_E5_1a;cells_D3_E5_1b];

cells_D3_E1_1a = csvread('C:\Temp\cells_D3_E1_1 (2).csv');
cells_D3_E1_1b = csvread('C:\Temp\cells_D3_E1_1.csv');
cells_D3_E1_2a = csvread('C:\Temp\cells_D3_E1_2 (2).csv');
cells_D3_E1_2b = csvread('C:\Temp\cells_D3_E1_2.csv');
D3_E1 = [cells_D3_E1_1a;cells_D3_E1_1b;cells_D3_E1_2a;cells_D3_E1_2b];

cells_D3_E05_1a = csvread('C:\Temp\cells_D3_E05_1 (2).csv');
cells_D3_E05_1b = csvread('C:\Temp\cells_D3_E05_1 (3).csv');
cells_D3_E05_1c = csvread('C:\Temp\cells_D3_E05_1.csv');
cells_D3_E05_1d = csvread('C:\Temp\cells_D3_E05_1 (4).csv');
cells_D3_E05_2a = csvread('C:\Temp\cells_D3_E05_2 (2).csv');
cells_D3_E05_2b = csvread('C:\Temp\cells_D3_E05_2 (3).csv');
cells_D3_E05_2c = csvread('C:\Temp\cells_D3_E05_2.csv');
cells_D3_E05_2d = csvread('C:\Temp\cells_D3_E05_2 (4).csv');
D3_E05 = [cells_D3_E05_1a;cells_D3_E05_1b;cells_D3_E05_1c; ...
	cells_D3_E05_1d;cells_D3_E05_2a;cells_D3_E05_2b;cells_D3_E05_2c;cells_D3_E05_2d];

cells_D3_E025_1a = csvread('C:\Temp\cells_D3_E025_1 (2).csv');
cells_D3_E025_1b = csvread('C:\Temp\cells_D3_E025_1.csv');
cells_D3_E025_1c = csvread('C:\Temp\cells_D3_E025_1 (3).csv');
cells_D3_E025_2a = csvread('C:\Temp\cells_D3_E025_2 (2).csv');
cells_D3_E025_2b = csvread('C:\Temp\cells_D3_E025_2.csv');
cells_D3_E025_2c = csvread('C:\Temp\cells_D3_E025_2 (3).csv');
D3_E025 = [cells_D3_E025_1a;cells_D3_E025_1b;cells_D3_E025_1c; ...
	cells_D3_E025_2a;cells_D3_E025_2b;cells_D3_E025_2c];

cells_D3_K_1a = csvread('C:\Temp\cells_D3_K_1 (2).csv');
cells_D3_K_1b = csvread('C:\Temp\cells_D3_K_1 (3).csv');
cells_D3_K_1c = csvread('C:\Temp\cells_D3_K_1 (4).csv');
cells_D3_K_1d = csvread('C:\Temp\cells_D3_K_1.csv');
cells_D3_K_1e = csvread('C:\Temp\cells_D3_K_1 (5).csv');
cells_D3_K_2a = csvread('C:\Temp\cells_D3_K_2 (2).csv');
cells_D3_K_2b = csvread('C:\Temp\cells_D3_K_2 (3).csv');
cells_D3_K_2c = csvread('C:\Temp\cells_D3_K_2 (4).csv');
cells_D3_K_2d = csvread('C:\Temp\cells_D3_K_2.csv');
cells_D3_K_2e = csvread('C:\Temp\cells_D3_K_2 (5).csv');
D3_K = [cells_D3_K_1a;cells_D3_K_1b;cells_D3_K_1c;cells_D3_K_1d; ... 
    cells_D3_K_1e;cells_D3_K_2a;cells_D3_K_2b;cells_D3_K_2c;cells_D3_K_2d;cells_D3_K_2e];

% ********************************************************

% Set calculation set
 %allControl = D1_K; 
 %allTreated = D1_E05; 

% [allCells,allResults,table, chi2, p, label, sensitivity,specificity_1,pos_predict,neg_predict] = MainAnalysis(allControl,allTreated,indecesToKeep,cats);