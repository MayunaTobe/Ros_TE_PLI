% 散布図
% loadしたあとタイトル部分変える
% rst [B, rho, PLI, TE12, TE21]

%% rho-PLI
figure
scatter(rst(:,2),rst(:,3))
xlabel('rho')
ylabel('PLI')
title('tau') %変える
saveas(gcf,'PLI1110_tau10.png') %変える

%% rho-TE
figure
scatter(rst(:,2),rst(:,4),'x')
hold on
scatter(rst(:,2),rst(:,5),'o')
legend('TE12','TE21')
xlabel('rho')
ylabel('TE')
title('tau') %変える
saveas(gcf,'TE1110_tau10.png') %変える
hold off

%% B-rho
figure
scatter(rst(:,1),rst(:,2))
xlabel('A')
ylabel('rho')
title('tau')
saveas(gcf,'B-R1110_tau10.png') %変える

%% B-PLI
figure
scatter(rst(:,1),rst(:,3))
xlabel('A')
ylabel('PLI')
title('tau') %変える
saveas(gcf,'B-PLI1110_tau10.png') %変える

%% B-TE
figure
scatter(rst(:,1),rst(:,4),'x')
hold on
scatter(rst(:,1),rst(:,5),'o')
legend('TE12','TE21')
xlabel('A')
ylabel('TE')
title('tau')
saveas(gcf,'B-TE1110_tau10.png') %変える


%% PLI-TE
figure
scatter(rst(:,3),rst(:,4),'x')
hold on
scatter(rst(:,3),rst(:,5),'o')
legend('TE12','TE21')
xlabel('PLI')
ylabel('TE')
title('tau')
saveas(gcf,'PLI-TE1110_tau10.png') %変える

%% TE-PLI
figure
scatter(rst(:,4),rst(:,3),'x')
hold on
scatter(rst(:,5),rst(:,3),'o')
legend('TE12','TE21')
xlabel('TE')
ylabel('PLI')
%title('tau')
saveas(gcf,'TE-PLI1110_tau10.png') %変える