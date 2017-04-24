function [ output ] = bilinearInterpolation(columns, rows, img)

%If the x and y coordinates are not integers, we round down and round up to
%get the min and max coordinates in the x and y directions
x_min = floor(columns);
x_max = ceil(columns);
y_min = floor(rows);
y_max = ceil(rows);

imgSz = size(img);
rowLength = imgSz(1,1); %x length
columnLength = imgSz(1,2); %y length

%in the case the input is 0.5, matlab will go out of range since the
%smallest cell is 1x1, therefore we set xmin or ymin to 1
if x_min < 1
    x_min = 1;
end

if y_min < 1
    y_min = 1;
end



%in the case the x,y is larger than column or row length, matlab will go out of range
%the function will try to interpolate around values which don't exist past
%the maximum, therefore we set these values to the values at the maximum
%length
if x_min > columnLength
    x_min = columnLength;
end

if y_min > rowLength
    y_min = rowLength;
end

if x_min < 1
    x_min = 1;
end

if y_min < 1
    y_min = 1;
end



if x_max > columnLength
    x_max = columnLength;
end

if y_max > rowLength
    y_max = rowLength;
end


if x_max < 1
    x_max = 1;
end

if y_max < 1
    y_max = 1;
end


%determines the decimal from the integer value will be a value between 0
%and 1
alpha = columns - x_min;
beta = rows - y_min;

%Grabing the values of the min and max coordinates of the image
f1 = img(y_min, x_min);
f2 = img(y_max, x_min);
f3 = img(y_max, x_max);
f4 = img(y_min, x_max);

%Bilinear interpolation equation as given in lecture three page 6
output = ((1-alpha)*(1-beta)*f1) + (alpha*(1-beta)*f2) + (alpha*beta*f3) + ((1-alpha)*beta*f4);

end

