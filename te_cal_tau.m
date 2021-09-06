%tauを可変にする
% 入力: 時系列１，時系列２，tau（外部で指定）

function [te] = te_cal_tau(ts1,ts2,tau)

z_ts1=zscore(ts1);
z_ts2=zscore(ts2);

Fl = [2 4 8 13 30];    % High Pass Frequency in Hz
Fh = [4 8 13 30 60];   % Low Pass Frequency in Hz

Fs=200;

%tau=4;
emb_dim=5;

%for i=1:1:16 %16電極はいらないのでこのループはコメントアウト
for band=1:1:5 % ５バンドごとのループ
    
    passband = [Fl(band)/(Fs/2) Fh(band)/(Fs/2)];
    
    fir_ch1 = fir1 ( floor ( size(z_ts1,1) / 3 ) - 1, passband );
    filtered1 = filtfilt(fir_ch1, 1, double (z_ts1));
    %ylp1=hilbert ( filtered1);
    %angle1=angle(zscore(ylp1));
    
    fir_ch2 = fir1 ( floor ( size(z_ts2,1) / 3 ) - 1, passband );
    filtered2 = filtfilt(fir_ch2, 1, double (z_ts2));
    %ylp2=hilbert ( filtered2);
    %angle2=angle(zscore(ylp2));

    ch1=delay_embed(filtered1',emb_dim,tau);
    ch2=delay_embed(filtered2',emb_dim,tau);
    w1=delay_embed_future(ch1,tau);

    te(band)=transfer_entropy(ch1,ch2,w1);
        
end
%end


end
