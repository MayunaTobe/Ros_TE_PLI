% Rossler
% 相関, PLI, TE
% 初期値を動かす

A = (0:0.0001:0.13)';
[s,~] = size(A);
rst = zeros(s,5);
tmp_rst = zeros(10,5);


for i=1:1:s
    i
    
    %y0 初期値 10個
    y0 =[[1; 1; 1; -1; -1.2; -1.3] [-1; 1; 1; -1; -1.2; -1.3] [-1; 1; 1; 1; -1.2; -1.3] [1; 1; 1; 1; -1.2; -1.3] [1; -1; 1; -1; -1.2; -1.3] [-1; 1; 1; -1; 1.2; -1.3] [-1; -1; 1; 1; 1.2; -1.3] [1; -1.2; 1; 1; -1; -1.3] [-1; -1.2; 1; -1; -1; -1.3] [1; -1.2; 1; 1; 1; -1.3]];
    y0_size = size(y0,2);
    for j=1:1:y0_size
        ts = Rossler3(A(i),y0(:,j));
        
        [filtered1, filtered2] = bp(ts); %バンドパス
        
        analysisPLI;
        analysisTE;
        rho = corr(filtered1,filtered2);
        
        %平均を取る 10x5行列の平均
        tmp_rst(j,2) = rho;
        tmp_rst(j,3) = pli_a;
        tmp_rst(j,4) = te_val12;
        tmp_rst(j,5) = te_val21;
        
        
    end    
    rst(i,:) = mean(tmp_rst);
    
    clearvars ts filtered1 filtered2 tmp_rst
end

rst(:,1) = A;