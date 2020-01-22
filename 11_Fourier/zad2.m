clearvars;
close all;
clc;

%%
image = imread('lena.bmp');

image2 = fft2(image);

A = abs(image2);
A = log10(A + 1);
F = angle(image2.*(A>0.0001));

image3 = fftshift(image2);

A2 = abs(image3);
A2 = log10(A2 + 1);
F2 = angle(image3.*(A2>0.0001));

figure;
subplot(2,4,1); imshow(image); title('orginalny');
subplot(2,4,2); imshow(image2); title('po fft2');
subplot(2,4,3); imshow(A,[]); title ('amplituda');
subplot(2,4,4); imshow(F,[]); title('faza');
subplot(2,4,6); imshow(image3); title('po fftshift');
subplot(2,4,7); imshow(A2,[]); title('amplituda');
subplot(2,4,8); imshow(F2,[]); title ('faza');

%%
[f1, f2] = freqspace(512, 'mesgrid');
Hd = ones (512);
r = sqrt(f1.^2 + f2.^2);
Hd(r > 0.1) = 0;

figure;
colormap(jet(64)); mesh(f1,f2,Hd);

%%

filtredImage = image3.*Hd;

figure
imshow(filtredImage);
%%
nImage = ifft2(ifftshift(filtredImage));

figure;
imshow(nImage, []);
%%
h = fwind1(Hd, hanning(21));
[H, f1, f2] = freqz2(h, 512, 512);
figure;
mesh(f1, f2, H);

%%

filtredImage = image3.*H;

figure
imshow(filtredImage);
%%
nImage = ifft2(ifftshift(filtredImage));

figure;
imshow(nImage, []);
%%
[width, height] = size(image);

mask = fspecial('gaussian', height, 20);
grayMask = mat2gray(mask);

filtredImage = image3.*grayMask;

figure;
imshow(filtredImage);

nImage = uint8(ifft2(ifftshift(filtredImage)));

figure;
imshow(nImage);
