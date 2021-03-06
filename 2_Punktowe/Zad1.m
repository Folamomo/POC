clearvars;
close all;
clc;

load ("funkcjeLUT");
figure();
plot(kwadratowa);

figure();
img = imread("lena.bmp");
przekodowania = [kwadratowa, log, odwlog, odwrotna, pierwiastkowa, pila, wykladnicza];
imshow(img);

figure();
img2 = intlut(img, kwadratowa);
imshow(img2);

%%

LUT(img, kwadratowa);
LUT(img, log);
LUT(img, odwlog);
LUT(img, odwrotna);
LUT(img, pierwiastkowa);
LUT(img, pila);
LUT(img, wykladnicza);


function LUT(obraz, przekodowanie)
   figure();
   subplot(2, 2, 1:2);
   plot(przekodowanie);
   daspect([1 2 1]);
   title('wykres');
   subplot(2, 2, 3);
   imshow(obraz);
   title('przed');
   subplot(2, 2, 4);
   imshow(intlut(obraz, przekodowanie));
   title('po');
end