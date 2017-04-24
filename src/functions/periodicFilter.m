function [ myMat ] = periodicFilter( img )

[rowLength, colLength ] = size(img); % read in image size
myMat = zeros(size(img));
myMat = myMat + 1;



%filters out horizontal noise that goes from top down
j = colLength/2;
for i =1:rowLength
    
if i > rowLength/2 + 1 || i < rowLength/2 -1   
myMat(i,j) = 0;
myMat(i,j+1) = 0;
end

end

%{ 
%filters out vertical noise that goes from left to right
i = rowLength/2; 
for j = 1:colLength
    
if j > colLength/2 + 1 || j < colLength/2 -1   
    
myMat(i,j) = 0;
myMat(i-1,j) = 0;
end

end
%}

%{
%filters out vertical noise that goes from the diagonal
j = colLength-10;
for i = 68:rowLength-70
    
if i > rowLength/2 + 5 || i < rowLength/2 -5   

myMat(i,j) = 0;
myMat(i+1,j+1) = 0;
myMat(i-1,j-1) = 0;
myMat(i+2,j+2) = 0;
myMat(i-2,j-2) = 0;
j = j-3;
end
end

%}

end

