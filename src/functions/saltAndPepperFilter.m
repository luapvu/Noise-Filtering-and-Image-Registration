%takes a 3x3 average for each pixel in the image
function [img_edges] = saltAndPepperFilter( img1 )

img = double(img1); %type cast image to double so it's easier to work with
[rowLength, colLength ] = size(img1); % read in image size

row_boundary = rowLength - 1; % since the mask is a 3x3 matrix I will only be evaluating the pixels which are not on the outer edges of the MxN images... 
col_boundary = colLength -1; %...Those pixels will remain their original values without any masking
laplacian_mask = [1,1,1; 1, 1, 1; 1,1,1];%median mask which will be used to filter salt and pepper
img_edges = zeros(rowLength, colLength); % initialize output array

for J = 2:row_boundary
    for I = 2: col_boundary
        img_matrix = [img(J-1, I-1:I+1); img(J, I-1: I+1); img(J+1, I-1:I+1);]; %reading in the 3x3 values of the image centered around a pixel at I,J
        temp_matrix = laplacian_mask .* img_matrix; %multiplies the image matrix against the median mask
        sumCol = sum(temp_matrix); % sums the 3x3 matrix into a 1x3 matrix holding the sum of each column
        sumTotal = sum(sumCol); % sums all of the columns into a singl value representing the sum of the entire matrix
        img_edges(J,I) = sumTotal; % update the image value
    
    
    end
    
end



end