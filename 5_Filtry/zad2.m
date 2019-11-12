clearvars;
close all;
clc;

szum = imread("lenaSzum.bmp");

img_med = uint8(medfilt2(szum));

%%

figure();
subplot(1, 3, 1);
imshow(szum);
subplot(1, 3, 2);
imshow(img_med);
subplot(1, 3, 3);
imshow(imabsdiff(szum, img_med),[]);

%%

lena = imread("lena.bmp");

%%

lena_avg = uint8(conv2(lena, fspecial('average'), 'same'));

figure();
subplot(1, 3, 1);
imshow(lena);
subplot(1, 3, 2);
imshow(lena_avg);
subplot(1, 3, 3);
imshow(imabsdiff(lena, lena_avg),[]);

%%

lena_med = uint8(medfilt2(lena));

figure();
subplot(1, 3, 1);
imshow(lena);
subplot(1, 3, 2);
imshow(lena_med);
subplot(1, 3, 3);
imshow(imabsdiff(lena, lena_med),[]);

%%

lena_10med = lena;
for i= 0:10
    lena_10med = medfilt2(lena_10med, [5 5]);
end

%% 

figure();
subplot(1, 3, 1);
imshow(lena);
subplot(1, 3, 2);
imshow(lena_10med);
subplot(1, 3, 3);
imshow(imabsdiff(lena, lena_10med),[]);


