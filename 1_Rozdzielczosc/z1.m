clearvars;
close all;
clc;

I = imread("./chessboard.bmp");
xReScale = 100;
yReScale = 100;

[YY,XX] = size(I);
nYY = floor((YY-1) * yReScale);
nXX = floor((XX-1) * xReScale);

nI = uint8(zeros(nYY, nXX));

for y = 1 : nYY + 1
   for x = 1 : nXX + 1
       oy = round((y-1)/yReScale)+1;
       ox = round((x-1)/xReScale)+1;
       nI(y, x) = I(oy, ox);
   end
end

figure;
imshow(I);
figure;
imshow(nI);
