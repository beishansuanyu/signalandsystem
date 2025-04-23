clc
close all
clear

num = [1,6,10];
den = [1,7,11,5];

[r,p,k] = residue(num,den)

num1 = [1 -2];
den1 = [1 2 10];
num2 = [1 2 5];
den2 = [1 4 13 0];
num3 = [1 10 5];
den3 = [1 4 10 6];

H1 = tf(num1,den1);
H2 = tf(num2,den2);
H3 = tf(num3,den3);
figure();
pzmap(H1,'');
grid on;
title('a图');
figure();
pzmap(H2);
grid on;
title('b图');
figure();
pzmap(H3);
grid on;
title('c图');

num1 = [1 10 0 ];
den1 = [1 70 1000];
num2 = [1 1];
den2 = [1 24.5 61 32];
figure();
bode(num1,den1);
grid on;
title('a图');
figure();
bode(num2,den2);
grid on;
title('b图');