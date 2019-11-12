close all; clearvars; clc;
%%

img = imread("moon.bmp");
%%

M = [0 1 0; 1 -4 1; 0 1 0]/9;
show_with_mask(img, M, 'same');
show_with_mask(img, fspecial('laplacian', 0.3), 'same');

%%
function show_with_mask(img, mask, size)
    figure();
    img_after_mapping = conv2(img, mask, size);
    norm1 = uint8(img_after_mapping + 128);
    norm2 = uint8(abs(img_after_mapping));
    
    subplot(3, 2, 1:2);
    imshow(img);
    title('original');
    subplot(3, 2, 3);
    imshow(norm1, []);
    title('+128');
    subplot(3, 2, 4);
    imshow(norm2, []);
    title('abs');
    subplot(3, 2, 5);
    imshow(uint8(img + norm1), []);
    title('original + mask + 128');  
    subplot(3, 2, 6);
    imshow(uint8(img + norm2), []);
    title('original + abs(mask)');  
end
