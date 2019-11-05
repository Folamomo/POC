clearvars;
close all;
clc;

% img = imread("rice.png");

img = imread("katalog.bmp");

figure();
imshow(img);
figure();
imhist(img);

%%

img_bw = img;
window_size = 12;
[X, Y, ~] = size(img);

size = 16;
W2 = size/2;
level = 123;
for i = 1:X
    for j = 1:Y
        m = meanLT(i,j,W2,img,X,Y);
        if(img(i,j)<m)
            imgBW(i,j) = 0;
        else
            imgBW(i,j) = 255;
        end
    end
end
 
figure(1);
subplot(1,3,1);
imshow(img);
title('Oryginal');
 
subplot(1,3,2);
imshow(imgBW);
title('Binaryzacja lokalna');
 
R=128;
k=0.15;
imgBW = img;
 
for i = 1:X
    for j = 1:Y
        m = meanLT(i,j,W2,img,X,Y);
        s = stddevLT(i,j,W2,img,m,X,Y);
        T = m*(1-k*(s/R-1));
        if(img(i,j)<T)
            imgBW(i,j) = 0;
        else
            imgBW(i,j) = 255;
        end
    end
end
 
subplot(1,3,3);
imshow(imgBW);
title('Binearyzacja Sauvoli');