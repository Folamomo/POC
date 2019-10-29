clearvars;
close all;
clc;

kolo = boolean(imread("kolo.bmp"));
lena = boolean(imread("kwadrat.bmp"));

figure();
title('not');
imshow(~kolo,[]);
figure();
title('and');
imshow(kolo&lena,[]);

figure();
imshow(kolo|lena,[]);
title('or');
figure();
imshow(xor(kolo, lena),[]);
title('xor');

