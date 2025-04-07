clear
close all
clc

pkg load communications;
fs = 1000;
t = linspace(0,1,1000);
x1 =3* cos(53*2*pi*t);
x2 =2* cos(74*2*pi*t);
x = x1+x2;
y =awgn(x,20,'measured');

figure();
plot (t,x);
title("signal-ideal");

figure();
plot (t,y);
title("siganl+nosie");


fc = 100;
[b,a] = butter(2,fc/(fs/2));
figure();
freqz(b,a,[],fs);

signal_filter_butter_lowpass = filter(b,a,y);
figure();
plot(signal_filter_butter_lowpass);
title ("butter_lowpass");

fc = 50;
[b,a] = butter(2,fc/(fs/2),"high");
figure();
freqz(b,a,[],fs);

signal_filter_butter_bondpass = filter(b,a,signal_filter_butter_lowpass);
figure();
plot(signal_filter_butter_bondpass);
title ("butter_bondpass");

fc = 100;
[b,a] = butter(10,fc/(fs/2));
##figure();
##freqz(b,a,[],fs);

signal_filter_butter_lowpass = filter(b,a,y);
figure();
plot(signal_filter_butter_lowpass);
title ("butter_lowpass");

fc = 50;
[b,a] = butter(10,fc/(fs/2),"high");
##figure();
##freqz(b,a,[],fs);

signal_filter_butter_bondpass = filter(b,a,signal_filter_butter_lowpass);
figure();
plot(signal_filter_butter_bondpass);
title ("butter_bondpass");


fc = 100;
[b,a] = cheby1(2,3,fc/(fs/2));

figure();
freqz(b,a,[],fs);

signal_filter_cheby1_lowpass = filter(b,a,y);
figure();
plot(signal_filter_cheby1_lowpass);
title ("cheby1_lowpass");

fc = 50;
[b,a] = cheby1(2,3,fc/(fs/2),"high");

figure();
freqz(b,a,[],fs);

signal_filter_cheby1_bondpass = filter(b,a,signal_filter_cheby1_lowpass);
figure();
plot(signal_filter_cheby1_bondpass);
title ("cheby1_bondpass");


fc = 100;
[b,a] = cheby1(10,3,fc/(fs/2));
figure();
freqz(b,a,[],fs);

signal_filter_cheby1_lowpass = filter(b,a,y);
figure();
plot(signal_filter_cheby1_lowpass);
title ("cheby1_lowpass");

fc = 50;
[b,a] = cheby1(10,3,fc/(fs/2),"high");
figure();
freqz(b,a,[],fs);

signal_filter_cheby1_bondpass = filter(b,a,signal_filter_cheby1_lowpass);
figure();
plot(signal_filter_cheby1_bondpass);
title ("cheby1_bondpass");


fc = 100;
[b,a] = ellip(2,3,3,fc/(fs/2));
figure();
freqz(b,a,[],fs);

signal_filter_ellip_lowpass = filter(b,a,y);
figure();
plot(signal_filter_ellip_lowpass);
title ("ellip_lowpass");

fc = 50;
[b,a] = ellip(2,3,3,fc/(fs/2),"high");
figure();
freqz(b,a,[],fs);

signal_filter_ellip_bondpass = filter(b,a,signal_filter_ellip_lowpass);
figure();
plot(signal_filter_ellip_bondpass);
title ("ellip_bondpass");

fc = 100;
[b,a] = ellip(10,3,3,fc/(fs/2));
figure();
freqz(b,a,[],fs);

signal_filter_ellip_lowpass = filter(b,a,y);
figure();

plot(signal_filter_ellip_lowpass);
title ("ellip_lowpass");

fc = 50;
[b,a] = ellip(10,3,3,fc/(fs/2),"high");
figure();
freqz(b,a,[],fs);

signal_filter_ellip_bondpass = filter(b,a,signal_filter_ellip_lowpass);
figure();
plot(signal_filter_ellip_bondpass);
title ("ellip_bondpass");
