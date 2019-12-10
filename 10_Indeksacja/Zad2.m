clearvars;
clear all;
clc;

image = imread('ccl2.png');
nImage4 = bwlabel(image,4);
nImage8 = bwlabel(image,8);

figure();
subplot(1,3,1); imshow(image,[]); title('oryginal');
subplot(1,3,2); imshow(nImage4,[]); title('bwlabel 4');
subplot(1,3,3); imshow(nImage8,[]); title('bwlabel 8');