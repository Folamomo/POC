%%
close all;
clearvars;
clc;

image = imread('umbrealla.png');
Img_start = image;

image = double(rgb2hsv(image));
imageH = image(:,:,1);
[Y, X] = size(imageH);

%% zmienne globalne do funkcji
global sTh window_min_size segRes MRes index;
sTh = 0.05;
window_min_size = 8;
segRes = zeros(Y,X);
MRes = zeros(Y,X);
index = 0;


%%
split(imageH,1,1,Y,X);

i = 0;

while i < index
    IB = segRes == i;
    if sum(IB(:)) == 0 
       i = i + 1;
       continue;
    end
    [yF, xF] = find(IB,1,'first');
    IB_dilate = imdilate(IB,strel('square',3));
    IB_diff = imabsdiff(IB_dilate,IB);
    IB_mult = IB_diff.* segRes;
    IB_mult_non_zeros = nonzeros(IB_mult);
    IB_unique = unique(IB_mult_non_zeros);
    joined = 0;
    for k = 1:numel(IB_unique) %Dla każdego sąsiada
        IBS = segRes == IB_unique(k);
        [yFS, xFS] = find(IBS,1,'first');        
        color_difference = abs(MRes(yF,xF) - MRes(yFS, xFS));
        if color_difference < (5/255)
            segRes(IBS) = i;
            joined = 1;
        end
    end
        if joined == 0
            i = i+1;
        end
end

%%przerabioanie do wyświetlenia
segRes_unique = unique(segRes);
for i = 1:numel(segRes_unique)
    obszar = segRes == segRes_unique(i);
    if sum(obszar) < 10
        segRes(obszar) = 0;
    end
end

segRes_unique_2 = unique(segRes);
for i = 1:numel(segRes_unique_2)
    obszar = segRes == segRes_unique_2(i);
    segRes(obszar) = i;
end

Img_final = label2rgb(segRes);

subplot(1,2,1); imshow(Img_start)
subplot(1,2,2); imshow(Img_final,[]);


function split(I,yS,xS,yE,xE)
    global sTh window_min_size segRes MRes index;

    windowH = I(yS:yE,xS:xE);
    Hmean = mean(windowH(:));
    Hstd = std(windowH(:));
    
    if (yE-yS <= window_min_size) || (xE-xS <= window_min_size) || (Hstd < sTh) 
        segRes(yS:yE,xS:xE) = index;
        index = index + 1;
        MRes(yS:yE,xS:xE) = Hmean;
    else
        xMid = xS + floor((xE-xS) / 2);
        yMid = yS + floor((yE-yS) / 2);
        %Lewy górny
        split(I,yS,xS,yMid,xMid);
        %Prawy górny
        split(I,yS,xMid,yMid,xE);
        %Lewy dolny
        split(I,yMid+1,xS,yE,xMid);
        %Prawy dolny
        split(I,yMid+1,xMid+1,yE,xE);
    end
        
end