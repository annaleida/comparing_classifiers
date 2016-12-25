clear all;

% cats = {'Mean','Variance','Max','Min','RMS','Kurtosis','Skewness','Energy','Entropy','Contrast','Correlation','Homogeneity'};
cats = { 'Area (pxl)',   'Perimeter length (pxl)',    'Phaseshift sum','Roughness kurtosis'  ,  'Roughness skewness',...
    'Texture contrast' ,   'Texture correlation','Texture energy'    'Texture entropy', 'Texture homogeneity'};

indecesToKeep = [7,24,30,32,34,38,39,42,43,44]; %Stat.sig 1µM

methods = {'Otsu', 'Min.Err.', 'Filtered'};
days = ['Day 1'; 'Day 2'; 'Day 3'];
daysShort = ['D1';'D2';'D3'];
sourcePath = ['C:\Temp\1\';'C:\Temp\2\';'C:\Temp\3\'];
% Otsu, Mine, Filtered
disp 'Start'
perc =15
f_min = 1
f_max = 10
res = 11;
nbrIt = 10
sm = size(methods);

% Mean of confusion matrix, one for each classification
C_1 = zeros(5,5,length(methods));
C_2 = zeros(5,5,length(methods));
C_3 = zeros(5,5,length(methods));
C_4 = zeros(5,5,length(methods));

% Error (confidence interval) of confusion matrix, one for each classification
E_1 = zeros(5,5,length(methods));
E_2 = zeros(5,5,length(methods));
E_3 = zeros(5,5,length(methods));
E_4 = zeros(5,5,length(methods));


for d = 1:3 %Day
    day = days(d,:)
for m = 1:length(methods) %Classification method
    method = methods(m)
    path = strcat(strcat(sourcePath(m,:),'cells_'),daysShort(d,:));
% Day 2: *************************************************
cells_D3_E5_1a = csvread(strcat(path,'_E5_1.csv'));
cells_D3_E5_1b = csvread(strcat(path,'_E5_2.csv'));
D3_E5 = [cells_D3_E5_1a;cells_D3_E5_1b];

% cells_D3_E1_1a = csvread(strcat(path,'_E1_1 (2).csv'));
cells_D3_E1_1b = csvread(strcat(path,'_E1_1.csv'));
% cells_D3_E1_2a = csvread(strcat(path,'_E1_2 (2).csv'));
cells_D3_E1_2b = csvread(strcat(path,'_E1_2.csv'));
% D3_E1 = [cells_D3_E1_1a;cells_D3_E1_1b;cells_D3_E1_2a;cells_D3_E1_2b];
D3_E1 = [cells_D3_E1_1b;cells_D3_E1_2b];

cells_D3_E05_1a = csvread(strcat(path,'_E05_1 (2).csv'));
cells_D3_E05_1b = csvread(strcat(path,'_E05_1 (3).csv'));
cells_D3_E05_1c = csvread(strcat(path,'_E05_1.csv'));
% cells_D3_E05_1d = csvread(strcat(path,'_E05_1 (4).csv'));
% cells_D3_E05_2a = csvread(strcat(path,'_E05_2 (2).csv'));
% cells_D3_E05_2b = csvread(strcat(path,'_E05_2 (3).csv'));
% cells_D3_E05_2c = csvread(strcat(path,'_E05_2.csv'));
% cells_D3_E05_2d = csvread(strcat(path,'_E05_2 (4).csv'));
D3_E05 = [cells_D3_E05_1a;cells_D3_E05_1b;cells_D3_E05_1c];%; ...
% 	cells_D3_E05_1d;cells_D3_E05_2a;cells_D3_E05_2b;cells_D3_E05_2c;cells_D3_E05_2d];

cells_D3_E025_1a = csvread(strcat(path,'_E025_1 (2).csv'));
cells_D3_E025_1b = csvread(strcat(path,'_E025_1.csv'));
% cells_D3_E025_1c = csvread(strcat(path,'_E025_1 (3).csv'));
% cells_D3_E025_2a = csvread(strcat(path,'_E025_2 (2).csv'));
% cells_D3_E025_2b = csvread(strcat(path,'_E025_2.csv'));
% cells_D3_E025_2c = csvread(strcat(path,'_E025_2 (3).csv'));
D3_E025 = [cells_D3_E025_1a;cells_D3_E025_1b];%;cells_D3_E025_1c]; ...
% 	cells_D3_E025_2a;cells_D3_E025_2b;cells_D3_E025_2c];

