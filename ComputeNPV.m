function [ NPV , NPV_con] = ComputeNPV( C , E)
% Computes NPV for > class x from confusion matrix C
% Computes 95% confidence intervals for NPV

% C
% E
NPV(1) = sum(sum(C(1,1)))/sum(sum(C(:,1)));
NPV(2) = sum(sum(C(1:2,1:2)))/sum(sum(C(:,1:2)));
NPV(3) = sum(sum(C(1:3,1:3)))/sum(sum(C(:,1:3)));
NPV(4) = sum(sum(C(1:4,1:4)))/sum(sum(C(:,1:4)));

A2 = zeros(4,2);
A2(1,1) = 1/(C(1,1))^2;
A2(2,1) = 1/(sum(sum(C(1:2,1:2))))^2;
A2(3,1) = 1/(sum(sum(C(1:3,1:3))))^2;
A2(4,1) = 1/(sum(sum(C(1:4,1:4))))^2;
A2(1,2) = 1/(sum(sum(C(:,1))))^2;
A2(2,2) = 1/(sum(sum(C(:,1:2))))^2;
A2(3,2) = 1/(sum(sum(C(:,1:3))))^2;
A2(4,2) = 1/(sum(sum(C(:,1:4))))^2;

E2 = E.*E;

SA2 = zeros(4,2);
SA2(1,1) = (E2(1,1));
SA2(2,1) = (sum(sum(E2(1:2,1:2))));
SA2(3,1) = (sum(sum(E2(1:3,1:3))));
SA2(4,1) = (sum(sum(E2(1:4,1:4))));
SA2(1,2) = (sum(sum(E2(:,1))));
SA2(2,2) = (sum(sum(E2(:,1:2))));
SA2(3,2) = (sum(sum(E2(:,1:3))));
SA2(4,2) = (sum(sum(E2(:,1:4))));

STD = zeros(4,1);
NPV_con = zeros(4,1);
for i = 1:4
    STD(i) = NPV(i)^2*(A2(i,1)*SA2(i,1)+A2(i,2)*SA2(i,2));
    NPV_con(i) = STD(i)*2.262/sqrt(10); % 2.262 t distribution for 95%, 9 DOG.
end;



end

