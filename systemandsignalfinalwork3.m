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

t =0:0.1:100;
x = 10*exp(-2.*t)*4.*t.*heaviside(t);


X = fft(x);
mag1 = abs(X)/1000;
mag2 =2.*mag1(1:501);
w = 0:0.1:50;
phase1 = angle(X);

figure();
plot(w/50,mag2);
xlabel('frequency(Π)')
ylabel('magnitude');


syms X1 X2 X3 x1 x2 x3 w;
X1 = exp(j*w)/(1-j*w);
x1 = ifourier(X1);
pretty(x1);
X2 =dirac(w)/(1+2*j*w) ;
x2 = ifourier(X2);
pretty(x2);
X3 =pi*dirac(w)/((2+j*w)*(5+j*w)) ;
x3 = ifourier(X3);
pretty(x3);

t =0:0.001:1;
x1 = cos(100*pi.*t);
x2 = 2*cos(400*pi.*t);
x3 = x1.*x2;
w = 0:pi/500:2*pi;
X1 = fft(x1)/1000;
figure();
subplot(1,2,1);
plot(w,abs(X1));
xlabel('frequency(Π)');
ylabel('magnitude');
title('X1');
subplot(1,2,2);
plot(w,angle(X1));
xlabel('frequency(Π)');
ylabel('phase');
title('X1');

X2 = fft(x2)/1000;
figure();
subplot(1,2,1);
plot(w,abs(X2));
xlabel('frequency(Π)');
ylabel('magnitude');
title('X2');
subplot(1,2,2);
plot(w,angle(X2));
xlabel('frequency(Π)');
ylabel('phase');
title('X2');

X3 = fft(x3)/1000;
figure();
subplot(1,2,1);
plot(w,abs(X3));
xlabel('frequency(Π)');
ylabel('magnitude');
title('X3');
subplot(1,2,2);
plot(w,angle(X3));
xlabel('frequency(Π)');
ylabel('phase');
title('X3');


num = [2,5];
den = [1,5,6];
t = 0:0.1:10;
y1 = impulse(num,den,t);
y2 = step(num,den,t);
figure();
plot(t,y1);
title('冲激响应');
figure();
plot(t,y2);
title('阶跃响应');