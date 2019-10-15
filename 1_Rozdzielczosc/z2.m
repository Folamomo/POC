  
clearvars;
close all;
clc;

I = imread("./parrot.bmp");
xReScale = 10;
yReScale = 10;

[YY,XX] = size(I);
nYY = round(YY * yReScale);
nXX = round(XX * xReScale);

nI = uint8(zeros(nYY, nXX));

for y = 0 : nYY - 1
   for x = 0 : nXX - 1
       Ay = floor(y/yReScale);
       if Ay > YY - 2
           Ay = YY -2;
       end
       Ax = floor(x/xReScale);
       if Ax > XX - 2
           Ax = XX -2;
       end
       A = I(Ay + 1, Ax + 1);
       B = I(Ay + 1, Ax + 2);
       C = I(Ay + 2, Ax + 2);
       D = I(Ay + 2, Ax + 1);
       i = x/xReScale - Ax;
       j = y/yReScale - Ay;
       nI(y + 1, x + 1 )= A * (1-i)*(1-j) + B*i*(1-j) + C*i*j + D*(1-i)*j;
   end
end

figure;
imshow(I);
figure;
imshow(nI);