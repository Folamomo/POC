clearvars;
close all;
clc;

lena1 = imread("lena1.bmp");
lena2 = imread("lena2.bmp");
lena3 = imread("lena3.bmp");
lena4 = imread("lena4.bmp");


figure();
subplot(2, 4, 1);
imshow(lena1);
subplot(2, 4, 2);
imshow(lena2);
subplot(2, 4, 3);
imshow(lena3);
subplot(2, 4, 4);
imshow(lena4);

subplot(2, 4, 5);
imhist(lena1, 256);
subplot(2, 4, 6);
imhist(lena2, 256);
subplot(2, 4, 7);
imhist(lena3, 256);
subplot(2, 4, 8);
imhist(lena4, 256);

%%
figure();
hist1 = imread("hist1.bmp");
subplot(2, 1, 1);
imshow(hist1);
subplot(2, 1, 2);
imhist(hist1, 256);

%%

hist1_adj = imadjust(hist1);
subplot(2, 1, 1);
imshow(hist1_adj);
subplot(2, 1, 2);
imhist(hist1_adj, 256);
%%
figure();
[H, x] = imhist(hist1);
S = cumsum(H);
S = S*(max(H)/max(S));
plot(x, H, x, S);
%%
figure();
[H, x] = imhist(hist1_adj);
S = cumsum(H);
S = S*(max(H)/max(S));
plot(x, H, x, S);
%%
hist2 = imread("hist2.bmp");
[H, x] = imhist(hist2);
S = cumsum(H);
LUT = uint8(S*(256/max(S)));
hist2_adj = intlut(hist2, LUT);
%%
figure();
[H, x] = imhist(hist2_adj);
S = cumsum(H);
S = S*(max(H)/max(S));
subplot(1, 2, 1);
imshow(hist2_adj);
subplot(1, 2, 2);
plot(x, H, x, S);
%%

rysuj(imread("hist2.bmp"));
rysuj(imread("hist3.bmp"));
rysuj(imread("hist4.bmp"));



function rysuj(hi)
    h_adj = imadjust(hi);
    h_eq = histeq(hi, 256);
    h_adapt = adapthisteq(hi);
    
    figure();
    subplot(2, 2, 1);
    imhist(hi);
    subplot(2, 2, 2);
    imhist(h_adj);
    subplot(2, 2, 3);
    imhist(h_eq);
    subplot(2, 2, 4);
    imhist(h_adapt); 
end


