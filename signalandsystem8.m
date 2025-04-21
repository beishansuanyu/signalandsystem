clc
close all
clear

pkg load symbolic;
pkg load control;
pkg load signal;


num = [1 3];
den = [1 -5 2];
n = 0:1:30;
x = [1*ones(size(n))];
sys = tf(num,den);
y = filter(num,den,x);
plot(n,y);
xlabel('Sample number n');
ylabel('step responce y(n)');



num = [6 4];
den = [1 -3.5 3];

[r,p,k] = residuez(num,den)

syms x X n z
x = n*heaviside(n);
X = ztrans(x)
