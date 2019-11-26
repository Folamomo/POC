
clearvars;
clear all;
clc;

%%

image = zeros(11,11);
image(7,2) = 1;

[H,tehta,ro] = hough(image,'RhoResolution',0.1,'ThetaResolution',0.5);

image(5,6) = 1;

[H2,tehta2,ro2] = hough(image,'RhoResolution',0.1,'ThetaResolution',0.5);

figure();
subplot(1,3,1); imshow(image);      title('oryginal');
subplot(1,3,2); imshow(H,[]);       title('hough');
subplot(1,3,3); imshow(H2,[]);       title('hough 2');

%%
image = zeros(11,11);
image(7,2) = 1;
image(5,11) = 1;
image(1,1) = 1;
image(4,6) = 1;

[H,theta,rho] = hough(image,'RhoResolution',0.1,'ThetaResolution',0.5);

figure();
subplot(1,1,1); imshow(H,[]);
%%

figure();
rho1 = rho(143);
theta1 = theta(163);

x = 0:0.1:10;

y = (rho1 - x*cosd(theta1)/sind(theta1));
figure(3);
imshow(image);
truesize([300 200]);
hold on;
plot(x+1,y+1);
hold off;


