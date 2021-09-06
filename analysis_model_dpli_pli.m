% 2021-02-17
% A-PLIおよびA-dPLI

addpath("../../2019/HERMES_lib/tim-matlab-1.2.0/");

tau=11; %tauの値を指定
A=[0:0.005:0.1]; %パラメータAの値
s = size(A,2); %Aのサイズ

%rst = zeros(s,2);
%tmp_rst = zeros(10,5);


for i=1:1:s %tauの値を指定するためのループ
    i
    
    %y0 初期値 10個
    y0 =[[1; 1; 1; -1; -1.2; -1.3] [-1; 1; 1; -1; -1.2; -1.3] [-1; 1; 1; 1; -1.2; -1.3] [1; 1; 1; 1; -1.2; -1.3] [1; -1; 1; -1; -1.2; -1.3] [-1; 1; 1; -1; 1.2; -1.3] [-1; -1; 1; 1; 1.2; -1.3] [1; -1.2; 1; 1; -1; -1.3] [-1; -1.2; 1; -1; -1; -1.3] [1; -1.2; 1; 1; 1; -1.3]];
    y0_size = size(y0,2);
    for j=1:1:y0_size %初期値のループ
        ts = Rossler3(A(i),y0(:,j));
        j
        
        [filtered1, filtered2] = bp(ts); %バンドパス
         
         %analysisPLI; %PLIの計算
         [dpli_val12,pli_val]= pli_dpli_cal(filtered1,filtered2);
         [dpli_val21,pli_val]= pli_dpli_cal(filtered2,filtered1);
         
         %analysisTE;  %TEの計算
         te_val12 = te_cal_tau_model(filtered1, filtered2,tau);
         te_val21 = te_cal_tau_model(filtered2, filtered1,tau);
        
        %相関係数の計算
         rho = corr(filtered1,filtered2);

        %PLIのみの計算
%        pli_val=pli_cal(filtered1,filtered2);
        
%         %平均を取る 10x5行列の平均
         tmp_rst(j,2) = dpli_val12;
         tmp_rst(j,3) = dpli_val21;
         tmp_rst(j,4) = pli_val;
         tmp_rst(j,5) = te_val12;
         tmp_rst(j,6) = te_val21;
%         tmp_rst(j,2) = rho;
                
        
    end    
    rst(i,:) = mean(tmp_rst);
    
    clearvars ts filtered1 filtered2 tmp_rst
end

rst(:,1) = A';

% % プロット
% plot(rst(:,1),rst(:,2))
% hold on
% plot(rst(:,1),rst(:,3))
% plot(rst(:,1),rst(:,4))
% plot(rst(:,1),rst(:,5))
% plot(rst(:,1),rst(:,6))
% legend('dpli12','dpli21','pli','te12','te21')
% xlabel('A');
% ylabel('PLI_dPLI');
% hold off
% 
%散布図
% %TE-PLI(500)
% figure
% scatter(rst(:,5),rst(:,4));
% hold on
% scatter(rst(:,6),rst(:,4));
% xlabel('TE');
% ylabel('PLI');
% legend('te12','te21');
% hold off
% % 
% 
% 
% % TE-dPLI
% figure
% scatter(rst(:,5),rst(:,2));
% hold on
% scatter(rst(:,6),rst(:,3));
% xlabel('TE');
% ylabel('dPLI');
% legend('te12-dpli12','te21-dpli21');
% hold off
% 
% %PLI-dPLI
% figure
% scatter(rst(:,4),rst(:,2));
% hold on
% scatter(rst(:,4),rst(:,3));
% xlabel('PLI');
% ylabel('dPLI');
% legend('PLI-dPLI12','PLI-dPLI21');
% hold off
% 
% % TE-dpli
% figure
% scatter(rst(:,5),rst(:,2));
% hold on
% scatter(rst(:,5),rst(:,3));
% xlabel('TE12');
% ylabel('dPLI');
% legend('dPLI12','dPLI21');
% hold off
% 
% figure
% scatter(rst(:,6),rst(:,2));
% hold on
% scatter(rst(:,6),rst(:,3));
% xlabel('TE21');
% ylabel('dPLI');
% legend('dPLI12','dPLI21');
% hold off
% 
% 
% %TE-rho
% figure
% scatter(rst(:,7),rst(:,5));
% hold on
% scatter(rst(:,7),rst(:,6));
% xlabel('rho');
% ylabel('TE');
% legend('TE12','TE21');
% hold off
% 
% 
% %PLI-rho
% figure
% scatter(rst(:,7),rst(:,4));
% xlabel('rho');
% ylabel('PLI');
% hold off
% 
% %-----------------------------------------------------


%A-rho
figure
scatter(rst(:,1),rst(:,7),'filled');
xlabel('A');
ylabel('rho');
grid on
%saveas(gcf,'A-rho.eps','epsc');
hold off


%A-TE
figure
scatter(rst(:,1),rst(:,5),'filled');
hold on
scatter(rst(:,1),rst(:,6),'filled');
xlabel('A');
ylabel('TE');
legend('TE12','TE21');
grid on
%saveas(gcf,'A-TE.eps','epsc');
hold off


%A-PLI
figure
scatter(rst(:,1),rst(:,4),'filled');
xlabel('A');
ylabel('PLI');
grid on
%saveas(gcf,'A-PLI.eps','epsc');
hold off


%TE-PLI
figure
scatter(rst(:,5),rst(:,4),'filled');
hold on
scatter(rst(:,6),rst(:,4),'filled');
xlabel('TE');
ylabel('PLI');
legend('te12','te21');
grid on
%saveas(gcf,'TE-PLI.eps','epsc');
hold off
% % --------------------------
% %TE-PLI(2000)
% figure
% scatter(rst(:,5),rst(:,8),'filled');
% hold on
% scatter(rst(:,6),rst(:,8),'filled');
% xlabel('TE');
% ylabel('PLI');
% legend('te12','te21');
% grid on
% saveas(gcf,'TE-PLI','png');
% hold off
% 
% %A-PLI(2000)
% figure
% scatter(rst(:,1),rst(:,8),'filled');
% xlabel('A');
% ylabel('PLI');
% grid on
% saveas(gcf,'A-PLI','png');
% hold off
% 
% % PLI-rho
% figure
% scatter(rst(:,7),rst(:,8));
% xlabel('rho');
% ylabel('PLI');
% hold off
% 
% figure
% scatter(rst(1:501,5),rst(1:501,8),'filled');
% hold on
% scatter(rst(1:501,6),rst(1:501,8),'filled');
% xlabel('TE');
% ylabel('PLI');
% legend('te12','te21');
% grid on
% saveas(gcf,'TE-PLI','png');
% hold off
% 




