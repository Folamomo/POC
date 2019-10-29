clearvars;
close all;
clc;

coins = imread("coins.png");
figure();
subplot(1, 2, 1);
imshow(coins);
subplot(1, 2, 2);
imhist(coins);
%%
coinsbw = im2bw(coins, 80/255);
figure();
imshow(coinsbw);
%%
figura = imread("figura.png");
figure();
subplot(1, 2, 1);
imshow(figura);
subplot(1, 2, 2);
imhist(figura);
%%
figura2 = imread("figura2.png");
figure();
subplot(1, 2, 1);
imshow(figura2);
subplot(1, 2, 2);
imhist(figura2);
%%
figura3 = imread("figura3.png");
figure();
subplot(1, 2, 1);
imshow(figura3);
subplot(1, 2, 2);
imhist(figura3);
%%
figura4 = imread("figura4.png");
figure();
subplot(1, 2, 1);
imshow(figura4);
subplot(1, 2, 2);
imhist(figura4);
%%
coinsgray = im2bw(coins, graythresh(coins));
coinsKittler = im2bw(coins, clusterKittler(coins)/255);
coinsYen = im2bw(coins, entropyYen(coins)/255);
%%
rysuj(coins, 80);
%%
rysuj(imread("rice.png"), 125);
%%
rysuj(imread("tekst.bmp"), 140);
%%
rysuj(imread("obiekty.bmp"), 170);
%%
rysuj(imread("katalog.bmp"), 90);

function rysuj(img, reczny)
    figure();
    subplot(3, 2, 1);
    imshow(img);
    title("Orginalny");
    subplot(3, 2, 2);
    imhist(img);
    title("Histogram");
    subplot(3, 2, 3);
    imshow(im2bw(img, reczny/255));
    title("Recznie P=" + num2str(reczny));
    subplot(3, 2, 4);
    gt = graythresh(img)*255;
    imshow(im2bw(img, gt/255));
    title("Osu P=" + num2str(gt));
    subplot(3, 2, 5);
    Kittler = clusterKittler(img);
    imshow(im2bw(img, Kittler/255));
    title("Kittler P=" + num2str(Kittler));
    subplot(3, 2, 6);
    Yen = entropyYen(img);
    imshow(im2bw(img, Yen/255));
    title("Yen P=" + num2str(Yen));
end