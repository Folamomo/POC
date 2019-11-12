clearvars;
close all;
clc;
%%

img = imread("jet.bmp");
load('maskiPP.mat');
%%
show_1(img, R1, 'same', 'R1');
show_1(img, R2, 'same', 'R2');
show_1(img, P1, 'same', 'P1');
show_1(img, P2, 'same', 'P2');
show_1(img, S1, 'same', 'S1');
show_1(img, S2, 'same', 'S2');
%%

OW1 = sqrt(conv2(img, S1, 'same').^2 + conv2(img, S2, 'same').^2);
OW2 = abs(conv2(img, S1, 'same')) + abs(conv2(img, S2, 'same'));
subplot(4, 2, 1:2), imshow(img), title('original');
subplot(4, 2, 3), imshow(OW1 , []), title('squareroot of squares');
subplot(4, 2, 4), imshow(OW2 , []), title('sum of absolute values');
subplot(4, 2, 5), imshow(img - uint8(OW1) + 128 , []), title('img - OW1 + 128');
subplot(4, 2, 6), imshow(img - uint8(OW2) + 128, []), title('img - OW2 + 128');
subplot(4, 2, 7), imshow(abs(img - uint8(OW1)) , []), title('abs(img - OW1)');
subplot(4, 2, 8), imshow(abs(img - uint8(OW2)) , []), title('abs(img - OW2)');


%%
function show_1(img, mask, size, title_)
    figure(), title(title_);
    img_after_mapping = conv2(img, mask, size);
    norm1 = img_after_mapping + 128;
    norm2 = abs(img_after_mapping);

    subplot(3, 2, 1:2);
    imshow(img);
    subplot(3, 2, 3);
    imshow(norm1, []);
    subplot(3, 2, 4);
    imshow(norm2, []);
    subplot(3, 2, 5);
    imshow(uint8(double(img) + norm1));
    subplot(3, 2, 6);
    imshow(uint8(double(img) + norm2));
end
