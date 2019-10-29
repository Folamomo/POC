clearvars;
close all;
clc;

bart = imread("bart.bmp");
figure();
imshow(bart);
figure();
imhist(bart);

%%

obrazBW = bart > 190 & bart < 210;

imshow(obrazBW);