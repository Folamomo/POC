clearvars;
close all;
clc;

img = imread("./lena.bmp");
img2 = imresize(img, 0.5);
img3 = imresize(img, 0.25);
img4 = imresize(img, 0.125);

figure();
imshow(img2, 'InitialMagnification', 200);
figure();
imshow(img3, 'InitialMagnification', 400);
figure();
imshow(img4, 'InitialMagnification', 800);

%%

res = [31 15 7 3 1];

for i = res
   figure();
   imshow(imadjust(img3, [0, 1], [0, i/255]), []);
end
