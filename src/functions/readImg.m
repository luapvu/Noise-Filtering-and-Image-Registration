
%Function which reads in an image and converts it to a double and
%standardizes for gray scale
function [ output_img ] = readImg( img )
inputImg = imread(img); % read and store the image
%rotateImg = imrotate(inputImg, 270); %rotates image to standard layout
imgDouble = double(inputImg); % cast image to a double
grayImgDouble = mat2gray(imgDouble);

%Returns gray scaled image with an average of rgb values (x1 double)
output_img = sum(grayImgDouble,3)./3; % used to sum the RGB values for each sample and averages it by dividing by 3

%comment out if you want to return an image with RGB values (x3 double) 
%output_img = grayImgDouble; 

end

