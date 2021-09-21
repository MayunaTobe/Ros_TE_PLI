% レスラー方程式 Rossler
% 時系列のプロット

N = 4;
%tspan = [0 500];
tspan = [0 500*N];
%tspan = [1000 1500]; % tspanの範囲の変更
y0=[0; 1; 1; 0; 1.1; 1.1];
A =0.0004;

% tsのステップ幅
%ts_start = 1000;
ts_start = 149001;
ts_end = 50000*N;
%ts_end = 50000*1;

%ts = zeros(49001,2);

[t,y] = ode45(@(t,y)Ros(t,y,A),tspan,y0);

desiredFs = 100;
[ry,rt] = resample(y,t,desiredFs); %リサンプル


% figure
% plot(rt,ry(:,1));
% hold on
% plot(rt,ry(:,4));
w=0.9;

figure
plot(ry(1000:20000,1),'LineWidth',w);
hold on
plot(ry(1000:20000,4),'LineWidth',w);
xlim([0 15000]);
grid on
pbaspect([4 1 1])
xlabel('t')
ylabel('x_1,x_2')
legend('x1','x2');
% saveas(gcf,'Ros_2.eps','epsc')

% figure
% plot3(y(:,1),y(:,2),y(:,3));

ts(:,1) = ry(ts_start:ts_end,1); %ts1にリサンプルしたyの1行目を代入
ts(:,2) = ry(ts_start:ts_end,4); %ts2にリサンプルしたyの4行目を代入

% ノイズ------------
%w_noise=wgn(2,size(rt,1),0); % ノイズの信号をつくる
% D=0.08;
% rng(1);
% 
% noise1 = D*randn(size(rt,1),1); 
% noise2 = D*randn(size(rt,1),1); 
% 
% w_ry1 = ry(:,1) + noise1; % x1 + noise
% w_ry4 = ry(:,4) + noise2; % x2 + noise

% figure
% plot(ry1(1000:20000),'LineWidth',w);
% hold on
% plot(ry4(1000:20000),'LineWidth',w);
% xlim([0 15000]);
% grid on
% pbaspect([4 1 1])
% xlabel('t')
% ylabel('x_1,x_2')
% legend('x1','x2');
% --------------------------------


function dy=Ros(t,y,A)

Mu = 5.7;

dy(1) = -(y(2)+y(3));
dy(2) = y(1)+(1/5)*y(2)+A*(y(5)-y(2));
dy(3) = (1/5)+y(3)*(y(1)-Mu);
dy(4) = -(y(5)+y(6));
dy(5) = y(4)+(1/5)*y(5)+A*(y(2)-y(5));
dy(6) = (1/5)+y(6)*(y(4)-Mu);

dy = dy';


end
