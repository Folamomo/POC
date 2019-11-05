clearvars;
close all;
clc;

img = imread("plansza.bmp");

%%

img_avg = uint8(conv2(img, fspecial('average'), 'same'));

figure();
subplot(1, 3, 1);
imshow(img);
subplot(1, 3, 2);
imshow(img_avg);
subplot(1, 3, 3);
imshow(imabsdiff(img, img_avg),[]);

%%

figure();
subplot(2, 3, 1);
imshow(img);
subplot(2, 3, 2);
imshow(uint8(conv2(img, fspecial('average', 3), 'same')));
subplot(2, 3, 3);
imshow(uint8(conv2(img, fspecial('average', 5), 'same')));
subplot(2, 3, 4);
imshow(uint8(conv2(img, fspecial('average', 9), 'same')));
subplot(2, 3, 5);
imshow(uint8(conv2(img, fspecial('average', 15), 'same')));
subplot(2, 3, 6);
imshow(uint8(conv2(img, fspecial('average', 35), 'same')));

%% To samo co wyżej tyko z Lenną
figure();
img2 = imread("lena.bmp");
figure();
subplot(2, 3, 1);
imshow(img2);
subplot(2, 3, 2);
imshow(uint8(conv2(img2, fspecial('average', 3), 'same')));
subplot(2, 3, 3);
imshow(uint8(conv2(img2, fspecial('average', 5), 'same')));
subplot(2, 3, 4);
imshow(uint8(conv2(img2, fspecial('average', 9), 'same')));
subplot(2, 3, 5);
imshow(uint8(conv2(img2, fspecial('average', 15), 'same')));
subplot(2, 3, 6);
imshow(uint8(conv2(img2, fspecial('average', 35), 'same')));

%%

M = [1 2 1; 2 4 2; 1 2 1];

M = M/sum(sum(M));

img_mask = uint8(conv2(img, M, 'same'));

figure();
subplot(1, 3, 1);
imshow(img);
subplot(1, 3, 2);
imshow(img_mask);
subplot(1, 3, 3);
imshow(imabsdiff(img, img_mask),[]);

%%


g03 = fspecial('gaussian', 5, 0.3);
g05 = fspecial('gaussian', 5, 0.5);
g07 = fspecial('gaussian', 5, 0.7);
g1 = fspecial('gaussian', 5, 1);

figure();
subplot(1, 4, 1)
mesh(g03);
subplot(1, 4, 2)
mesh(g05);
subplot(1, 4, 3)
mesh(g07);
subplot(1, 4, 4)
mesh(g1);

%%

figure();
subplot(2, 3, 1);
imshow(img);
subplot(2, 3, 2);
imshow(uint8(conv2(img, g03, 'same')));
subplot(2, 3, 3);
imshow(uint8(conv2(img, g05, 'same')));
subplot(2, 3, 4);
imshow(uint8(conv2(img, g07, 'same')));
subplot(2, 3, 5);
imshow(uint8(conv2(img, g1, 'same')));


