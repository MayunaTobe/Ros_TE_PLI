%2021-02-15
%レスラー結合モデルでtau-TEの関係を調べる

addpath("../../2019/HERMES_lib/tim-matlab-1.2.0/");

tau=[1:20]; %tauの値を指定
A=0.002; %パラメータAの値
s = size(tau,2); %tauのサイズ

rst = zeros(s,5);
tmp_rst = zeros(10,5);


for i=1:1:s %tauの値を指定するためのループ
    i
    
    %y0 初期値 10個
    y0 =[[1; 1; 1; -1; -1.2; -1.3] [-1; 1; 1; -1; -1.2; -1.3] [-1; 1; 1; 1; -1.2; -1.3] [1; 1; 1; 1; -1.2; -1.3] [1; -1; 1; -1; -1.2; -1.3] [-1; 1; 1; -1; 1.2; -1.3] [-1; -1; 1; 1; 1.2; -1.3] [1; -1.2; 1; 1; -1; -1.3] [-1; -1.2; 1; -1; -1; -1.3] [1; -1.2; 1; 1; 1; -1.3]];
    y0_size = size(y0,2);
    for j=1:1:y0_size %初期値のループ
        ts = Rossler3(A,y0(:,j));
        
        [filtered1, filtered2] = bp(ts); %バンドパス
        
        %analysisPLI; %PLIの計算
        %analysisTE;  %TEの計算
        te_val12 = te_cal_tau_model(filtered1, filtered2,tau(i));
        te_val21 = te_cal_tau_model(filtered2, filtered1,tau(i));
        
        %相関係数の計算
        %rho = corr(filtered1,filtered2);
        
        %平均を取る 10x5行列の平均
        %tmp_rst(j,2) = rho;
        %tmp_rst(j,3) = pli_a;
        tmp_rst(j,4) = te_val12;
        tmp_rst(j,5) = te_val21;
                
        
    end    
    rst(i,:) = mean(tmp_rst);
    
    clearvars ts filtered1 filtered2 tmp_rst
end

rst(:,1) = tau;
