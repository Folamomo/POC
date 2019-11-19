clearvars;
clear all;
clc;
%%Scienianie
image = imread('fingerprint.bmp');

image2 = bwmorph(image,'thin');
image3 = bwmorph(image2,'thin');
imageInf = bwmorph(image,'thin',Inf);

figure();
subplot(1,4,1); imshow(image);      title('oryginał');
subplot(1,4,2); imshow(image2);     title('1x bwmorph thin');
subplot(1,4,3); imshow(image3);     title('2x bwmorph thin');
subplot(1,4,4); imshow(imageInf);   title('Inf bwmorph thin');

%% Szkieletyzacja
image = imread('kosc.bmp');

image2 = bwmorph(image,'skel');
image3 = bwmorph(image2,'skel');
imageInf = bwmorph(image,'skel',Inf);

figure();
subplot(1,4,1); imshow(image);     title('oryginał');
subplot(1,4,2); imshow(image2);    title('1x bwmorph skel');
subplot(1,4,3); imshow(image3);    title('2x bwmorph skel');
subplot(1,4,4); imshow(imageInf);  title('Inf bwmorph skel');

%% Rekonstrukcja
image = imread('text.bmp');

SE = ones(51,1);

image2 = imopen(image,SE);
image3 = imreconstruct(imerode(image,SE),image);

figure();
subplot(1,3,1); imshow(image);     title('oryginał');
subplot(1,3,2); imshow(image2);    title('imopen');
subplot(1,3,3); imshow(image3);    title('imreconstruct');

%% Dziury
image = imread('text.bmp');

figure();
subplot(1,2,1); imshow(image);                    title('oryginał');
subplot(1,2,2); imshow(imfill(image,'holes'));    title('imfill holes');
%% Brzeg
image = imread('text.bmp');

figure();
subplot(1,2,1); imshow(image);                    title('oryginał');
subplot(1,2,2); imshow(imclearborder(image));    title('imclearborder');
