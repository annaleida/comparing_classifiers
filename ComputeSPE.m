function [ SPE , SPE_con] = ComputeSPE( C , E)
% Computes 1-SPE for > class x from confusion matrix C
% Computes 95% confidence intervals for 1-SPE

% C
% E
SPE(1) = (sum(sum(C(1,:)))-sum(sum(C(1,1))))/sum(sum(C(1,:)));
SPE(2) = (sum(sum(C(1:2,:)))-sum(sum(C(1:2,1:2))))/sum(sum(C(1:2,:)));
SPE(3) = (sum(sum(C(1:3,:)))-sum(sum(C(1:3,1:3))))/sum(sum(C(1:3,:)));
SPE(4) = (sum(sum(C(1:4,:)))-sum(sum(C(1:4,1:4))))/sum(sum(C(1:4,:)));

A2 = zeros(4,2);
A2(1,1) = 1/(sum(sum(C(1,:)))-(C(1,1)))^2;
A2(2,1) = 1/(sum(sum(C(1:2,:)))-(sum(sum(C(1:2,1:2)))))^2;
A2(3,1) = 1/(sum(sum(C(1:3,:)))-(sum(sum(C(1:3,1:3)))))^2;
A2(4,1) = 1/(sum(sum(C(1:4,:)))-(sum(sum(C(1:4,1:4)))))^2;
A2(1,2) = 1/(sum(sum(C(1,:))))^2;
A2(2,2) = 1/(sum(sum(C(1:2,:))))^2;
A2(3,2) = 1/(sum(sum(C(1:3,:))))^2;
A2(4,2) = 1/(sum(sum(C(1:4,:))))^2;

E2 = E.*E;

SA2 = zeros(4,2);
SA2(1,1) = (sum(sum(E2(1,:)))-E2(1,1));
SA2(2,1) = (sum(sum(E2(1:2,:)))-sum(sum(E2(1:2,1:2))));
SA2(3,1) = (sum(sum(E2(1:3,:)))-sum(sum(E2(1:3,1:3))));
SA2(4,1) = (sum(sum(E2(1:4,:)))-sum(sum(E2(1:4,1:4))));
SA2(1,2) = (sum(sum(E2(1,:))));
SA2(2,2) = (sum(sum(E2(1:2,:))));
SA2(3,2) = (sum(sum(E2(1:3,:))));
SA2(4,2) = (sum(sum(E2(1:4,:))));

STD = zeros(4,1);
SPE_con = zeros(4,1);
for i = 1:4
    STD(i) = SPE(i)^2*(A2(i,1)*SA2(i,1)+A2(i,2)*SA2(i,2));
    SPE_con(i) = STD(i)*2.262/sqrt(10); % 2.262 t distribution for 95%, 9 DOG.
end;



end

