clearvars;
clear all;
clc;

image = imread('shapes.png');
srcImage = image;

image = bwlabel(image,4);

wsp = obliczWspolczynniki(image);
[Y,X] = size(image);

for J = 1:Y
    for I = 1:X
        piksel = image(J,I);
        if piksel ~= 0 && ~(wsp(piksel,2) > 0.33 && wsp(piksel,2) < 0.66)
            image(J,I) = 0;
        end
    end
end

figure(1);
subplot(1,2,1); imshow(srcImage,[]); title('dane');
subplot(1,2,2); imshow(image,[]); title('krzyzyki');

%%
image = imread('shapesReal.png');

imageSrc = image;

IBW = im2bw(image,0.22);
IC = imcomplement(IBW);
element_str = strel('rectangle',[5 5]);
Ierode = imerode(IC,element_str);

image = Ierode;

figure(2);
subplot(1,2,1); imshow(imageSrc);
subplot(1,2,2); 


imageBW = bwlabel(image,4);

wsp = obliczWspolczynniki(imageBW);
[Y,X] = size(imageBW);

for J = 1:Y
    for I = 1:X
        piksel = imageBW(J,I);
        if piksel ~= 0 && ~(wsp(piksel,2) > 0.50 && wsp(piksel,2) < 0.66)
            imageBW(J,I) = 0;
        end
    end
end

figure(2);
subplot(1,3,1); imshow(imageSrc,[]); title('dane');
subplot(1,3,2); imshow(image); title('eroded');
subplot(1,3,3); imshow(imageBW,[]); title('krzyzyki');