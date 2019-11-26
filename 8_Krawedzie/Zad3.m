
clearvars;
clear all;
clc;

image = imread('kwadraty.png');
imageEdge = edge(image,'canny');

figure(1);
subplot(1,2,1); imshow(image);
subplot(1,2,2); imshow(imageEdge);

[H,theta,rho] = hough(imageEdge,'RhoResolution',1,'ThetaResolution',1);
peaks = houghpeaks(H,10);

figure(2);
imshow(H,[]);
hold on;
plot(peaks(:,2),peaks(:,1),'ro');

figure(3);
lines = houghlines(imageEdge,theta,rho,peaks,'FillGap',5,'MinLength',7);

%% przykładowy kod z pomocy houghlines

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