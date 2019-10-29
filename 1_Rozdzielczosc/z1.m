clearvars;
close all;
clc;

I = imread("./chessboard.bmp");
xReScale = 2.1;
yReScale = 2.1;

[YY,XX] = size(I);
nYY = round(YY * yReScale);
nXX = round(XX * xReScale);

xStep = XX/nXX;
yStep = YY/nYY;

nI = uint8(zeros(nYY, nXX));

for jj = 0 : nYY-1
   for ii = 0 : nXX-1
        j = round(jj * yStep);
        i = round(ii * xStep);
        if i > XX - 1
            i = XX -1;
        end
        if j > YY - 1
            j = YY -1;
        end
        nI(jj+1, ii+1) = I(j+1, i+1);
   end
end

figure;
imshow(I);
figure;
imshow(nI);
