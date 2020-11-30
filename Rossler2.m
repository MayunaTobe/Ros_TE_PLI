% レスラー方程式 Rossler2

function [ts]= Rossler2(A)

tspan = [0 500];
y0=[1; 1; 1; -1; -1.2; -1.3];
%A =0.02;

ts = zeros(49001,2);

[t,y] = ode45(@(t,y)Ros(t,y,A),tspan,y0);

desiredFs = 100;
[ry,rt] = resample(y,t,desiredFs); %リサンプル


% figure
% plot(rt,ry(:,1));
% hold on
% plot(rt,ry(:,4));

% figure
% plot3(y(:,1),y(:,2),y(:,3));

ts(:,1) = ry(1000:50000,1); %ts1にリサンプルしたyの1行目を代入
ts(:,2) = ry(1000:50000,4); %ts2にリサンプルしたyの3行目を代入

end

