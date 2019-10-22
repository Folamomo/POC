clearvars;
close all;
clc;

phobos = imread("phobos.bmp");

figure();
imshow(phobos);
%%
eq = histeq(phobos);

figure();
imshow(eq);
%%
load("histogramZadany");

eq2 = histeq(phobos, histogramZadany);

figure();
imshow(eq2);

%%

eq3 = imadjust(phobos);
figure();
imshow(eq3);

%%

eq4 = adapthisteq(phobos);
figure();
imshow(eq4);