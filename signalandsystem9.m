clc
close all
clear

pkg load signal
pkg load communications

fs = 10000;
fm = 1000;
fb = 3.5;

dt = 1/fs;
t = 0:dt:10;
%%调制后信号时域显示
Am = sin(t*2*pi*fb);

##Am = awgn(Am , 20 , 'measured');
xh = sin(t*2*pi*fm);
s = (1+0.5.*Am).*xh;
plot(s);
title('AM amplify-time');

%%

figure();
plot(Am);
title('information siganl');

figure();
plot(xh);
title(' carrier siganl');


%%
%   LFM ：linear frequency modulation
%%
B  = 28;  % 带宽70MHz
T  = 10;  % 脉宽2s
fs = 10000; % 采样率
N = 10*fs;

K = B/T;
%%
St = exp(2*pi*j*(t.^2*0.5*K+t.*2)); %信号
theta = 2*pi*j*(t.^2*0.5*K+t.*2); %信号弧度
f = K*t+2; %信号频率

figure();
subplot(2,2,1);
plot(t,real(St));
title('signal(real)');
subplot(2,2,2);
plot(t,imag(St));
title('signal(image)');
subplot(2,2,3);
plot(t,theta);
title('signal(phase) °');
subplot(2,2,4);
plot(f);
title('signal(frequency) Hz');

figure();

plot(abs(fft(St)));title('Spectrogram');
##plot(abs(fftshift(fft(St))));title('信号频谱');

figure();
s2 = (1+0.5*St).*xh;
plot(t,s2);
title('AM amplify-time(2)');




%%单频率调制后信号频谱显示
n =  65536;
fs_s = (0:n-1)*(fs/n);
s1 = s(1:n);
tran_data = fft(s1,n)/n;
half_n = floor(n/2);
tran_data1 = tran_data(1:half_n);
fs_s1 = fs_s(1:half_n);
figure();
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

%%调制后信号频谱显示
n =  65536;
fs_s = (0:n-1)*(fs/n);
s1 = s2(1:n);
tran_data = fft(s1,n)/n;
half_n = floor(n/2);
tran_data1 = tran_data(1:half_n);
fs_s1 = fs_s(1:half_n);
figure();
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

x_ds_f = (filter(b,a,x_ds)-0.5).*4;
figure();
plot(t,x_ds_f );
title ("butter_lowpass");
axis([0,10,-2,2]);

%%


%%解调信号显示
figure();
n =  65536;
fs_s = (0:n-1)*(fs/n);
tran_data = fft(x_ds_f,n)/n;
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

xh_n = xh;
##xh_n = sin(t.*(2*pi*fm)+randn(size(t)).*(0.5*pi));

x_ds = s2 .* xh_n;


%%lowpass filter
fc = 50;
[b,a] = butter(5,fc/(fs/2));
figure();
freqz(b,a,[],fs);

x_ds_f = (filter(b,a,x_ds)-0.5).*4;
figure();
plot(t,x_ds_f );
title ("butter_lowpass");
axis([0,10,-2,2]);

%%


%%解调信号显示
figure();
n =  65536;
fs_s = (0:n-1)*(fs/n);
tran_data = fft(x_ds_f,n)/n;
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
