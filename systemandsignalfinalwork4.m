clc
close all
clear

num = [1 1 1];
den = [2 10 16 8];
w = 0:0.1:100;
H = freqs(num,den,w);
mag = abs(H);
phase = angle(H)*180/pi;
subplot(1,2,1);
plot(w/(2*pi),mag);
xlabel('frequency(Hz)')
ylabel('magnitude');
subplot(1,2,2);
plot(w/(2*pi),phase);
xlabel('frequency(Hz)')
ylabel('phase(°)');

n = 0:1:100;
h1 = 0.4.^n.*heaviside(n);
h2 = dirac(n)+0.5.*dirac(n-1);
x = 0.4.^n.*heaviside(n);


w = 0:1:2000*pi;
H = 100*(1+1j*0.01.*w)./(1+1j*0.02*w)./(1+1j *0.05.*w);
figure();
subplot(1,2,1);
plot(w,abs(H));
xlabel('frequency')
ylabel('magnitude');
subplot(1,2,2);
plot(w,angle(H));
xlabel('frequency')
ylabel('phase(°)');

num = [8*pi^3];
den = [1 4*pi 8*pi^2 8*pi^3];
w = 0:0.1:100;
H = freqs(num,den,w);
mag = abs(H);
phase = angle(H)*180/pi;
subplot(1,2,1);
plot(w/(2*pi),mag);
xlabel('frequency(Hz)')
ylabel('magnitude');
subplot(1,2,2);
plot(w/(2*pi),phase);
xlabel('frequency(Hz)')
ylabel('phase(°)');

