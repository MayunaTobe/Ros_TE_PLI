% 2021-02-16
% tau-TEグラフのプロット

figure

plot(rst(:,1),rst(:,4))
hold on
plot(rst(:,1),rst(:,5))
legend('te12','te21')
xlabel('tau')
ylabel('TE')

hold off

max12 = max(rst(:,4))
max21 = max(rst(:,5))