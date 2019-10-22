clearvars;
close all;
clc;

lena = imread("jezioro.jpg");
figure();
imshow(lena);
%%
R = lena(:,:,1);
G = lena(:,:,2);
B = lena(:,:,3);

%%
figure();
subplot(1, 3, 1);
imhist(R);
subplot(1, 3, 2);
imhist(G);
subplot(1, 3, 3);
imhist(B);

%%

R = histeq(R, 256);
G = histeq(G, 256);
B = histeq(B, 256);

oeq = lena;
oeq(:,:,1) = R;
oeq(:,:,2) = G;
oeq(:,:,3) = B;
figure();
imshow(oeq);

%%

lena2 = rgb2hsv(lena);

H = lena2(:,:,1);
S = lena2(:,:,2);
V = lena2(:,:,3);

%%
figure();
subplot(1, 3, 1);
imhist(H);
subplot(1, 3, 2);
imhist(S);
subplot(1, 3, 3);
imhist(V);
%%
V = histeq(V, 256);

oeq2 = lena2;
oeq2(:,:,3) = V;

lena2eq = hsv2rgb(oeq2);
figure();
imshow(lena2eq);
