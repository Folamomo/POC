clearvars;
close all;
clc;

%%

Img = imread('dwieFale.bmp');

Img_fft2 = fft2(Img);
Img_fftshift = fftshift(Img_fft2);

figure;
subplot(1, 3, 1);
imshow(Img);
subplot(1, 3, 2);
imshow(Img_fft2);
subplot(1, 3, 3);
imshow(Img_fftshift);

A = abs(Img_fftshift);
ampl = log10(A + 1);
phase = angle(Img_fftshift.*(A>0.0001));

figure;
subplot(1, 3, 1);
imshow(Img_fftshift);
title('fftshift');

subplot(1, 3, 2);
imshow(ampl, []);
title('amplitude');

subplot(1, 3, 3);
imshow(phase, []);
title('phase');

%%

Img_fft2 = fft2(Img);
Img_fftshift = fftshift(Img_fft2);

ifImage = ifftshift(Img_fftshift);
nImage = ifft2(ifImage);

figure;
subplot(1, 3, 1);
imshow(Img);
title('before');
subplot(1, 3, 2);
imshow(uint8(nImage));
title('after');
subplot(1, 3, 3);
imshow(imabsdiff(Img,uint8(nImage)),[]);
title('diff');