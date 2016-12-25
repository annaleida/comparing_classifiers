function [C_ret,E_ret,T,F] = EvalDecisionTree(featureV, featT, cats, perc,f_min,f_max,res,nbrIt)

%featT allows to send in a specific test set, given beforehand. If -1,
%testset is created randomly

C = zeros(nbrIt,max(max(featureV(:,res))),max(max(featureV(:,res))));
unique_results = unique(featureV(:,res));

disp 'DecTree'
for i=1:nbrIt
    
[training, trainingResult,testset,testsetResult] = TrainingSet(featureV(:,f_min:f_max), featureV(:,res),perc);
% % Create tree
if featT ~= -1
testset = featT(:,f_min:f_max);
testsetResult = featT(:,res);
end;

 [tree_,numnodes_,resuberror_,crossvalerror_,F_,T_,fit] = DecisionTree(training,trainingResult,testset,testsetResult,cats);    
 nodes(i) = numnodes_;resuberr(i) = resuberror_;cverr(i) = crossvalerror_;
 conf_ = ConstructConfusion(fit,testsetResult,max(max(unique_results)));
 C(i,:) = conf_(:);
 F(i) = F_; T(i) = T_; 
 end;
 
 [C_ret,E_ret] = CompileConfusion(C);

 
 
%  C=C./nbrIt;