clearvars;
close all;
clc;
%%

load('MR_data.mat');

%%
img0 = I_noisefree;
img1 = I_noisy1;
img2 = I_noisy2;
img3 = I_noisy3;
img4 = I_noisy4;

draw(img0, 3);
draw(img1, 3);
draw(img2, 3);
draw(img3, 3);
draw(img4, 3);

%% Moja funkcja pomocnicza
function draw(image, sigma)
    figure();
    subplot(1,3,1);
    imshow (image,[]);
    title('oryginał');
    subplot(1,3,2);
    conv = convolution(image,[5 5]);
    imshow(conv,[]);
    title('convoution');
    subplot(1,3,3);
    bil = bilateral(image,[5 5], sigma);
    imshow(bil,[]);
    title('bilateral');
end
%%

function data_filtered = convolution(data, local_window)
    fun = @(data_, local_window_)convolution_local(data_, local_window_);
    data_filtered = colfilt(data, local_window, 'sliding', fun, local_window);
end

function data_filtered = convolution_local(data, local_window)
    Nx = size(data,2);
    h = fspecial('gaussian', local_window, 25);
    for i=1:Nx
        patch = reshape(data(:,i),local_window);
        data_filtered(i) = sum(sum(patch .* h)) ;
    end
end

function data_filtered = bilateral(data,local_window, sigma)
    FUNCTION = @(data_,local_window_)bilateral_local(data_,local_window_, sigma);
    data_filtered = colfilt(data,local_window, 'sliding', FUNCTION,local_window);
end

function data_filtered = bilateral_local(data,local_window, sigma)
Nx = size(data,2);
Ncy = ceil(local_window(1)/2);
Ncx = ceil(local_window(2)/2);
h = fspecial('gaussian',local_window,25);
    for i=1:Nx   
        %odczytujemy lokalne okno
        window = reshape(data(:,i),local_window);
        %obliczamy ||p - x|| (dist)
        [rows, cols] = find(window == window);
        rows = reshape(rows, local_window);
        cols = reshape(cols,local_window);
        dist = sqrt((Ncy - rows).^2 + (Ncx - cols).^2);
        %obliczmy psi
        psi = dist .* h;
        %obliczamy odleglosc w przeciwdziedzinie
        dist_anty = abs(window - window(Ncy,Ncx));
        %obliczamy gamma
        gamma = (-1)*(dist_anty .* dist_anty)/(2*sigma*sigma);
        %obliczamy Wn
        Wn = sum(sum(psi .* gamma));
        
        data_filtered(i) = sum(sum(psi .* gamma .* window))/Wn;
    end
end