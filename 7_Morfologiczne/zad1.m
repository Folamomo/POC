image = imread('ertka.bmp');

SEs = [strel('square',3), strel('square',5), strel('diamond',3), strel('octagon', 3)];

for SE = SEs
    imageEroded1 = imerode(image,SE);
    imageEroded2 = imerode(imageEroded1,SE);
    imageEroded3 = imerode(imageEroded2,SE);

    figure();
    subplot(1,4,1); imshow(image);          title('oryginał');
    subplot(1,4,2); imshow(imageEroded1);    title('erozja');
    subplot(1,4,3); imshow(imageEroded2);    title('2x erozja');
    subplot(1,4,4); imshow(imageEroded3);    title('3x erozja');
end
%% usuwa wlosy lewoskosne
image2 = imread('buzka.bmp');
SE2 = strel('arbitrary',[0 0 1;0 1 0;1 0 0]);
image2Eroded = imerode(image2,SE2);

figure();
subplot(1,2,1); imshow(image2);          title('oryginał');
subplot(1,2,2); imshow(image2Eroded);    title('erozja');

%% dylatacja
image = imread('ertka.bmp');

SE = strel('square',3);

imageDilatated1 = imdilate(image,SE);
imageDilatated2 = imdilate(imageDilatated1,SE);
imageDilatated3 = imdilate(imageDilatated2,SE);

figure();
subplot(1,4,1); imshow(image);              title('oryginał');
subplot(1,4,2); imshow(imageDilatated1);    title('dylatacja');
subplot(1,4,3); imshow(imageDilatated2);    title('2x dylatacja');
subplot(1,4,4); imshow(imageDilatated3);    title('3x edylatacja');

%% Rozne przeksztalcenia
image = imread('ertka.bmp');
%image = imread('wyspa.bmp');
%image = imread('kolka.bmp');

SE = strel('square',3);
%SE = strel('square',5);
%SE = strel('diamond',3); 
%SE = strel('octagon', 3);

figure();
subplot(1,5,1); imshow(image);                  title('oryginał');
subplot(1,5,2); imshow(imerode(image,SE));      title('erozja');
subplot(1,5,3); imshow(imdilate(image,SE));     title('dylatacja');
subplot(1,5,4); imshow(imopen(image,SE));       title('otwarcie');
subplot(1,5,5); imshow(imclose(image,SE));      title('zamknięcie');

%% Czyszczenie
image = imread('ertka.bmp');

SE = strel('square',3);
image = imopen(image,SE);
image = imclose(image,SE);

figure(5);
imshow(image);

%% HitMiss
image = imread('hom.bmp');

SE1 = [0 1 0; 1 1 1; 0 1 0];
SE2 = [1 0 1; 0 0 0; 1 0 1];

figure(6);
subplot(1,2,1); imshow(image);                           title('oryginał');
subplot(1,2,2); imshow(bwhitmiss(image,SE1,SE2));        title('trafi, nie trafi');
