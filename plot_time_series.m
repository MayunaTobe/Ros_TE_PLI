% Rosslerモデルの時系列のプロット
% 2021/09/15

A = (0:0.02:0.1)';

s = size(A,1);
rst = zeros(s,392+1);
tmp_rst = zeros(10,98*4);

 for i=1:1:s
    y0 =[[1; 1; 1; -1; -1.2; -1.3] [-1; 1; 1; -1; -1.2; -1.3] [-1; 1; 1; 1; -1.2; -1.3] [1; 1; 1; 1; -1.2; -1.3] [1; -1; 1; -1; -1.2; -1.3] [-1; 1; 1; -1; 1.2; -1.3] [-1; -1; 1; 1; 1.2; -1.3] [1; -1.2; 1; 1; -1; -1.3] [-1; -1.2; 1; -1; -1; -1.3] [1; -1.2; 1; 1; 1; -1.3]];
    y0_size = size(y0,2);
    
    figure
    for j=1:1:y0_size
        ts = Rossler3(A(i),y0(:,j)); % time series
        
        [filtered1, filtered2] = bp(ts); %バンドパス
        
        subplot(5,2,j)
        plot(filtered1);
        hold on
        plot(filtered2);
        title(['y0=',num2str(j),', A=',num2str(A(i))]);
        
    end
    
 end