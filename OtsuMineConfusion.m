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

% 4. Read in cell data

% Day 2: *************************************************
cells_D2_E5_1a = csvread('C:\Temp\cells_D2_E5_1.csv');
cells_D2_E5_1b = csvread('C:\Temp\cells_D2_E5_2.csv');
D2_E5 = [cells_D2_E5_1a;cells_D2_E5_1b];

cells_D2_E1_1a = csvread('C:\Temp\cells_D2_E1_1 (2).csv');
cells_D2_E1_1b = csvread('C:\Temp\cells_D2_E1_1.csv');
cells_D2_E1_2a = csvread('C:\Temp\cells_D2_E1_2 (2).csv');
cells_D2_E1_2b = csvread('C:\Temp\cells_D2_E1_2.csv');
D2_E1 = [cells_D2_E1_1a;cells_D2_E1_1b;cells_D2_E1_2a;cells_D2_E1_2b];
% D2_E1 = [cells_D2_E1_1b;cells_D2_E1_2b];

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
% D2_K = [cells_D2_K_1d; ... 
%     cells_D2_K_2d];

% Set calculation set
[allTmpCells_0, allTmpResults_0] = removeIrrelevant(D2_K,D2_K,indecesToKeep,'value',0);
[allTmpCells_1, allTmpResults_1] = removeIrrelevant(D2_E1,D2_E1,indecesToKeep,'value',1);
[allTmpCells_025, allTmpResults_025] = removeIrrelevant(D2_E025,D2_E025,indecesToKeep,'value',0.25);
[allTmpCells_05, allTmpResults_05] = removeIrrelevant(D2_E05,D2_E05,indecesToKeep,'value',0.5);
[allTmpCells_5, allTmpResults_5] = removeIrrelevant(D2_E5,D2_E5,indecesToKeep,'value',5);
% ********************************************************
 
% allTmpCells_10 = [allTmpCells_0;allTmpCells_1;allTmpCells_5];
% allTmpResults_10 = [allTmpResults_0;allTmpResults_1;allTmpResults_5];
allTmpCells_10 = [allTmpCells_0;allTmpCells_025;allTmpCells_05;allTmpCells_1;allTmpCells_5];
allTmpResults_10 = [allTmpResults_0;allTmpResults_025;allTmpResults_05;allTmpResults_1;allTmpResults_5];

clear nodes sensitivity specificity_1 cverr resuberr neg_predict pos_predict_025 pos_predict_05 pos_predict_1 pos_predict_5 confusion
 perc = 25;
 confusion = zeros(10,5,5);
 for i=1:10
 [training, trainingResult,testset,testsetResult] = TrainingSet(allTmpCells_10, allTmpResults_10,perc);
% % Create tree

% testset = allTmpCells_10; testsetResult = allTmpResults_10; %Select to use the tree on a different set of images

 [tree_,numnodes_,resuberror_,crossvalerror_,sensitivity_,specificity_1_,pos_predict_025_,pos_predict_05_,pos_predict_1_,pos_predict_5_,neg_predict_,confusion_] = DecisionTree(training,trainingResult,testset,testsetResult,cats);    
 nodes(i) = numnodes_;resuberr(i) = resuberror_;cverr(i) = crossvalerror_;
 sensitivity(i) = sensitivity_; specificity_1(i) = specificity_1_; 
 pos_predict_025(i) = pos_predict_025_; neg_predict(i) = neg_predict_;
 pos_predict_05(i) = pos_predict_05_; pos_predict_1(i) = pos_predict_1_;
 pos_predict_5(i) = pos_predict_5_; confusion(i,:) = confusion_(:);
 end;
 mean_conf = mean(confusion);
 std_conf = std(confusion);
  %Example mean_conf(1,:,1)' denotes first column (predicted values of zero for
  %each concentration (one for each row)
  tmp_mean = [mean_conf(1,:,1)' mean_conf(1,:,2)' mean_conf(1,:,3)' mean_conf(1,:,4)' mean_conf(1,:,5)']; %reshape
  tmp_std = [std_conf(1,:,1)' std_conf(1,:,2)' std_conf(1,:,3)' std_conf(1,:,4)' std_conf(1,:,5)']; %reshape
  csvwrite('C:\Temp\Day2_std_cells.csv', tmp_std);
  csvwrite('C:\Temp\Day2_mean_cells.csv', tmp_mean);
 

