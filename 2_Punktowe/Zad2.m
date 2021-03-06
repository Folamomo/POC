clearvars;
close all;
clc;

img = imread("jet.bmp");
img2 = imread("lena.bmp");



figure();
imshow(img);

figure();
imshow(img2);

img_16 = uint16(img);
img2_16 = uint16(img2);

%%
%%dodawanie
figure();
imshow(imadd(img_16, img2_16),[]);

%%
%%kombinacja liniowa
figure();
imshow(imlincomb(1, img_16, 1, img2_16),[]);
figure();
imshow(imlincomb(1, img_16, -1, img2_16),[]);
figure();
imshow(imlincomb(2, img_16, 4, img2_16),[]);

%%
%%odejmowanie
figure();
imshow(imsubtract(img_16, img2_16),[]);
figure();
imshow(imabsdiff(img_16, img2_16),[]);

%%
%%mnożenie
figure();
imshow(immultiply(img_16, img2_16),[]);
figure();
imshow(immultiply(img, 0.5));
figure();
maska = boolean(imread("kolo.bmp"));
imshow(immultiply(img, maska));
%%
%%negatyw
figure();
imshow(imcomplement(img));