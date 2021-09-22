% Rossler
% 相関, PLI, TE
% 初期値を動かす
% PLI、TEの時系列を分割
addpath("../../2019/HERMES_lib/tim-matlab-1.2.0/");

%A = (0:0.0001:0.1;3)';
 A = (0:0.001:0.1)';
% A=0.002;
%[s,~] = size(A);
s = size(A,1);
%rst = zeros(s,392+1);
%tmp_rst = zeros(10,98*4);
    

for i=1:1:s
    i
    
    %y0 初期値 10個
    y0 =[[1; 1; 1; -1; -1.2; -1.3] [-1; 1; 1; -1; -1.2; -1.3] [-1; 1; 1; 1; -1.2; -1.3] [1; 1; 1; 1; -1.2; -1.3] [1; -1; 1; -1; -1.2; -1.3] [-1; 1; 1; -1; 1.2; -1.3] [-1; -1; 1; 1; 1.2; -1.3] [1; -1.2; 1; 1; -1; -1.3] [-1; -1.2; 1; -1; -1; -1.3] [1; -1.2; 1; 1; 1; -1.3]];
    y0_size = size(y0,2); 
    for j=1:1:y0_size
        ts = Rossler3(A(i),y0(:,j));
        
        [filtered1, filtered2] = bp(ts); %バンドパス
        
        % 時系列を分割したPLI;
        pli_a = pli_cal_split(filtered1,filtered2);
        % analysisTE;
        te_val12= te_cal_split(filtered1,filtered2);
        te_val21= te_cal_split(filtered2,filtered1);
        
        % 時系列を分割していないTE
        te_ns_a12 = te_cal(filtered1,filtered2);
        te_ns_a21 = te_cal(filtered2,filtered1);
        % 時系列を分割していないPLI
        pli_ns_a = pli_cal(filtered1,filtered2);
        % 時系列を分割していないrho
        rho_ns_a = corr(filtered1,filtered2);
        
        for l=1:1:floor(size(filtered1,1)/500)
            rho_a(l) = corr(filtered1(1+500*(l-1):(l)*500),filtered2(1+500*(l-1):(l)*500));
        end
        
        %平均を取る 10x5行列の平均
        %tmp_rst(j,98*0+1:98*0+1+97) = rho;
        %tmp_rst(j,98*1+1:98*1+1+97) = pli_a;
        %tmp_rst(j,98*2+1:98*2+1+97) = te_val12;
        %tmp_rst(j,98*3+1:98*3+1+97) = te_val21;
        
        tmp_rho(j,:)=rho_a;
        tmp_pli(j,:)=pli_a;
        tmp_te12(j,:)=te_val12;
        tmp_te21(j,:)=te_val21;
        
        tmp_te_ns12(j,:)=te_ns_a12;
        tmp_te_ns21(j,:)=te_ns_a21;
        tmp_pli_ns(j,:)=pli_ns_a;
        tmp_rho_ns(j,:)=rho_ns_a;
        
    end
    % 平均を取る
    %rst(i,2:392+1) = mean(tmp_rst);
    rho(i,:)=mean(tmp_rho);
    pli(i,:)=mean(tmp_pli);
    te12(i,:)=mean(tmp_te12);
    te21(i,:)=mean(tmp_te21);
    
    te_ns12(i,:)=mean(tmp_te_ns12);
    te_ns21(i,:)=mean(tmp_te_ns21);
    pli_ns(i,:)=mean(tmp_pli_ns);
    rho_ns(i,:)=mean(tmp_rho_ns);
    
    clearvars ts filtered1 filtered2 
end

%rst(:,1) = A;