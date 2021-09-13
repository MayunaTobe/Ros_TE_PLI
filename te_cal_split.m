% Lorenz
% 時系列を分割し、分割した区間ごとにPLIの値を求める

function [te] = te_cal(ts1,ts2)

addpath("../../2019/HERMES_lib/tim-matlab-1.2.0/");

z_ts1=zscore(ts1);
z_ts2=zscore(ts2);

%Fl = [2 4 8 13 30];    % High Pass Frequency in Hz
%Fh = [4 8 13 30 60];   % Low Pass Frequency in Hz

Fl = 0.1;
Fh = 0.2;

Fs=1;

tau=10; %8→20, 40, 60
emb_dim=5;
band = 1;


passband = [Fl(band)/(Fs/2) Fh(band)/(Fs/2)];

ts_size = size(ts1,1); % tsの長さを取得

% 時系列を500ごとに分割する
for l=1:1:floor(ts_size/500)
    
    fir_ch1 = fir1 ( floor ( size(z_ts1(1+500*(l-1):(l)*500),1) / 3 ) - 1, passband );
    filtered1 = filtfilt(fir_ch1, 1, double (z_ts1(1+500*(l-1):(l)*500)));
    %ylp1=hilbert ( filtered1);
    %angle1=angle(zscore(ylp1));
    
    fir_ch2 = fir1 ( floor ( size(z_ts2(1+500*(l-1):(l)*500),1) / 3 ) - 1, passband );
    filtered2 = filtfilt(fir_ch2, 1, double (z_ts2(1+500*(l-1):(l)*500)));
    %ylp2=hilbert ( filtered2);
    %angle2=angle(zscore(ylp2));
    
    ch1=delay_embed(filtered1',emb_dim,tau);
    ch2=delay_embed(filtered2',emb_dim,tau);
    w1=delay_embed_future(ch1,tau);
    
    te(l)=transfer_entropy(ch1,ch2,w1);
end

end
