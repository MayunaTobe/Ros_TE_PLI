% Compare_noise
% ノイズ強度の違う結果を重ねてプロット、比較
% 2021/09/07

%% データの読み込み
D0=load('noise_500_D0_A0-005-01.mat','rst');
D001=load('noise_500_D001_A0-005-01.mat','rst');
D003=load('noise_500_D003_A0-005-01.mat','rst');
D005=load('noise_500_D005_A0-005-01.mat','rst');
D008=load('noise_500_D008_A0-005-01.mat','rst');
D04=load('noise_500_D04_A0-005-01.mat','rst');
D1=load('noise_500_D1_A0-005-01.mat','rst');

D = [D0 D001 D003 D005 D008 D04 D1];

%% rho-PLI
figure
for i=1:size(D,2)
    rst=D(i).rst;
    scatter(rst(:,2),rst(:,3))
    hold on
    xlabel('rho')
    ylabel('PLI')
    %saveas(gcf,append('rho-PLI_comp',figtitle,'.png'))
end
legend('D0','D00','D003','D005','D008','D04','D1');
hold off

%% rho-TE
figure
for i=1:size(D,2)
    rst=D(i).rst;
    scatter(rst(:,2),rst(:,4),'x')
    hold on
    %scatter(rst(:,2),rst(:,5),'o')
    %legend('TE1→2','TE2→1','Location','southwest')
    xlabel('rho')
    ylabel('TE')
    ylim([0 inf])
    %saveas(gcf,append('rho-TE_',figtitle,'.png'))
end
legend('D0','D00','D003','D005','D008','D04','D1');
hold off

%% A-rho
figure
for i=1:size(D,2)
    rst=D(i).rst;
    scatter(rst(:,1),rst(:,2))
    hold on
    xlabel('A')
    ylabel('rho')
    %saveas(gcf,append('A-rho_',figtitle,'.png'))
end
legend('D0','D00','D003','D005','D008','D04','D1');
hold off

%% A-PLI
figure
for i=1:size(D,2)
    rst=D(i).rst;
    scatter(rst(:,1),rst(:,3))
    hold on
    xlabel('A')
    ylabel('PLI')
    %saveas(gcf,append('A-PLI_',figtitle,'.png')) %変える
end
legend('D0','D00','D003','D005','D008','D04','D1');
hold off

%% A-TE
figure
for i=1:size(D,2)
    rst=D(i).rst;
    scatter(rst(:,1),rst(:,4),'x')
    hold on
    hold on
    %scatter(rst(:,1),rst(:,5),'o')
    %legend('TE12','TE21')
    xlabel('A')
    ylabel('TE')
    ylim([0 inf])
    %saveas(gcf,append('A-TE_',figtitle,'.png')) %変える
end
legend('D0','D00','D003','D005','D008','D04','D1');
hold off

%% PLI-TE
figure
for i=1:size(D,2)
    rst=D(i).rst;
    scatter(rst(:,3),rst(:,4),'x')
    hold on
    %scatter(rst(:,3),rst(:,5),'o')
    %legend('TE1→2','TE2→1','Location','southeast')
    xlabel('PLI')
    ylabel('TE')
    %saveas(gcf,append('PLI-TE_',figtitle,'.png')) %変える
end
legend('D0','D00','D003','D005','D008','D04','D1');
hold off

%% TE-PLIfor i=1:size(D,2)
figure
for i=1:size(D,2)
    rst=D(i).rst;
    scatter(rst(:,4),rst(:,3),'x')
    hold on
    %scatter(rst(:,5),rst(:,3),'o')
    %legend('TE1→2','TE2→1','Location','southeast')
    xlabel('TE')
    ylabel('PLI')
    xlim([0 inf])
    %saveas(gcf,append('TE-PLI_',figtitle,'.png')) %変える
end
legend('D0','D00','D003','D005','D008','D04','D1');
hold off