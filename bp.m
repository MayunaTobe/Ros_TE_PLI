% バンドパス

function [filtered1,filtered2] = bp(ts)
z_ts1 = zscore(ts(:,1));
z_ts2 = zscore(ts(:,2));

Fs = 100;

Fl = 0.5;
Fh = 4.0;

passband = [Fl/(Fs/2) Fh/(Fs/2)];

fir_ch1 = fir1 ( floor ( size(z_ts1,1) / 3 ) - 1, passband );
filtered1 = filtfilt(fir_ch1, 1, double (z_ts1));

fir_ch2 = fir1 ( floor ( size(z_ts2,1) / 3 ) - 1, passband );
filtered2 = filtfilt(fir_ch2, 1, double (z_ts2));

end