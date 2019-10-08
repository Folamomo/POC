clearvars;
close all;
clc;

lena = imread("./lena.bmp");
imshow(lena);
lena2 = imread("./lena.jpg");
figure();
imshow(lena2);

figure();
lena_gray = rgb2gray(lena);
imshow(lena_gray);


imwrite(lena_gray, "lena_gray.jpg");

figure();
colormap gray;
mesh(lena_gray);

figure(5);
plot(lena(10,:));

figure(6);
plot(lena(:,10));
