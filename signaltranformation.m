clear
close
clc
pkg load communications;
t = linspace(-5*pi,5*pi,1000);
x = 10*cos(t);
x1 =awgn(x,-10);
plot (t,x1);


##s = fft(x
#heheda

