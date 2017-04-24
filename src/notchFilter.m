function [ mask ] = notchFilter( img, radius)

[rowLength, colLength ] = size(img); % read in image size

width = colLength;
height = rowLength;
centerW = width/2;
centerH = height/2;
[W,H] = meshgrid(1:width,1:height);
mask = ((W-centerW).^2 + (H-centerH).^2) < radius^2;
figure;
imshow(mask)



end

