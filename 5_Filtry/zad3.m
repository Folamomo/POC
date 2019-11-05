clearvars;
close all;
clc;

moon = imread("moon.bmp");

M = [0 1 0; 1 -4 1; 0 1 0];

M = M/9;

moon_lap = conv2(moon, M, 'same');

%%

moon_norm1 = moon_lap + 128;
moon_norm2 = abs(moon_lap);

%% Nie dokończone

figure();
subplot(4, 2, 1);
imshow(moon);
subplot(4, 2, 2);
imshow(moon);
subplot(4, 2, 3);
imshow(moon_norm1, []);
subplot(4, 2, 4);
imshow(moon_norm2, []);
subplot(4, 2, 5);
imshow(moon_norm1, []);
subplot(4, 2, 6);
imshow(moon_norm2, []);
subplot(4, 2, 7);
imshow(moon-uint8(moon_norm1), []);
subplot(4, 2, 8);
imshow(imadd(moon, uint8(moon_norm2)), []);