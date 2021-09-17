% scatter_plot_split
% 分割されたデータで散布図を描く
% 2021/09/13
% rst [A(1), rho(98), PLI(98), TE12(98), TE21(98)]

figtitle = 'D0'; %タイトル

%% データの代入
%rho = rst(:,2:2+97);
%pli = rst(:,100:100+97);
%te12 = rst(:,198:198+97);
%te21 = rst(:,296:296+97);
%A = rst(:,1);
data_row = size(rho,2); % PLI、TEそれぞれの個数
data_col = size(rho,1); % Aの個数

mean_pli = mean(pli,2);

% %% PLI
% figure
% plot(1:data_row,pli,'-.');
% xlabel('')
% ylabel('PLI')
% 
% %% TE
% figure
% plot(1:data_row,te12,'-.');
% xlabel('')
% ylabel('TE 1→2')
% 
% figure
% plot(1:data_row,te21,'-.');
% xlabel('')
% ylabel('TE 2→1')
% 
% %% TE-PLI
% figure
% for i=1:1:data_col
%     scatter(te12(i,:),pli(i,:));
%     hold on
% end
% xlabel('TE1→2')
% ylabel('PLI')
% 
% figure
% for i=1:1:data_col
%     scatter(te21(i,:),pli(i,:));
%     hold on
% end
% xlabel('TE2→1')
% ylabel('PLI')

%% エポック-PLI
figure
for i=1:6
    subplot(2,3,i)
    %figure
    plot(pli(i,:),'.')
    ylim([0 1])
    xlabel('epoch')
    ylabel('PLI')
    title('A=',A(i))
end

%% エポック-rho
figure
for i=1:6
    subplot(2,3,i)
    %figure
    plot(rho(i,:),'x')
    ylim([0 1])
    xlabel('epoch')
    ylabel('rho')
    title('A=',A(i))
end

