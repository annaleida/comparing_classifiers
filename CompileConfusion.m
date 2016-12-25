function [ C, E ] = CompileConfusion( C )
%   Compute mean and standrad deviation of a 5,5 confusion matrix,
%   computed in several layers 
% size(C) = i 5 5


 %Take mean of all iterations
 C_ret = mean(C,1);
 E_ret = std(C,1);
 %Recompute to percentage
 mC = sum(C_ret,2);
%  mE = sum(E_ret,2);
 C_ret2 = zeros(5,5);
 E_ret2 = zeros(5,5);
 for i = 1:5
 C_ret2(i,:) = C_ret(1,:,i)/mC(i)*100;
 E_ret2(i,:) = E_ret(1,:,i)/mC(i)*100;
 end; 
 C = C_ret2
 E = E_ret2

end

