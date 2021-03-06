clearvars;
clear all;
clc;

%%

image = imread('lab112.png');

figure();

%%
subplot(1,3,1); imshow(image);

image = im2bw(image,0.4);
image = imcomplement(image);

SE = ones(1,100);
imageEroded = imerode(image,SE);
image = imreconstruct(imageEroded,image);

image = imcomplement(image);

subplot(1,3,2); imshow(image);

image = edge(image,'canny', 0.8, 0.01);

subplot(1,3,3); imshow(image);

%%
figure();
[H,theta,rho] = hough(image,'RhoResolution',1,'ThetaResolution',1);
peaks = houghpeaks(H,13);



imshow(H,[]);
hold on;
plot(peaks(:,2),peaks(:,1),'ro');

%%
figure();

lines = houghlines(image,theta,rho,peaks);
imshow(imread('lab112.png')); 
hold on;

%%przykładowy kod z pomocy houghlines



max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green'); hold on

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow'); hold on
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red'); hold on

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end
hold off;
