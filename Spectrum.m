%[pxx1,f] = periodogram(y(:,1),length(y),
%pxx4 = periodogram(y(:,4),6281,[0 1000],1)


%[pxx1,f] = periodogram(y(:,1),hamming(6281),length(y),1)
%[pxx4,f] = periodogram(y(:,4),hamming(6281),length(y),1)

figure
[pxx1,f] = periodogram(ts(:,1),hamming(49001),[0:0.1:20],100);
semilogy(f,pxx1)

hold on

[pxx4,f] = periodogram(ts(:,2),hamming(49001),[0:0.1:20],100);
semilogy(f,pxx4)
