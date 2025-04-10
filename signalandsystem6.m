clear
close all
clc
pkg load signal


%%
Fs = 44100;
nBits = 16;
nChannels = 2;
ID = -1;       % default audio input device
recObj = audiorecorder(Fs,nBits,nChannels,ID);
disp("Begin speaking.")
recDuration = 3; % record for 3 seconds
recordblocking(recObj,recDuration);
disp("End of recording.");
%%
data = getaudiodata(recObj);
time = (0:length(data)-1)/Fs;
##subplot(2,1,1);
##plot(time,data);
##xlabel('time(s)');
##ylabel('amplify');
##title('audio in time');

%%
##n = length(data);
n = 131072;
data = data(1:n);
fs_s = (0:n-1)*(Fs/n);
tran_data = fft(data,n);
half_n = floor(n/2);
tran_data1 = tran_data(1:half_n);
fs_s1 = fs_s(1:half_n);
subplot(2,1,1);
plot(fs_s1,2.*abs(tran_data1));
xlabel('f(hz)');
ylabel('amplify');
title('audio in frequcy');
subplot(2,1,2);
plot(fs_s1,angle(tran_data1));
xlabel('f(hz)');
ylabel('phase');
%%


%%
data2 = data.*hamming(n)';
tran_data2 = fft(data2);
tran_data2 = tran_data2(1:half_n);
figure();
subplot(2,1,1);
plot(fs_s1,2.*abs(tran_data2));
xlabel('f(hz)');
ylabel('amplify');
title('audio in frequcy with hamming');
subplot(2,1,2);
plot(fs_s1,angle(tran_data2));
xlabel('f(hz)');
ylabel('phase');
%%

%%
psd = tran_data.*conj(tran_data)/n;
figure();
plot(fs_s,psd);
xlabel('f(hz)');
ylabel('power');
title('audio in frequcy');


plot (data);

fs= Fs;
fc = 500;
[b,a] = butter(10,fc/(fs/2));
##figure();
##freqz(b,a,[],fs);

signal_filter_butter_lowpass = filter(b,a,data);
figure();
plot(signal_filter_butter_lowpass);
title ("butter_lowpass");

%%

tran_data_lowpass = fft(signal_filter_butter_lowpass );
tran_data_lowpass = tran_data_lowpass(1:half_n);
figure();
subplot(2,1,1);
plot(fs_s1,2.*abs(tran_data_lowpass));
xlabel('f(hz)');
ylabel('amplify');
title('audio in frequcy with lowpass');
subplot(2,1,2);
plot(fs_s1,angle(tran_data_lowpass));
xlabel('f(hz)');
ylabel('phase');
%%

fc = 500;
[b,a] = butter(10,fc/(fs/2),"high");
##figure();
##freqz(b,a,[],fs);

signal_filter_butter_highpass = filter(b,a,data);
figure();
plot(signal_filter_butter_highpass);
title ("butter_highpass");


%%

tran_data_highpass = fft(signal_filter_butter_highpass);
tran_data_highpass = tran_data_highpass(1:half_n);
figure();
subplot(2,1,1);
plot(fs_s1,2.*abs(tran_data_highpass));
xlabel('f(hz)');
ylabel('amplify');
title('audio in frequcy with highpass');
subplot(2,1,2);
plot(fs_s1,angle(tran_data_highpass));
xlabel('f(hz)');
ylabel('phase');
%%

fc = 2500;
[b,a] = butter(10,fc/(fs/2));
##figure();
##freqz(b,a,[],fs);

signal_filter_butter_bondpass = filter(b,a,signal_filter_butter_highpass);
figure();
plot(signal_filter_butter_bondpass);
title ("butter_bondpass");
audiowrite('E:\Octaveworkspace\suitangzuoye\123456.wav',signal_filter_butter_bondpass,Fs);

%%

tran_data_bondpass = fft(signal_filter_butter_bondpass);
tran_data_bondpass = tran_data_bondpass(1:half_n);
figure();
subplot(2,1,1);
plot(fs_s1,2.*abs(tran_data_bondpass));
xlabel('f(hz)');
ylabel('amplify');
title('audio in frequcy with bondpass');
subplot(2,1,2);
plot(fs_s1,angle(tran_data_bondpass));
xlabel('f(hz)');
ylabel('phase');
%%
