clearvars;
close all;
clc;

%%

Img = imread('lunar.bmp');

Img_fft2 = fft(Img);
Img_fftshift = fftshift(Img_fft2);

A = abs(Img_fftshift);
ampl = log10(A + 1);
phase = angle(Img_fftshift.*(A>0.0001));

figure(1);
subplot(1, 4, 1);
imshow(Img);
title('original');

subplot(1, 4, 2);
imshow(Img_fftshift);
title('fftshift');

subplot(1, 4, 3);
imshow(ampl, []);
title('amplitude');

subplot(1, 4, 4);
imshow(phase, []);
title('phase');

%%

Img_fft2 = fft(Img);
Fft2abs = log10(abs(Img_fft2)+1);
Img_fft2(Fft2abs > 50) = 0;

figure;

subplot(1, 2, 1);
imshow(Img);
title('original');

subplot(1, 2, 2);
imshow(uint8(ifft(ifftshift(Img_fft2))), []);
title('filtrated');