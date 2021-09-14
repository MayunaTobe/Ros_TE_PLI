% Rossler
% 相関, PLI, TE
% 初期値を動かす
% PLI、TEの時系列を分割
addpath("../../2019/HERMES_lib/tim-matlab-1.2.0/");

%A = (0:0.0001:0.1;3)';
 A = (0:0.02:0.1)';
% A=0.002;
%[s,~] = size(A);
s = size(A,1);
rst = zeros(s,392+1);
tmp_rst = zeros(10,98*4);
    

for i=1:1:s
    i
    
    %y0 初期値 10個
    y0 =[[1; 1; 1; -1; -1.2; -1.3] [-1; 1; 1; -1; -1.2; -1.3] [-1; 1; 1; 1; -1.2; -1.3] [1; 1; 1; 1; -1.2; -1.3] [1; -1; 1; -1; -1.2; -1.3] [-1; 1; 1; -1; 1.2; -1.3] [-1; -1; 1; 1; 1.2; -1.3] [1; -1.2; 1; 1; -1; -1.3] [-1; -1.2; 1; -1; -1; -1.3] [1; -1.2; 1; 1; 1; -1.3]];
    y0_size = size(y0,2); 
    for j=1:1:y0_size
        ts = Rossler3(A(i),y0(:,j));
        
        [filtered1, filtered2] = bp(ts); %バンドパス
        
        % analysisPLI;
        pli_a = pli_cal_split(filtered1,filtered2);
        % analysisTE;
        te_val12= te_cal_split(filtered1,filtered2);
        te_val21= te_cal_split(filtered2,filtered1);
        
        for l=1:1:floor(size(filtered1,1)/500)
            rho(l) = corr(filtered1(1+500*(l-1):(l)*500),filtered2(1+500*(l-1):(l)*500));
        end
        
        %平均を取る 10x5行列の平均
        tmp_rst(j,98*0+1:98*0+1+97) = rho;
        tmp_rst(j,98*1+1:98*1+1+97) = pli_a;
        tmp_rst(j,98*2+1:98*2+1+97) = te_val12;
        tmp_rst(j,98*3+1:98*3+1+97) = te_val21;
        
        
    end    
    rst(i,2:392+1) = mean(tmp_rst);
    
    clearvars ts filtered1 filtered2 tmp_rst
end

rst(:,1) = A;