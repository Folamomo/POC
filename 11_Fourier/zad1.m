clearvars;
close all;
clc;

%%

image = imread('dwieFale.bmp');
%image = imread('kolo.bmp');
%image = imread('kwadrat.bmp');
%image = imread('kwadrat45.bmp');
%image = imread('trojkat.bmp');


image2 = fft2(image);


%%

A = abs(image2);
A = log10(A + 1);
F = angle(image2.*(A>0.0001));

figure;
subplot(1,4,1); imshow(image); title('orginalny');
subplot(1,4,2); imshow(image2); title('po fft1');
subplot(1,4,3); imshow(A,[]); title ('amplituda');
subplot(1,4,4); imshow(F,[]); title('faza');

%%

image3 = fftshift(image2);

A2 = abs(image3);
A2 = log10(A2 + 1);
F2 = angle(image3.*(A2>0.0001));

figure;
subplot(2,4,1); imshow(image); title('orginalny');
subplot(2,4,2); imshow(image2); title('po fft1');
subplot(2,4,3); imshow(A,[]); title ('amplituda');
subplot(2,4,4); imshow(F,[]); title('faza');
subplot(2,4,6); imshow(image3); title('po fftshift');
subplot(2,4,7); imshow(A2,[]); title('amplituda');
subplot(2,4,8); imshow(F2,[]); title ('faza');


%%
pimage2 = ifftshift(image3);
pimage = ifft2(pimage2);

figure;
subplot(1,2,1); imshow(pimage, []); title('odwrócony Fourier');
subplot(1,2,2); imshow(image); title('orginal');

