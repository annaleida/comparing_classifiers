function [ PPV , PPV_con] = ComputePPV( C , E)
% Computes PPV for > class x from confusion matrix C
% Computes 95% confidence intervals for PPV

% C
% E
PPV(1) = sum(sum(C(2:5,2:5)))/sum(sum(C(:,2:5)));
PPV(2) = sum(sum(C(3:5,3:5)))/sum(sum(C(:,3:5)));
PPV(3) = sum(sum(C(4:5,4:5)))/sum(sum(C(:,4:5)));
PPV(4) = C(5,5)/sum(sum(C(:,5)));

A2 = zeros(4,2);
A2(1,1) = 1/(sum(sum(C(2:5,2:5))))^2;
A2(2,1) = 1/(sum(sum(C(3:5,3:5))))^2;
A2(3,1) = 1/(sum(sum(C(4:5,4:5))))^2;
A2(4,1) = 1/(C(5,5))^2;
A2(1,2) = 1/(sum(sum(C(:,2:5))))^2;
A2(2,2) = 1/(sum(sum(C(:,3:5))))^2;
A2(3,2) = 1/(sum(sum(C(:,4:5))))^2;

A2(4,2) = 1/(sum(sum(C(:,5))))^2;

E2 = E.*E;

SA2 = zeros(4,2);
SA2(1,1) = (sum(sum(E2(2:5,2:5))));
SA2(2,1) = (sum(sum(E2(3:5,3:5))));
SA2(3,1) = (sum(sum(E2(4:5,4:5))));
SA2(4,1) = (E2(5,5));
SA2(1,2) = (sum(sum(E2(:,2:5))));
SA2(2,2) = (sum(sum(E2(:,3:5))));
SA2(3,2) = (sum(sum(E2(:,4:5))));
SA2(4,2) = (sum(sum(E2(:,5))));

STD = zeros(4,1);
PPV_con = zeros(4,1);
for i = 1:4
    STD(i) = PPV(i)^2*(A2(i,1)*SA2(i,1)+A2(i,2)*SA2(i,2));
    PPV_con(i) = STD(i)*2.262/sqrt(10); % 2.262 t distribution for 95%, 9 DOG.
end;



end

