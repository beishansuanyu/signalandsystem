clc
close all
clear

pkg load symbolic
pkg load control


syms t v;
x = t*exp(-2*t);
y = laplace(x);
disp(y);
ezplot(y);

syms s ;
V = (10*s*s+4)/(s*(s+1)*(s+2)*(s+2));

v = ilaplace(V)
disp(v);
ezplot(v);

%%求零点极点
num = [1 1];
den = [1 5 6];
sys = tf(num,den);


z = roots(num);
p = roots(den);

figure();

pzmap(sys);
t = 0:0.1:100;
figure();
impulse(sys);
figure();
step(sys);
figure();
bode(sys);


