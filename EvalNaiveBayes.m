function [C_ret,E_ret,T,F] = EvalNaiveBayesTree(featureV, cats, perc,f_min,f_max,res,nbrIt)

% Naive Bayes
    disp 'Bayes'
C = zeros(nbrIt,max(max(featureV(:,res))),max(max(featureV(:,res))));
    unique_results = unique(featureV(:,res));
    for i = 1:nbrIt
    [training, trainingResult,testset,testsetResult] = TrainingSet(featureV(:,f_min:f_max), featureV(:,res),perc);
 nb = NaiveBayes.fit(training, trainingResult);
 test_pred = predict(nb,testset);
  [conf_] = ConstructConfusion(test_pred,testsetResult,max(max(unique_results)));
 C(i,:) = conf_(:);
     T(i) = sum(diag(conf_))/sum(sum(conf_));  F(i) = 1-T(i);
    end;
     [C_ret,E_ret] = CompileConfusion(C);

%     C= C./nbrIt;