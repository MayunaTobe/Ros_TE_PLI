% scatter_plot3
% SICEのプロットの修正用
% データの読み込みをしてから実行
load('sp_A0001_all_L50000.mat')

%% rho-A
figure
scatter(A,rho_ns,'k','.')
xlabel('A','Fontsize',15);
ylabel('ρ','Fontsize',15);
grid on

% フォントサイズ変更
h_axes = gca;
h_axes.XAxis.FontSize = 13;
h_axes.YAxis.FontSize = 13;

hold off
%% A-PLI
figure
scatter(A,pli_ns,'k','.')
xlabel('A','Fontsize',15);
ylabel('PLI','Fontsize',15);
grid on

% フォントサイズ変更
h_axes = gca;
h_axes.XAxis.FontSize = 13;
h_axes.YAxis.FontSize = 13;

hold off

%% A-TE
figure
scatter(A,te_ns12,'r','.')
hold on
scatter(A,te_ns21,'k','.')
xlabel('A','Fontsize',15);
ylabel('TE','Fontsize',15);

legend('x1→x2','x2→x1')

ylim([0 0.35])
grid on

% フォントサイズ変更
h_axes = gca;
h_axes.XAxis.FontSize = 13;
h_axes.YAxis.FontSize = 13;

hold off
