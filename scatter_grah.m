% 散布図
% loadしたあとタイトル部分変える
% rst [B, rho, PLI, TE12, TE21]
figtitle = 'D0'; %タイトル

%% rho-PLI
figure
scatter(rst(:,2),rst(:,3))
xlabel('rho')
ylabel('PLI')
%title('tau') %変える
saveas(gcf,append('rho-PLI_',figtitle,'.png')) %変える

%% rho-TE
figure
scatter(rst(:,2),rst(:,4),'x')
hold on
scatter(rst(:,2),rst(:,5),'o')
%legend('TE12','TE21')
legend('TE12','TE21','Location','southwest')
xlabel('rho')
ylabel('TE')
%title('tau') %変える
ylim([0 inf])
%saveas(gcf,'rho-TE_d0.png') %変える
saveas(gcf,append('rho-TE_',figtitle,'.png')) %変える
hold off

%% B-rho
figure
scatter(rst(:,1),rst(:,2))
xlabel('A')
ylabel('rho')
%title('tau')
%saveas(gcf,'B-rho_d0.png') %変える
saveas(gcf,append('A-rho_',figtitle,'.png')) %変える

%% B-PLI
figure
scatter(rst(:,1),rst(:,3))
xlabel('A')
ylabel('PLI')
%title('tau') %変える
%saveas(gcf,'B-PLI_d0.png') %変える
saveas(gcf,append('A-PLI_',figtitle,'.png')) %変える

%% B-TE
figure
scatter(rst(:,1),rst(:,4),'x')
hold on
scatter(rst(:,1),rst(:,5),'o')
legend('TE12','TE21')
xlabel('A')
ylabel('TE')
%title('tau')
ylim([0 inf])
%saveas(gcf,'B-TE_d0.png') %変える
saveas(gcf,append('A-TE_',figtitle,'.png')) %変える


%% PLI-TE
figure
scatter(rst(:,3),rst(:,4),'x')
hold on
scatter(rst(:,3),rst(:,5),'o')
legend('TE12','TE21','Location','southeast')
%legend('TE12','TE21')
xlabel('PLI')
ylabel('TE')
%title('tau')
%saveas(gcf,'PLI-TE_d0.png') %変える
saveas(gcf,append('PLI-TE_',figtitle,'.png')) %変える

%% TE-PLI
figure
scatter(rst(:,4),rst(:,3),'x')
hold on
scatter(rst(:,5),rst(:,3),'o')
legend('TE12','TE21','Location','southeast')
%legend('TE12','TE21')
xlabel('TE')
ylabel('PLI')
xlim([0 inf])
%title('tau')
%saveas(gcf,'TE-PLI_d0.png') %変える
saveas(gcf,append('TE-PLI_',figtitle,'.png')) %変える