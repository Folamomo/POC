clearvars;
clear all;
clc;

image = imread('ccl1.png');

[Y,X] = size(image);
L = 1;
nImage = zeros(Y,X);

%Indeksy [1..100] do dalszej cześci zadania
id = zeros(100);
for I = 1:100
    id(I) = I;
end


for J = 2:Y-1
    for I = 2:X-1
        if(image(J,I) ~= 0)
            sasiedzi = [nImage(J-1,I-1),nImage(J-1,I),nImage(J-1,I+1),nImage(J,I-1)];

            if sum(sasiedzi) == 0 
                nImage(J,I) = L;
                L = L+1;
            else
                sasiedzi1 = nonzeros(sasiedzi);
                minimum = min(sasiedzi1);
                maximum = max(sasiedzi1);

                if(minimum == maximum)
                    nImage(J,I) = maximum;
                else
                    id = union(minimum,maximum,id);
                    nImage(J,I) = minimum;
                end
            end 
        end
     end
end

figure(1);
subplot(2,2,1); imshow(image); title('ccl1');
subplot(2,2,2); imshow(label2rgb(nImage),[]); title('result');

target = imread('ccl1Result.png');
subplot(2,2,3); imshow(target); title('target');

%Laczenie indeksow
lut = zeros(100);
for I = 1:100
   lut(I) = root(id(I),id); 
end

nImage2 = zeros(Y, X);

for J = 1:Y
    for I = 1:X
        if nImage(J,I) ~= 0
           nImage2(J,I) = lut(nImage(J,I)); 
        end
    end
end


subplot(2,2,4); imshow(label2rgb(nImage2),[]); title('resultLUT');




function root_indeks = root(indeks,tablica)
    root_indeks = indeks;
    while tablica(root_indeks) ~= root_indeks
        root_indeks = tablica(root_indeks);
    end
end


function nTablica = union(indeksP,indeksQ,tablica)
    nTablica = tablica;
    nTablica(root(indeksP,tablica)) = root(indeksQ,tablica);
end