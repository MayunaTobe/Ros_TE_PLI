% 散布図作成
% 最初にデータを読み込み（sp_A0001_all_L50000.mat)

%% TE-PLI 散布図
% データ整理
te=(te_ns12+te_ns21)/2; % 足して2で割る
te(te<0)=NaN;
[te_sort,i_sort]=sort(te);
pli_ns_sort=pli_ns(i_sort);

% プロット部分（データのプロット）
scatter(te,pli_ns,'.','k')
grid on
hold on

% フォントサイズ変更
h_axes = gca;
h_axes.XAxis.FontSize = 15;
h_axes.YAxis.FontSize = 15;

% プロット部分（近似曲線）
plot(te_sort,smooth(movmean(pli_ns_sort,5),0.1,'loess'),'LineWidth',3,'Color','r')
xlabel('TE','FontSize',15)
ylabel('PLI','FontSize',15)

xlim([0 0.3]) % 追加

hold off

figure
%% epoch-PLIのグラフ
c = 1;
A = [0, 0.02,0.04,0.06,0.08,0.1];
for i=1:6
    % プロット
    subplot(6,1,i)
    plot(pli(c,:),'k','LineWidth',0.9)
    
    % フォントサイズ変更
    h_axes = gca;
    h_axes.XAxis.FontSize = 15;
    h_axes.YAxis.FontSize = 15;
    
    grid on
    grid minor
    xlim([0 101]);
    ylim([0 1.0]);
    %xlabel('epoch');
    ylabel('PLI','FontSize',15);
    title(['A=',num2str(A(i))],'FontSize',15)
    c=c+200;
end
xlabel('epoch','FontSize',15);


hold off
