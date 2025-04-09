clc
close all
clear

pkg load signal
pkg load communications

fs = 1000;
fm = 100;
fb = 5;

dt = 1/fs;
t = 0:dt:1000;
%%调制后信号时域显示
Am = sin(t*2*pi*fb);

Am = awgn(Am , 20 , 'measured');
xh = sin(t*2*pi*fm);
s = Am.*xh;
plot(s);
title('AM amplify-time');

%%


%%调制后信号频谱显示
n =  65536*4;
fs_s = (0:n-1)*(fs/n);
s1 = s(1:n);
s2 = s1.*(hamming(n)');
tran_data = fft(s2,n);
half_n = floor(n/2);
tran_data1 = tran_data(1:half_n);
fs_s1 = fs_s(1:half_n);
subplot(2,1,1);
plot(fs_s1,abs(tran_data1));
xlabel('f(hz)');
ylabel('amplify');
title('AMsignal in frequcy');
subplot(2,1,2);
plot(fs_s1,angle(tran_data1));
xlabel('f(hz)');
ylabel('phase');
%%
xh_n = xh;
##xh_n = sin(t.*(2*pi*fm)+randn(size(t)).*(0.5*pi));

x_ds = s .* xh_n;


%%lowpass filter
fc = 10;
[b,a] = butter(5,fc/(fs/2));
figure();
freqz(b,a,[],fs);

x_ds_f = 2*filter(b,a,x_ds);
figure();
plot(t,x_ds_f );
title ("butter_lowpass");
axis([0,100,-2,2]);

%%


%%解调信号显示
figure();
n =  65536;
fs_s = (0:n-1)*(fs/n);
tran_data = fft(x_ds_f,n);
half_n = floor(n/2);
tran_data1 = tran_data(1:half_n);
fs_s1 = fs_s(1:half_n);
subplot(2,1,1);
plot(fs_s1,abs(tran_data1));
xlabel('f(hz)');
ylabel('amplify');
title('signal in frequcy');
subplot(2,1,2);
plot(fs_s1,angle(tran_data1));
xlabel('f(hz)');
ylabel('phase');

%%
