% レスラー結合なし
% モデルの時系列のグラフ
% アトラクターを得る

tspan = [0 500];
y0=[0; 1; 1];
A =0.0004;

%ts = zeros(49001,2);

[t,y] = ode45(@(t,y)Ros_1(t,y),tspan,y0);

desiredFs = 100;
[ry,rt] = resample(y,t,desiredFs); %リサンプル

w=0.9;
figure
plot(ry(1000:20000,1),'LineWidth',1,'Color','k');
xlim([0 15000]);
grid on
pbaspect([4 1 1])
xlabel('t')
ylabel('x')
%saveas(gcf,'Ros_1.eps','epsc')

% hold on
% plot(rt,ry(:,4));

% figure
plot3(y(:,1),y(:,2),y(:,3),'Color','k');
xlabel('x');
ylabel('y');
zlabel('z');
grid on
 

ts(:,1) = ry(1000:9000,1); %ts1にリサンプルしたyの1行目を代入
%ts(:,2) = ry(1000:50000,4); %ts2にリサンプルしたyの3行目を代入
%plot(ts)


function dy=Ros_1(t,y)

%A = 1.5;
Mu = 5.7;

dy(1) = -(y(2)+y(3));
dy(2) = y(1)+(1/5)*y(2);
dy(3) = (1/5)+y(3)*(y(1)-Mu);
% dy(4) = -(y(5)+y(6));
% dy(5) = y(4)+(1/5)*y(5)+A*(y(2)-y(5));
% dy(6) = (1/5)+y(6)*(y(4)-Mu);

dy = dy';
end
