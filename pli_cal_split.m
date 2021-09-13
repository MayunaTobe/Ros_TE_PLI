% モデル用 PLI
% Fl,Fh, Fs, bandを変更

function [pli] = pli_cal(ts1,ts2)

z_ts1=zscore(ts1);
z_ts2=zscore(ts2);

%Fl = [2 4 8 13 30];    % High Pass Frequency in Hz
%Fh = [4 8 13 30 60];   % Low Pass Frequency in Hz


Fl = 0.1; %ラジアン
Fh = 0.2;
Fs=1;
band = 1;

passband = [Fl(band)/(Fs/2) Fh(band)/(Fs/2)];

fir_ch1 = fir1 ( floor ( size(z_ts1,1) / 3 ) - 1, passband );
filtered1 = filtfilt(fir_ch1, 1, double (z_ts1));
ylp1=hilbert ( filtered1);
angle1=angle(zscore(ylp1));

fir_ch2 = fir1 ( floor ( size(z_ts2,1) / 3 ) - 1, passband );
filtered2 = filtfilt(fir_ch2, 1, double (z_ts2));
ylp2=hilbert ( filtered2);
angle2=angle(zscore(ylp2));

% d_angle = angle1 - angle2;
% pli = abs ( mean ( sign ( ( abs ( d_angle ) - pi ) .* d_angle ) ) );

% 500ごとに区切る
ts_size = size(ts1,1);
temp_pli=zeros(floor(ts_size/500),1);

for l=1:1:floor(ts_size/500)
    d_angle = angle1 (1+500*(l-1):(l)*500) - angle2 (1+500*(l-1):(l)*500);
    temp_pli(l) = abs ( mean ( sign ( ( abs ( d_angle ) - pi ) .* d_angle ) ) );
end

pli = temp_pli';

end