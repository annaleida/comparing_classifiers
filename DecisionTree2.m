%function [tree,numnodes,resuberror,cverror,sensitivity,specificity_1,pos_predict,neg_predict] = DecisionTree(training,trainingResult,testset,testsetResult,cats)
function [tree,numnodes,resuberror,cverror,sensitivity,specificity_1,pos_predict_025,pos_predict_05,pos_predict_1,pos_predict_5,neg_predict,confusion] = DecisionTree2(training,trainingResult,testset,testsetResult,cats)
 
 tree = ClassificationTree.fit(training,trainingResult);
 resuberror = resubLoss(tree);
 cvrtree = crossval(tree);
cverror = kfoldLoss(cvrtree);

% Prune to best level
[~,~,~,bestlevel] = cvLoss(tree,'subtrees','all','treesize','min');
tree = prune(tree,'Level',bestlevel);
numnodes = tree.NumNodes;
 view(tree,'mode','graph')

%Apply tree
sfit = predict(tree,testset);

if (1 == 0)
TP = sum(strcmp(testsetResult,'t').*strcmp(testsetResult,sfit));
TN = sum(strcmp(testsetResult,'c').*strcmp(testsetResult,sfit));
FN = sum(strcmp(testsetResult,'t')) - TP;
FP = sum(strcmp(testsetResult,'c')) - TN;
sensitivity = TP/(TP+FN);
specificity_1 = 1 - TN/(TN+FP);
pos_predict = TP/(TP+FP);
neg_predict = TN/(TN+FN);
else
   TN = sum(strcmp(testsetResult,'1').*strcmp(testsetResult,sfit));
   FP = sum(strcmp(testsetResult,'1')) - TN;
   TP_025 = sum(strcmp(testsetResult,'2').*strcmp(testsetResult,sfit));
   TP_05 = sum(strcmp(testsetResult,'3').*strcmp(testsetResult,sfit));
   TP_1 = sum(strcmp(testsetResult,'4').*strcmp(testsetResult,sfit));
   TP_5 = sum(strcmp(testsetResult,'5').*strcmp(testsetResult,sfit));
   TP = TP_025 + TP_05 + TP_1 + TP_5;
   FN_025 = sum(strcmp(testsetResult,'2').*strcmp('1',sfit));
   FN_05 = sum(strcmp(testsetResult,'3').*strcmp('1',sfit));
   FN_1 = sum(strcmp(testsetResult,'4').*strcmp('1',sfit));
   FN_5 = sum(strcmp(testsetResult,'5').*strcmp('1',sfit));
   FN = FN_025 + FN_05 + FN_1 + FN_5;
   TP_ic = length(testsetResult) - TP - FP - TN - FN;
   sensitivity = TP/(TP+FN + TP_ic);
    specificity_1 = 1 - TN/(TN+FP);
    pos_predict_025 = TP_025/(TP+FP+TP_ic);
    pos_predict_05 = TP_05/(TP+FP+TP_ic);
    pos_predict_1 = TP_1/(TP+FP+TP_ic);
    pos_predict_5 = TP_5/(TP+FP+TP_ic);
    neg_predict = TN/(TN+FN);
    
    confusion = zeros(5,5);
    confusion(:,1) = [NaN FN_025 FN_05 FN_1 FN_5];
    confusion(:,2) = [sum(strcmp(testsetResult,'1').*strcmp('2',sfit)) NaN ...
        sum(strcmp(testsetResult,'3').*strcmp('2',sfit)) ...
        sum(strcmp(testsetResult,'4').*strcmp('2',sfit))...
        sum(strcmp(testsetResult,'5').*strcmp('2',sfit))];
    confusion(:,3) = [sum(strcmp(testsetResult,'1').*strcmp('3',sfit)) ...
        sum(strcmp(testsetResult,'2').*strcmp('3',sfit)) NaN...
        sum(strcmp(testsetResult,'4').*strcmp('3',sfit))...
        sum(strcmp(testsetResult,'5').*strcmp('3',sfit))];
    confusion(:,4) = [sum(strcmp(testsetResult,'1').*strcmp('4',sfit)) ...
        sum(strcmp(testsetResult,'2').*strcmp('4',sfit)) ...
        sum(strcmp(testsetResult,'3').*strcmp('4',sfit)) NaN...
        sum(strcmp(testsetResult,'5').*strcmp('4',sfit))];
    confusion(:,5) = [sum(strcmp(testsetResult,'1').*strcmp('5',sfit)) ...
        sum(strcmp(testsetResult,'2').*strcmp('5',sfit)) ...
        sum(strcmp(testsetResult,'3').*strcmp('5',sfit)) ...
        sum(strcmp(testsetResult,'4').*strcmp('5',sfit)) NaN];    
    %Diagonal
    confusion(1,1) = TN;
    confusion(2,2) = TP_025;
    confusion(3,3) = TP_05;
    confusion(4,4) = TP_1;
    confusion(5,5) = TP_5;
    
    if (sum(sum(confusion)) ~= length(sfit))
        disp 'Incorrect confusion';
    end;
    
end;

disp 'DecisionTree complete';