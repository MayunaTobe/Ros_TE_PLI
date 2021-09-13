% 散布図
% loadしたあとタイトル部分変える
% rst [A, rho, PLI, TE12, TE21]
figtitle = 'D0'; %タイトル

%% rho-PLI
figure
scatter(rst(:,2),rst(:,3))
xlabel('rho')
ylabel('PLI')
saveas(gcf,append('rho-PLI_',figtitle,'.png')) %変える

%% rho-TE
figure
scatter(rst(:,2),rst(:,4),'x')
hold on
scatter(rst(:,2),rst(:,5),'o')
legend('TE1→2','TE2→1','Location','southwest')
xlabel('rho')
ylabel('TE')
ylim([0 inf])
saveas(gcf,append('rho-TE_',figtitle,'.png')) %変える
hold off

%% A-rho
figure
scatter(rst(:,1),rst(:,2))
xlabel('A')
ylabel('rho')
saveas(gcf,append('A-rho_',figtitle,'.png')) %変える

%% A-PLI
figure
scatter(rst(:,1),rst(:,3))
xlabel('A')
ylabel('PLI')
saveas(gcf,append('A-PLI_',figtitle,'.png')) %変える

%% A-TE
figure
scatter(rst(:,1),rst(:,4),'x')
hold on
scatter(rst(:,1),rst(:,5),'o')
legend('TE12','TE21')
xlabel('A')
ylabel('TE')
ylim([0 inf])
saveas(gcf,append('A-TE_',figtitle,'.png')) %変える


%% PLI-TE
figure
scatter(rst(:,3),rst(:,4),'x')
hold on
scatter(rst(:,3),rst(:,5),'o')
legend('TE1→2','TE2→1','Location','southeast')
xlabel('PLI')
ylabel('TE')
saveas(gcf,append('PLI-TE_',figtitle,'.png')) %変える

%% TE-PLI
figure
scatter(rst(:,4),rst(:,3),'x')
hold on
scatter(rst(:,5),rst(:,3),'o')
legend('TE1→2','TE2→1','Location','southeast')
xlabel('TE')
ylabel('PLI')
xlim([0 inf])
saveas(gcf,append('TE-PLI_',figtitle,'.png')) %変える