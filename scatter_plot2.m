%散布図作成

%% TE-PLI 散布図
% データ整理
te=(te_ns12+te_ns21)/2; % 足して2で割る
te(te<0)=NaN;
[te_sort,i_sort]=sort(te);
pli_ns_sort=pli_ns(i_sort);

% プロット部分（データのプロット）
scatter(te,pli_ns,'.')
hold on

% プロット部分（近似曲線）
plot(te_sort,smooth(movmean(pli_ns_sort,5),0.1,'loess'),'LineWidth',2)
xlabel('TE')
ylabel('PLI')

hold off

figure
%% epoch-PLIのグラフ
c = 1;
for i=1:5
    subplot(5,1,i)
    plot(pli(c,:))
    xlim([0 101]);
    ylim([0 1.0]);
    %xlabel('epoch');
    ylabel('PLI');
    title(['A=',num2str(i*0.02)]);
    c=c+200;
end
 xlabel('epoch');