%plot_timeSeires

A = [0, 0.02,0.04,0.06,0.08,0.1];
%y0 初期値 10個
y0 =[[1; 1; 1; -1; -1.2; -1.3] [-1; 1; 1; -1; -1.2; -1.3] [-1; 1; 1; 1; -1.2; -1.3] [1; 1; 1; 1; -1.2; -1.3] [1; -1; 1; -1; -1.2; -1.3] [-1; 1; 1; -1; 1.2; -1.3] [-1; -1; 1; 1; 1.2; -1.3] [1; -1.2; 1; 1; -1; -1.3] [-1; -1.2; 1; -1; -1; -1.3] [1; -1.2; 1; 1; 1; -1.3]];
y0_size = size(y0,2);

j=4;

for i=1:6
    ts = Rossler3(A(i),y0(:,j));

    [filtered1(:,i), filtered2(:,i)] = bp(ts); %バンドパス
    subplot(6,1,i)
    plot(filtered1(:,i),'k');
    
    % フォントサイズ変更
    h_axes = gca;
    h_axes.XAxis.FontSize = 13;
    h_axes.YAxis.FontSize = 13;
    
    if(i==3)
        ylabel('filtered x_1, filtereed x_2')
    end   
    
    grid on
    hold on
    plot(filtered2(:,i),'r');
    xlim([20000 40000])
    title(['A=',num2str(A(i))],'FontSize',15)

    

end
xlabel('time [sec]','FontSize',15);
%    ylabel('filtered x_1 ¥n filtereed x_2')
legend('filtered x_1','filltered x_2', 'FontSize', 15)
hold off