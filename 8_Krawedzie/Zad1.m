clearvars;
clear all;
clc;

%%

image = imread('dom.png');
krawedzie = edge(image,'log');
krawedzieRecznie = edge(image,'log',28,0.08);

figure();
subplot(1,3,1); imshow(image); title('oryginal');
subplot(1,3,2); imshow(krawedzie); title('detekcja LoG');
subplot(1,3,3); imshow(krawedzieRecznie); title('detekcja LoG z recznymi parametrami');

%%

tresh = [0.1 0.2];
sigma = 0.07;
krawedzie = edge(image,'Canny');
krawedzieRecznie = edge(image,'canny',tresh,sigma);

figure();
subplot(1,3,1); imshow(image);              title('oryginal');
subplot(1,3,2); imshow(krawedzie);          title('detekcja Canny');
subplot(1,3,3); imshow(krawedzieRecznie);   title('detekcja Canny z recznymi parametrami');


%%
figure();
imageEdgeLoG = edge(image,'log');

imageEdgeSobel = edge(image,'Sobel');

imageEdgeCanny = edge(image,'canny');


tresh1 = 0.26;
sigma1 = 0.8;
imageEdgeLoG1 = edge(image,'log',tresh1,sigma1);

tresh2 = 0.155;
imageEdgeSobel1 = edge(image,'Sobel',tresh2);

tresh3 = 0.4;
sigma3 = 0.7;
imageEdgeCanny1 = edge(image,'canny',tresh3,sigma3);

figure(4);
subplot(2,3,1); imshow(imageEdgeLoG);          title('LoG');
subplot(2,3,2); imshow(imageEdgeSobel);        title('Sobel');
subplot(2,3,3); imshow(imageEdgeCanny);        title('Canny');
subplot(2,3,4); imshow(imageEdgeLoG1);         title('LoG1');
subplot(2,3,5); imshow(imageEdgeSobel1);       title('Sobel1');
subplot(2,3,6); imshow(imageEdgeCanny1);       title('Canny1');
