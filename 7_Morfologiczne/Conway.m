clearvars;
clear all;
clc;

load gra.mat;
%%
lut = makelut(@nowystan,3);

step0 = plansza1;
step1 = applylut(step0,lut);
step2 = applylut(step1,lut); 
step3 = applylut(step2,lut); 
step4 = applylut(step3,lut); 
step5 = applylut(step4,lut);

figure();
subplot(2,3,1); imshow(step0); title('step0');
subplot(2,3,2); imshow(step1); title('step1');
subplot(2,3,3); imshow(step2); title('step2');
subplot(2,3,4); imshow(step3); title('step3');
subplot(2,3,5); imshow(step4); title('step4');
subplot(2,3,6); imshow(step5); title('step5');

%%

step0 = plansza2;
step1 = applylut(step0,lut);
step2 = applylut(step1,lut); 
step3 = applylut(step2,lut); 
step4 = applylut(step3,lut); 
step5 = applylut(step4,lut);

figure();
subplot(2,3,1); imshow(step0); title('step0');
subplot(2,3,2); imshow(step1); title('step1');
subplot(2,3,3); imshow(step2); title('step2');
subplot(2,3,4); imshow(step3); title('step3');
subplot(2,3,5); imshow(step4); title('step4');
subplot(2,3,6); imshow(step5); title('step5');

%% gra

step = plansza1;
figure();
for i = 1:5
    subplot(2,1,1);
    imshow(step);
    truesize([300 200]);
    step = applylut(step,lut);
    pause(0.5);
end

%%

figure();
step = plansza2;
for i = 1:40
    subplot(2,1,1);
    imshow(step);
    truesize([300 200]);
    step = applylut(step,lut);
    pause(0.5);
end

%%

function wynik = nowystan(nhood)
    pixel = nhood(2,2);
    suma = sum(nhood(:));
    
    if pixel == 1 && (suma == 3 || suma == 4)
          wynik = 1;
    elseif pixel == 1 && (suma == 1 || suma == 2 || suma > 4) 
          wynik = 0;
    elseif pixel == 0 && suma == 3
          wynik = 1;
    else
        wynik = pixel;
    end    
end
