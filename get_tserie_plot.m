% 2021/02/27
% 時系列をプロットする Time series

addpath("../../2019/HERMES_lib/tim-matlab-1.2.0/");

tau=11; %tauの値を指定
A=[0:0.0001:0.1]; %パラメータAの値

y0 =[[1; 1; 1; -1; -1.2; -1.3] [-1; 1; 1; -1; -1.2; -1.3] [-1; 1; 1; 1; -1.2; -1.3] [1; 1; 1; 1; -1.2; -1.3] [1; -1; 1; -1; -1.2; -1.3] [-1; 1; 1; -1; 1.2; -1.3] [-1; -1; 1; 1; 1.2; -1.3] [1; -1.2; 1; 1; -1; -1.3] [-1; -1.2; 1; -1; -1; -1.3] [1; -1.2; 1; 1; 1; -1.3]];

A1=0;
A2=0.015;
A3=0.1;

ts1= Rossler3(A1,y0(:,1));
ts2= Rossler3(A2,y0(:,1));
ts3= Rossler3(A3,y0(:,1));

[filtered1, filtered2] = bp(ts1);
[filtered3, filtered4] = bp(ts2);
[filtered5, filtered6] = bp(ts3);

w=0.9;

figure
plot(filtered1(20000:27000),'LineWidth',w);
hold on
plot(filtered2(20000:27000),'LineWidth',w);
xlim([0 7000]);
pbaspect([4 1 1])
grid on
xlabel('time[sec]')
ylabel('x_1,x_2')
legend('x_1','x_2');
saveas(gcf,'t1.eps','epsc')
hold off

figure
plot(filtered3(20000:27000),'LineWidth',w);
hold on
plot(filtered4(20000:27000),'LineWidth',w);
xlim([0 7000]);
grid on
pbaspect([4 1 1])
xlabel('time[sec]')
ylabel('x_1,x_2')
% legend('x1','x2');
saveas(gcf,'t2.eps','epsc')
hold off


figure
plot(filtered5(20000:27000),'LineWidth',w);
hold on
plot(filtered6(20000:27000),'LineWidth',w);
xlim([0 7000]);
grid on
pbaspect([4 1 1])
xlabel('time[sec]')
ylabel('x_1,x_2')
% legend('x1','x2');
saveas(gcf,'t3.eps','epsc')
hold off
