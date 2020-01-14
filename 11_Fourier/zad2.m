clearvars;
close all;
clc;

%%

Img = imread('lena.bmp');

Img_fft2 = fft2(Img);
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

%% 4
[f1, f2] = freqspace(512, 'meshgrid');
Hd = ones(512);
r = sqrt(f1.^2 + f2.^2);

%Hd(r>0.1) = 0; % maska kola
Hd((r<0.7)) = 0; % filtr górnoprzepustowy

figure(2);
colormap(jet(64));
mesh(f1, f2, Hd);
title('filtr górnoprzepustowy');

%% 5
Img_filtered = Img_fftshift .* Hd;
figure(3);
imshow(ifft2(Img_filtered));
title('przefiltrowany F-obraz');

%% zad 7
h = fwind1(Hd, hanning(21));
[H, f1, f2] = freqz2(h, 512, 512);

figure(4);
mesh(f1, f2, H);
title('okno Hamminga');

%% zad 9 - filtr Gaussa
[X, Y] = size(Img);
mask = fspecial('gaussian', X, 10);
gray = mat2gray(mask);
figure(5);
imshow(gray);
title('mask gray scale');

F = fft2(Img);        % fourier
F = fftshift(F);    % przesuniecie
F = F .* mask;     % maska
F = ifft2(F);       % odwrotny fourier

figure(6);
imshow(F);