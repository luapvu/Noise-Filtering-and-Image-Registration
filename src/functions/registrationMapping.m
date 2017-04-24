function transformedImg= registrationMapping( landmarkP, landmarkQ, rotatedImg, img )
%---------------------------
%calculating mean
[rowLength, colLength ] = size(landmarkP); % read in n samples
sum_of_p_coordinates = sum(landmarkP); %creates a 1x2 array where 1,1 = sum of x-values and 1,2 = sum of y-values
sum_of_q_coordinates = sum(landmarkQ); %creates a 1x2 array where 1,1 = sum of x-values and 1,2 = sum of y-values
meanP = sum_of_p_coordinates/rowLength; % mean of p landmark which will be a 1x2 array for x and y value
meanQ = sum_of_q_coordinates/rowLength; % mean of q landmark which will be a 1x2 array for x and y value


meanP = repmat(meanP, [rowLength 1]); %for simple calculations, make it the same length as landmarkP a nx2 array
meanQ = repmat(meanQ, [rowLength 1]); %for simple calculations, make it the same length as landmarkQ a nx2 array

%difference of each landmark from the mean landmark
pdiff = landmarkP - meanP;% since they are the same size, we can subtract the two matrixes and still have a nx2 array
qdiff = landmarkQ - meanQ;% since they are the same size, we can subtract the two matrixes and still have a nx2 array


%---------------------------
%calculating covariance
cov = 0;
for i = 1: rowLength
 cov = cov + transpose(pdiff(i,:))*qdiff(i,:); 
end

cov = (1/rowLength)*cov; %divide by N samples to give covariance


%singular value decomposition of covariance
[u,d,v] = svd(cov);

%the s matrix is dependant on the determinant of d
if(det(d) >=1)
    s = [1 0; 0 1];
else
    s = [1 0; 0 -1];
end



optimal_rotation = u*s*transpose(v); %calculating the optimal rotation matrix 
optimal_translation = meanQ(1,:) - transpose(optimal_rotation*transpose(meanP(1,:))); %calculating optimal translation matrix


[imgrowLength, imgcolLength ] = size(rotatedImg); % read in image size
transformedImg = img; % initialize the transformed image

% want to crop the rotated face from the minimum measured landmark to maximum
min_xP = round(min(landmarkP(:,1)));
max_xP = round(max(landmarkP(:,1)));

%since it's an face rotation, the face should change in the horizontal
%direction, thus if the background is constant we know min_yP should be 1
%(the top of the image) and max_yP should be the chin of your face (or
%bottom of the landmark y coordinate)
min_yP = round(min(landmarkP(:,2)));
max_yP = round(max(landmarkP(:,2)));


%in case the land marks are not exactly on the edges of the face, we add a
%padding to ensure the entire face is cropped. 

if min_yP > 20
    min_yP = min_yP -20;
end

if max_yP < imgrowLength -20
    max_yP = max_yP + 20;
end


if min_xP > 20
    min_xP = min_xP -20;
end

if max_xP < imgcolLength -20
    max_xP = max_xP + 20;
end



for i = min_yP: max_yP

    for j = min_xP: max_xP
        phi = transpose(optimal_rotation*[i;j] + transpose(optimal_translation)); % calculating phi function to map each point of I2 to I1
        transformedImg(i,j) = bilinearInterpolation(phi(1,2), phi(1,1), rotatedImg); %taking the x and y coordinates stored in phi 1 and phi 2 , and doing a interpolation of the rotatated image  
    end


end



end

