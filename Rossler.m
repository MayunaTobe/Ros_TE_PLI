% レスラー方程式 Rossler



tspan = [0 500];
y0=[0; 1; 1; 0; 1.1; 1.1];
A =0.02;

ts = zeros(49001,2);

[t,y] = ode45(@(t,y)Ros(t,y,A),tspan,y0);

desiredFs = 100;
[ry,rt] = resample(y,t,desiredFs); %リサンプル


figure
plot(rt,ry(:,1));
hold on
plot(rt,ry(:,4));

% figure
% plot3(y(:,1),y(:,2),y(:,3));

ts(:,1) = ry(1000:50000,1); %ts1にリサンプルしたyの1行目を代入
ts(:,2) = ry(1000:50000,4); %ts2にリサンプルしたyの3行目を代入


function dy=Ros(t,y,A)

%A = 1.5;
Mu = 5.7;

dy(1) = -(y(2)+y(3));
dy(2) = y(1)+(1/5)*y(2)+A*(y(5)-y(2));
dy(3) = (1/5)+y(3)*(y(1)-Mu);
dy(4) = -(y(5)+y(6));
dy(5) = y(4)+(1/5)*y(5)+A*(y(2)-y(5));
dy(6) = (1/5)+y(6)*(y(4)-Mu);

dy = dy';


end
