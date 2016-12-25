function [ tmp_mean, tmp_std ] = EvaluateConfusion( C , E, methods, titl)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
disp 'EvaluateConfusion'
conc = [0.25, 0.5, 1, 5];
x = linspace(1,4,4); %Plot bars evenly spaced
for m = 1:1
%     method = methods(m)
    C_Platt = C{1}; 
    C_Bayes = C{2};
    C_Random = C{3};
    E_Platt = E{1}; 
    E_Bayes = E{2};
    E_Random = E{3};
    
    % Otsu
    [PPV_Platt,PPV_con_Platt] = ComputePPV(C_Platt(:,:,1),E_Platt(:,:,1));
    [PPV_Bayes, PPV_con_Bayes] = ComputePPV(C_Bayes(:,:,1),E_Bayes(:,:,1));
    [PPV_Random,PPV_con_Random] = ComputePPV(C_Random(:,:,1),E_Random(:,:,1));
    PPV_Otsu = [PPV_Platt; PPV_Bayes; PPV_Random];
    PPV_con_Otsu = [PPV_con_Platt'; PPV_con_Bayes'; PPV_con_Random'];
    
    [NPV_Platt,NPV_con_Platt] = ComputeNPV(C_Platt(:,:,1),E_Platt(:,:,1));
    [NPV_Bayes, NPV_con_Bayes] = ComputeNPV(C_Bayes(:,:,1),E_Bayes(:,:,1));
    [NPV_Random,NPV_con_Random] = ComputeNPV(C_Random(:,:,1),E_Random(:,:,1));
    NPV_Otsu = [NPV_Platt; NPV_Bayes; NPV_Random];
    NPV_con_Otsu = [NPV_con_Platt'; NPV_con_Bayes'; NPV_con_Random'];
    
    [SEN_Platt,SEN_con_Platt] = ComputeSEN(C_Platt(:,:,1),E_Platt(:,:,1));
    [SEN_Bayes, SEN_con_Bayes] = ComputeSEN(C_Bayes(:,:,1),E_Bayes(:,:,1));
    [SEN_Random,SEN_con_Random] = ComputeSEN(C_Random(:,:,1),E_Random(:,:,1));
    SEN_Otsu = [SEN_Platt; SEN_Bayes; SEN_Random];
    SEN_con_Otsu = [SEN_con_Platt'; SEN_con_Bayes'; SEN_con_Random'];
    [SPE_Platt,SPE_con_Platt] = ComputeSPE(C_Platt(:,:,1),E_Platt(:,:,1));
    [SPE_Bayes, SPE_con_Bayes] = ComputeSPE(C_Bayes(:,:,1),E_Bayes(:,:,1));
    [SPE_Random,SPE_con_Random] = ComputeSPE(C_Random(:,:,1),E_Random(:,:,1));
    SPE_Otsu = [SPE_Platt; SPE_Bayes; SPE_Random];
    SPE_con_Otsu = [SPE_con_Platt'; SPE_con_Bayes'; SPE_con_Random'];
    
    % Mine
    [PPV_Platt,PPV_con_Platt] = ComputePPV(C_Platt(:,:,2),E_Platt(:,:,2));
    [PPV_Bayes, PPV_con_Bayes] = ComputePPV(C_Bayes(:,:,2),E_Bayes(:,:,2));
    [PPV_Random,PPV_con_Random] = ComputePPV(C_Random(:,:,2),E_Random(:,:,2));
    PPV_Mine = [PPV_Platt; PPV_Bayes; PPV_Random];
    PPV_con_Mine = [PPV_con_Platt'; PPV_con_Bayes'; PPV_con_Random'];
    
    [NPV_Platt,NPV_con_Platt] = ComputeNPV(C_Platt(:,:,2),E_Platt(:,:,2));
    [NPV_Bayes, NPV_con_Bayes] = ComputeNPV(C_Bayes(:,:,2),E_Bayes(:,:,2));
    [NPV_Random,NPV_con_Random] = ComputeNPV(C_Random(:,:,2),E_Random(:,:,2));
    NPV_Mine = [NPV_Platt; NPV_Bayes; NPV_Random];
    NPV_con_Mine = [NPV_con_Platt'; NPV_con_Bayes'; NPV_con_Random'];
    
        [SEN_Platt,SEN_con_Platt] = ComputeSEN(C_Platt(:,:,2),E_Platt(:,:,2));
    [SEN_Bayes, SEN_con_Bayes] = ComputeSEN(C_Bayes(:,:,2),E_Bayes(:,:,2));
    [SEN_Random,SEN_con_Random] = ComputeSEN(C_Random(:,:,2),E_Random(:,:,2));
    SEN_Mine = [SEN_Platt; SEN_Bayes; SEN_Random];
    SEN_con_Mine = [SEN_con_Platt'; SEN_con_Bayes'; SEN_con_Random'];
    
        [SPE_Platt,SPE_con_Platt] = ComputeSPE(C_Platt(:,:,2),E_Platt(:,:,2));
    [SPE_Bayes, SPE_con_Bayes] = ComputeSPE(C_Bayes(:,:,2),E_Bayes(:,:,2));
    [SPE_Random,SPE_con_Random] = ComputeSPE(C_Random(:,:,2),E_Random(:,:,2));
    SPE_Mine = [SPE_Platt; SPE_Bayes; SPE_Random];
    SPE_con_Mine = [SPE_con_Platt'; SPE_con_Bayes'; SPE_con_Random'];
    
    % Filtered
    [PPV_Platt,PPV_con_Platt] = ComputePPV(C_Platt(:,:,3),E_Platt(:,:,3));
    [PPV_Bayes, PPV_con_Bayes] = ComputePPV(C_Bayes(:,:,3),E_Bayes(:,:,3));
    [PPV_Random,PPV_con_Random] = ComputePPV(C_Random(:,:,3),E_Random(:,:,3));
    PPV_Filtered = [PPV_Platt; PPV_Bayes; PPV_Random];
    PPV_con_Filtered = [PPV_con_Platt'; PPV_con_Bayes'; PPV_con_Random'];
    
    [NPV_Platt,NPV_con_Platt] = ComputeNPV(C_Platt(:,:,3),E_Platt(:,:,3));
    [NPV_Bayes, NPV_con_Bayes] = ComputeNPV(C_Bayes(:,:,3),E_Bayes(:,:,3));
    [NPV_Random,NPV_con_Random] = ComputeNPV(C_Random(:,:,3),E_Random(:,:,3));
    NPV_Filtered = [NPV_Platt; NPV_Bayes; NPV_Random];
    NPV_con_Filtered = [NPV_con_Platt'; NPV_con_Bayes'; NPV_con_Random'];
    
        [SEN_Platt,SEN_con_Platt] = ComputeSEN(C_Platt(:,:,3),E_Platt(:,:,3));
    [SEN_Bayes, SEN_con_Bayes] = ComputeSEN(C_Bayes(:,:,3),E_Bayes(:,:,3));
    [SEN_Random,SEN_con_Random] = ComputeSEN(C_Random(:,:,3),E_Random(:,:,3));
    SEN_Filtered = [SEN_Platt; SEN_Bayes; SEN_Random];
    SEN_con_Filtered = [SEN_con_Platt'; SEN_con_Bayes'; SEN_con_Random'];
    
        [SPE_Platt,SPE_con_Platt] = ComputeSPE(C_Platt(:,:,3),E_Platt(:,:,3));
    [SPE_Bayes, SPE_con_Bayes] = ComputeSPE(C_Bayes(:,:,3),E_Bayes(:,:,3));
    [SPE_Random,SPE_con_Random] = ComputeSPE(C_Random(:,:,3),E_Random(:,:,3));
    SPE_Filtered = [SPE_Platt; SPE_Bayes; SPE_Random];
    SPE_con_Filtered = [SPE_con_Platt'; SPE_con_Bayes'; SPE_con_Random'];
    
h = figure();
    
subplot(1,3,1); hold on;
    barwitherr( cat(3,zeros(4,3),PPV_con_Otsu').*1,PPV_Otsu');
    set(gca,'XTickLabel',conc);
    colormap gray;
    grid on;
    axis([0 5 0 1]);
%     axis equal;
    subplot(1,3,2); hold on;
    barwitherr( cat(3,zeros(4,3),PPV_con_Mine').*1,PPV_Mine');
    set(gca,'XTickLabel',conc);
    colormap gray;
    grid on;
    title(titl);
    axis([0 5 0 1]);
%     axis equal;
    subplot(1,3,3); hold on;
    barwitherr( cat(3,zeros(4,3),PPV_con_Filtered').*1,PPV_Filtered');
    set(gca,'XTickLabel',conc);
    colormap gray;
    grid on;
    axis([0 5 0 1]);
    
    h2 = figure();
    
subplot(1,3,1); hold on;
    barwitherr( cat(3,zeros(4,3),NPV_con_Otsu').*1,NPV_Otsu');
    set(gca,'XTickLabel',conc);
    colormap gray;
    grid on;
    axis([0 5 0 1]);
%     axis equal;
    subplot(1,3,2); hold on;
    barwitherr( cat(3,zeros(4,3),NPV_con_Mine').*1,NPV_Mine');
    set(gca,'XTickLabel',conc);
    colormap gray;
    grid on;
    title(titl);
    axis([0 5 0 1]);
%     axis equal;
    subplot(1,3,3); hold on;
    barwitherr( cat(3,zeros(4,3),NPV_con_Filtered').*1,NPV_Filtered');
    set(gca,'XTickLabel',conc);
    colormap gray;
    grid on;
    axis([0 5 0 1]);
    
    h3 = figure();
        title(titl);
    subplot(3,1,1); hold on;
    errorbar(SPE_Otsu(1,:),SEN_Otsu(1,:),SEN_con_Otsu(1,:),'k-s','MarkerSize',6,'MarkerFaceColor','k','LineWidth',1); hold on;
    errorbar(SPE_Mine(1,:),SEN_Mine(1,:),SEN_con_Mine(1,:),'k--^','MarkerSize',6,'MarkerFaceColor','k','LineWidth',1); hold on;
    errorbar(SPE_Filtered(1,:),SEN_Filtered(1,:),SEN_con_Filtered(1,:),'k:o','MarkerSize',6,'MarkerFaceColor','k','LineWidth',1); hold on;
    axis([0 1 0 1]);
    grid on;
   subplot(3,1,2); hold on;
    errorbar(SPE_Otsu(2,:),SEN_Otsu(2,:),SEN_con_Otsu(2,:),'k-s','MarkerSize',6,'MarkerFaceColor','k','LineWidth',1); hold on;
    errorbar(SPE_Mine(2,:),SEN_Mine(2,:),SEN_con_Mine(2,:),'k--^','MarkerSize',6,'MarkerFaceColor','k','LineWidth',1); hold on;
    errorbar(SPE_Filtered(2,:),SEN_Filtered(2,:),SEN_con_Filtered(2,:),'k:o','MarkerSize',6,'MarkerFaceColor','k','LineWidth',1); hold on;
    grid on;
    axis([0 1 0 1]);
    subplot(3,1,3); hold on;
    errorbar(SPE_Otsu(3,:),SEN_Otsu(3,:),SEN_con_Otsu(3,:),'k-s','MarkerSize',6,'MarkerFaceColor','k','LineWidth',1); hold on;
    errorbar(SPE_Mine(3,:),SEN_Mine(3,:),SEN_con_Mine(3,:),'k--^','MarkerSize',6,'MarkerFaceColor','k','LineWidth',1); hold on;
    errorbar(SPE_Filtered(3,:),SEN_Filtered(3,:),SEN_con_Filtered(3,:),'k:o','MarkerSize',6,'MarkerFaceColor','k','LineWidth',1); hold on;
    grid on;
    axis([0 1 0 1]);
%     
%     h = figure();
%     
% subplot(1,3,1);
%     bar(x, PPV_con_Otsu')
%     colormap hot;
%     grid on;
% %     axis equal;
%     subplot(1,3,2);
%     bar(x, PPV_con_Mine')
%     colormap hot;
%     grid on;
%     title(titl);
% %     axis equal;
%     subplot(1,3,3);
%     bar(x, PPV_con_Filtered')
%     colormap hot;
%     grid on;
% %     axis equal;

% figure(h)
% legend('Platt', 'Bayes', 'Random');

%     mean_conf = mean(C);
%  std_conf = std(C);
  %Example mean_conf(1,:,1)' denotes first column (predicted values of zero for
  %each concentration (one for each row)
%   tmp_mean = [mean_conf(1,:,1)' mean_conf(1,:,2)' mean_conf(1,:,3)' mean_conf(1,:,4)' mean_conf(1,:,5)'] %reshape
%   tmp_std = [std_conf(1,:,1)' std_conf(1,:,2)' std_conf(1,:,3)' std_conf(1,:,4)' std_conf(1,:,5)'] %reshape
 
end

end

