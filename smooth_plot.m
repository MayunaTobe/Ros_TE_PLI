% 平滑化
load census;

% figure
% scatter(rst(:,4),rst(:,3),'x')
% hold on
% scatter(rst(:,5),rst(:,3),'o')
% legend('TE12','TE21')
% xlabel('TE')
% ylabel('PLI')
% title('tau')
% 
% %% smooth 応答データの平滑化
% x1=sort(rst(:,4));
% y1=sort(rst(:,3));
% y1_s=smooth(y1,'rlowess');
% plot(x1,y1_s,'b-');
% 
% x2=sort(rst(:,5));
% y2=sort(rst(:,3));
% y2_s=smooth(y2,'rlowess');
% plot(x2,y2_s,'r-');

%% グラフ描画
figure
scatter(rst(:,4),rst(:,3),'x')
hold on
scatter(rst(:,5),rst(:,3),'o')
legend('TE12','TE21')
xlabel('TE')
ylabel('PLI')
title('tau')

%% fit 曲線または曲面でデータを近似
% x1=sort(rst(:,4));
% y1=sort(rst(:,3));
% f1=fit(x1,y1,'gauss2');
% plot(f1,'b-');
% 
% x2=sort(rst(:,5));
% y2=sort(rst(:,3));
% f2=fit(x2,y2,'gauss2');
% plot(f2,'r-');

%% ガウス過程
X1=sort(rst(:,4));
Y1=sort(rst(:,3));

gprMdl1 = fitrgp(X1,Y1,'Basis','linear','FitMethod','exact','PredictMethod','exact');
ypred1 = resubPredict(gprMdl1);
plot(X1,ypred1,'b-')

X2=sort(rst(:,5));
Y2=sort(rst(:,3));

gprMdl2 = fitrgp(X2,Y2,'Basis','linear','FitMethod','exact','PredictMethod','exact');
ypred2 = resubPredict(gprMdl2);
plot(X2,ypred2,'r-')

grid on