cells_D3_K_1a = csvread(strcat(path,'_K_1 (2).csv'));
cells_D3_K_1b = csvread(strcat(path,'_K_1 (3).csv'));
% cells_D3_K_1c = csvread(strcat(path,'_K_1 (4).csv'));
% cells_D3_K_1d = csvread(strcat(path,'_K_1.csv'));
% cells_D3_K_1e = csvread(strcat(path,'_K_1 (5).csv'));
% cells_D3_K_2a = csvread(strcat(path,'_K_2 (2).csv'));
% cells_D3_K_2b = csvread(strcat(path,'_K_2 (3).csv'));
% cells_D3_K_2c = csvread(strcat(path,'_K_2 (4).csv'));
% cells_D3_K_2d = csvread(strcat(path,'_K_2.csv'));
% cells_D3_K_2e = csvread(strcat(path,'_K_2 (5).csv'));
D3_K = [cells_D3_K_1a;cells_D3_K_1b];%;cells_D3_K_1c;cells_D3_K_1d]; ... 
%     cells_D3_K_1e;cells_D3_K_2a;cells_D3_K_2b;cells_D3_K_2c;cells_D3_K_2d;cells_D3_K_2e];
% D3_K = [cells_D3_K_1d; ... 
%     cells_D3_K_2d];

% Set calculation set
[allTmpCells_0, allTmpResults_0] = removeIrrelevant(D3_K,D3_K,indecesToKeep,'numericvalue',1);
[allTmpCells_1, allTmpResults_1] = removeIrrelevant(D3_E1,D3_E1,indecesToKeep,'numericvalue',4);
[allTmpCells_025, allTmpResults_025] = removeIrrelevant(D3_E025,D3_E025,indecesToKeep,'numericvalue',2);
[allTmpCells_05, allTmpResults_05] = removeIrrelevant(D3_E05,D3_E05,indecesToKeep,'numericvalue',3);
[allTmpCells_5, allTmpResults_5] = removeIrrelevant(D3_E5,D3_E5,indecesToKeep,'numericvalue',5);
% ********************************************************

features_1_c = [allTmpCells_0, allTmpResults_0]; s_1_c = size(features_1_c); 
features_2_c = [allTmpCells_1, allTmpResults_1]; s_2_c = size(features_2_c); 
features_3_c = [allTmpCells_025, allTmpResults_025]; s_3_c = size(features_3_c); 
features_4_c = [allTmpCells_05, allTmpResults_05]; s_4_c = size(features_4_c); 
features_5_c = [allTmpCells_5, allTmpResults_5]; s_5_c = size(features_5_c); 
% features_0_c = csvread('C:\Temp\0_c.csv'); s_0_c = size(features_0_c); 
% features_6_4 = csvread('C:\Temp\6_4.csv'); s_6_4 = size(features_6_4);  
% features_6_5 = csvread('C:\Temp\6_5.csv'); s_6_5 = size(features_6_5); 
% features_6_6 = csvread('C:\Temp\6_6.csv'); s_6_6 = size(features_6_6); 
% features_9_1 = csvread('C:\Temp\9_1.csv'); s_9_1 = size(features_9_1); 
% features_9_2 = csvread('C:\Temp\9_2.csv'); s_9_2 = size(features_9_2); 
% features_9_3 = csvread('C:\Temp\9_3.csv'); s_9_3 = size(features_9_3); 
% features_12_1 = csvread('C:\Temp\12_1.csv'); s_12_1 = size(features_12_1); 
% features_12_2 = csvread('C:\Temp\12_2.csv'); s_12_2 = size(features_12_2); 
% features_12_2x = csvread('C:\Temp\12_2x.csv'); s_12_2x = size(features_12_2x); 
% features_12_4 = csvread('C:\Temp\12_4.csv'); s_12_4 = size(features_12_4); 
% features_12_3 = csvread('C:\Temp\12_3.csv'); s_12_3 = size(features_12_3); 

