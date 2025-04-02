clear
close
clc

pkg load symbolic;
num = [1 1];
den = [1 6 8];

sys = tf(num,den);
##bode(sys);
t = 0:0.1:5;
y = step(sys, t);
plot(t,y);
