%散布図作成

% データ整理
te=(te_ns12+te_ns21)/2; % 足して2で割る
te(te<0)=NaN;
[te_sort,i_sort]=sort(te);
pli_ns_sort=pli_ns(i_sort);

% プロット部分（データのプロット）
scatter(te,pli_ns,'.')
hold on


% プロット部分（近似曲線）
plot(te_sort,smooth(movmean(pli_ns_sort,5),0.1,'loess'))
xlabel('TE')
ylabel('PLI')