% numel_1 = s_6_5(1) + s_6_6(1) + s_9_2(1) + s_9_3(1) + s_12_2(1) + s_12_3(1) + s_12_4(1) + s_6_4(1) + s_9_1(1)+ s_12_1(1);
% numel_2 = s_6_4(1) + s_9_1(1)+ s_12_1(1);
% numel_ = s_1_c(1) + s_2_c(1) + s_4_c(1) + s_6_c(1);
numel_1 = s_1_c(1) + s_2_c(1) + s_3_c(1) + s_4_c(1) + s_5_c(1)
% numel_1 = numel_1 + numel_2;;
features = zeros(numel_1,s_1_c(2));
% features2 = zeros(numel_2,s_6_4(2));
v_length = 0;
features(v_length+1:v_length+s_1_c(1),1:s_1_c(2)) = features_1_c; v_length = v_length + s_1_c(1);
features(v_length+1:v_length+s_2_c(1),1:s_2_c(2)) = features_2_c; v_length = v_length + s_2_c(1);
features(v_length+1:v_length+s_3_c(1),1:s_3_c(2)) = features_3_c; v_length = v_length + s_3_c(1);
features(v_length+1:v_length+s_4_c(1),1:s_4_c(2)) = features_4_c; v_length = v_length + s_4_c(1);
features(v_length+1:v_length+s_5_c(1),1:s_5_c(2)) = features_5_c; v_length = v_length + s_5_c(1);
% features(v_length+1:v_length+s_6_c(1),1:s_6_c(2)) = features_6_c; v_length = v_length + s_6_c(1);
% features(v_length+1:v_length+s_7_c(1),1:s_7_c(2)) = features_7_c; v_length = v_length + s_7_c(1);
% features(v_length+1:v_length+s_8_c(1),1:s_8_c(2)) = features_8_c; v_length = v_length + s_8_c(1);
% features(v_length+1:v_length+s_0_c(1),1:s_0_c(2)) = features_0_c; v_length = v_length + s_0_c(1);
% features(v_length+1:v_length+s_6_5(1),1:s_6_5(2)) = features_6_5; v_length = v_length + s_6_5(1);
% features(v_length+1:v_length+s_6_6(1),1:s_6_6(2)) = features_6_6; v_length = v_length + s_6_6(1);
% features(v_length+1:v_length+s_9_2(1),1:s_9_2(2)) = features_9_2; v_length = v_length + s_9_2(1);
% features(v_length+1:v_length+s_9_3(1),1:s_9_3(2)) = features_9_3; v_length = v_length + s_9_3(1);
% features(v_length+1:v_length+s_12_2(1),1:s_12_2(2)) = features_12_2; v_length = v_length + s_12_2(1);
% features(v_length+1:v_length+s_12_3(1),1:s_12_3(2)) = features_12_3; v_length = v_length + s_12_3(1);
% features(v_length+1:v_length+s_12_4(1),1:s_12_4(2)) = features_12_4; v_length = v_length + s_12_4(1);
% v_length = 0;
% features(v_length+1:v_length+s_6_4(1),1:s_6_4(2)) = features_6_4; v_length = v_length + s_6_4(1);
% features(v_length+1:v_length+s_9_1(1),1:s_9_1(2)) = features_9_1; v_length = v_length + s_9_1(1);
% features(v_length+1:v_length+s_12_1(1),1:s_12_1(2)) = features_12_1; v_length = v_length + s_12_1(1);

if 2==2
    tic
    try
[C_1(:,:,m),E_1(:,:,m),T,F] = EvalPlattDAGSVM(features,-1, cats,perc,f_min,f_max,res,nbrIt);
%   [T' F']
% EvaluateConfusion(C_1(i));
% sum(sum(C));
    catch
    end
 toc
end;
if 2==20
tic
 try
[C_2(:,:,m),E_2(:,:,m),T,F] = EvalVarDAGSVM(features,-1, cats, perc,f_min,f_max,res,nbrIt);
%   [T' F']
% EvaluateConfusion(C_2(i));
%  sum(sum(C))
      catch
     end
 toc
end;
if 4 == 4
    tic
    try
[C_3(:,:,m),E_3(:,:,m),T,F] = EvalNaiveBayes(features,cats, perc,f_min,f_max,res,nbrIt);
%   [T' F']
% EvaluateConfusion(C_3);
%  sum(sum(C))
     catch
    end
 toc
end;
% Decsion t0ree
if 10==10
    tic
%     try
 [C_4(:,:,m),E_4(:,:,m),T,F] = EvalDecisionTree(features, -1,cats, perc,f_min,f_max,res,nbrIt);
%   [T' F']
% EvaluateConfusion(C_4(i));
%      sum(sum(C))
%          catch
%     end
     toc

end;
end;
clear C E;
C = {C_1; C_3; C_4};
E = {E_1; E_3; E_4};

EvaluateConfusion(C, E, methods, day);

end;
%  
