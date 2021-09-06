% 2021-02-15
% モデル用のte_cal_tau
% 入力： 時系列１，時系列２，tau

% Lorenz
function [te] = te_cal_tau_model(ts1,ts2,tau)

z_ts1=zscore(ts1);
z_ts2=zscore(ts2);

%Fl = [2 4 8 13 30];    % High Pass Frequency in Hz
%Fh = [4 8 13 30 60];   % Low Pass Frequency in Hz

Fl = 0.1;
Fh = 0.2;

Fs=1;

%tau=10; %8→20, 40, 60
emb_dim=5;
band = 1;


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
