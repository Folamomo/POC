%czyścimy zmienne
clearvars;
clear all;
clc;

image = imread('lena.bmp');
fImage = fft2(image);
ffImage = fftshift(fImage);
A = abs(ffImage);
ampl = log10(A + 1);
phaze = angle(ffImage.*(A>0.0001));

figure(1)
subplot(1,3,1); imshow(image); title('oryginal');
subplot(1,3,2); imshow(ampl,[]); title('amplituda');
subplot(1,3,3); imshow(phaze,[]); title('faza');

[f1,f2] = freqspace(512,'meshgrif');
Hd = ones(512);
r = sqrt(f1.^2 + f2.^2);
Hd((r>0.1)) = 0;
%Hd((r<0.7)) = 0;
%Hd((r<0.1) | (r>0.7) ) = 0;
figure(2);
colormap(jet(64)); mesh(f1,f2,Hd);

imageFiltr = ffImage.*Hd;

nImage = ifft2(ifftshift(imageFiltr));

figure(3);
imshow(nImage,[]);

h = fwind1(Hd,hanning(21));
[H f1 f2] = freqz2(h,512,512);

figure(4);
mesh(f1,f2,H);

imageFiltr2 = ffImage.*H;

nnImage = ifft2(ifftshift(imageFiltr2));

figure(5);
imshow(nnImage,[]);
