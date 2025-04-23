clc
close all
clear

x = [1 -1 2 4];
y = [2 6 4 0 8 5 12];
h = deconv(y,x);
disp(h);

t =-10:0.01:10;
x1 = cos(2.*t);
h = exp(-1.*abs(t));
y = conv(x1,h);
figure();
plot(y);
xlabel('time(us)')
ylabel('y');

t = 0:0.1:10;
den = [1 5 6];%构建系统函数
num = [1 1];
sys = tf(num,den);
y = impulse(sys,t);
figure();
plot(t,y);
xlabel('time(s)')
ylabel('y');