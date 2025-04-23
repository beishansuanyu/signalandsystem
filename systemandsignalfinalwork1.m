clc
close all
clear

t1 = 0:0.01:1;
y1 = 2.*t1;

t2 =  1:0.01:3;
y2 = 0.5.*(t2.*t2-4.*t2+3);

y = [y1 y2];
t = [t1 t2];
plot(t,y)

axis([0,3,-1,2])


t = 0 : 1:100;
x = 10.*(0.7).^t;
y = 10.*(1.2).^t;
subplot(1,2,1);
stem (t,x,"filled");
subplot(1,2,2);
stem (t,y,"filled");


t = 0:0.01:10;
x = cos(3*pi.*t);
plot(t,x);
xlabel('时间（ms）');
ylabel('幅度');