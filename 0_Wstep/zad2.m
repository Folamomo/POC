clearvars;
close all;
clc;


lena = imread("./lena_gray.jpg");
[ind, map] = gray2ind(lena, 256);

figure();
imshow(ind, map);

figure();

imshow(ind);
colormap(winter);