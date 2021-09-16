% レスラー方程式 Rossler3
% 初期値も引数として指定
function [ts]= Rossler3(A,y0)

tspan = [0 1000];
%ts = zeros(49001,2);

% tsのステップ幅
ts_start = 1000;
ts_end = 50000*2;

[t,y] = ode45(@(t,y)Ros(t,y,A),tspan,y0);

desiredFs = 100; 
[ry,rt] = resample(y,t,desiredFs); %リサンプル

% ノイズの部分-----
%D = 0.08;
%rng(1);

%noise_1 = D*randn(size(rt,1),1);
%noise_2 = D*randn(size(rt,1),1);

%ry(:,1) = ry(:,1) + noise_1; % x1 + noise
%ry(:,4) = ry(:,4) + noise_2; % x2 + noise

% ----------------


% figure
% plot(rt,ry(:,1));
% hold on
% plot(rt,ry(:,4));

% figure
% plot3(y(:,1),y(:,2),y(:,3));

ts(:,1) = ry(ts_start:ts_end,1); %ts1にリサンプル後の1行目を代入
ts(:,2) = ry(ts_start:ts_end,4); %ts2にリサンプル後の4行目を代入

end


