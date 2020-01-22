%% 
clearvars;
close all;
clc


%%

obraz = imread('mglawica_kolor.png');
load tablice_kwantyzacji.mat;

YCBCR = rgb2ycbcr(obraz);

c = 12;
redukcjaY = @(x) round(x ./ (c*Qy));
redukcjaC = @(x) round(x ./ (c*Qc));

Y3 = blkproc(YCBCR(:,:,1), [8 8], @dct2);
CB3 = blkproc(YCBCR(:,:,2), [8 8], @dct2);
CR3 = blkproc(YCBCR(:,:,3), [8 8], @dct2);

Y3 = blkproc(Y3, [8 8], redukcjaY);
Cb3 = blkproc(CB3, [8 8], redukcjaC);
Cr3 = blkproc(CR3, [8 8], redukcjaC);

%%

load tablice_kwantyzacji.mat;

dekwantyzacjaY = @(x) x .* (c*Qy);
dekwantyzacjaC = @(x) x .* (c*Qc);

Y3d = blkproc(Y3, [8 8], dekwantyzacjaY);
Cb3d = blkproc(Cb3, [8 8], dekwantyzacjaC);
Cr3d = blkproc(Cr3, [8 8], dekwantyzacjaC);

YCBCR3(:,:,1) = blkproc(Y3d, [8 8], @idct2);
YCBCR3(:,:,2) = blkproc(Cb3d, [8 8], @idct2);
YCBCR3(:,:,3) = blkproc(Cr3d, [8 8], @idct2);

rgb = ycbcr2rgb(uint8(YCBCR3));


figure();
subplot(1,2,1); imshow(obraz);
subplot(1,2,2); imshow(uint8(rgb));

