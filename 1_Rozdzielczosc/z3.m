clearvars;
close all;
clc;

I = imread("./parrot.bmp");
J = imadjust(I, [0, 1], [0, 1/255]);

figure;
imshow(I,[]);
figure;
imshow(J,[]);