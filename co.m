% Rossler
% 相関, PLI, TE


A = (0:0.01:0.13)'; 
%A = 1
[s,~] = size(A);
rst = zeros(s,5);

rst(:,1) = A;

for i=1:1:s
    i
ts = Rossler2(A(i));

[filtered1, filtered2] = bp(ts); %バンドパス

%analysisPLI;
%analysisTE;
rho = corr(filtered1,filtered2);

rst(i,2) = rho;
% rst(i,3) = pli_a;
% rst(i,4) = te_val12;
% rst(i,5) = te_val21;
   

clearvars ts filtered1 filtered2
end
