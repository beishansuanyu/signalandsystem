clear
close
clc


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
plot(fs_s1,abs(tran_data1));
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
plot(fs_s1,abs(tran_data2));
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
