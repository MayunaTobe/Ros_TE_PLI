% Writen by Sou Nobukawa, 6/12/2020
% PLI(pli(band))between time-series ts1 and ts2 and TranEn (te(band)) from ts1 to ts2 are calculated.


function [dpli pli te] = te_pli_cal(ts1,ts2)

  Fl = [2 4 8 13 30];    % High Pass Frequency in Hz
  Fh = [4 8 13 30 60];   % Low Pass Frequency in Hz

  epoch_size=20;
  epoch_leng=2.5; % sec

  
  Fs=500;
  
  for l=1:1:epoch_size


    
    temp_ts1=ts1(floor(Fs*epoch_leng*(l-1)+1):floor(Fs*epoch_leng*(l)));
    temp_ts2=ts2(floor(Fs*epoch_leng*(l-1)+1):floor(Fs*epoch_leng*(l)));
    
    z_ts1=zscore(temp_ts1);
    z_ts2=zscore(temp_ts2);

    for band=1:1:5


      tau=floor(1./Fl(band)*Fs/2);
      emb_dim=5;

      
      passband = [Fl(band)/(Fs/2) Fh(band)/(Fs/2)];
      
      fir_ch1 = fir1 ( floor ( size(z_ts1,1) / 3 ) - 1, passband );
      filtered1 = filtfilt(fir_ch1, 1, double (z_ts1));
      ylp1=hilbert ( filtered1);
      angle1=angle(zscore(ylp1));
      
      fir_ch2 = fir1 ( floor ( size(z_ts2,1) / 3 ) - 1, passband );
      filtered2 = filtfilt(fir_ch2, 1, double (z_ts2));
      ylp2=hilbert ( filtered2);
      angle2=angle(zscore(ylp2));
      
      dch1=delay_embed(filtered1',emb_dim,tau);
      dch2=delay_embed(filtered2',emb_dim,tau);
      w1=delay_embed_future(dch2,tau);
      
      temp_te(band,l)=transfer_entropy(dch1,dch2,w1);
      
      d_angle = wrapToPi(angle1 - angle2);
%  temp_psi(band,l)= abs ( mean ( sign      ( ( abs ( d_angle ) - pi ) .* d_angle ) ) );
      temp_psi(band,l)= abs ( mean ( sign ((d_angle))));
      temp_dpsi(band,l)=abs ( mean ( heaviside(d_angle)));
     % temp_dpsi(band,l)= mean ( heaviside( d_angle ) );
      
    end
  end

  pli=mean(temp_psi,2);
  dpli=mean(temp_dpsi,2);
  te=mean(temp_te,2);
%  abs(0.5-temp_dpsi(band,1))*2-temp_psi(band,1)
end
