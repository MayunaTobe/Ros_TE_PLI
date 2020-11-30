% レスラー方程式 Rossler3
% 初期値も引数として指定
function [ts]= Rossler3(A,y0)

tspan = [0 500];
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

ts(:,1) = ry(1000:50000,1); %ts1にリサンプル後の1行目を代入
ts(:,2) = ry(1000:50000,4); %ts2にリサンプル後の4行目を代入

end


