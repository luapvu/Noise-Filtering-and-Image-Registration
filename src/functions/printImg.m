function printImg( img, img_title )

imshow(img, [min(img(:)), max(img(:))]); %prints image to screen
title(img_title); % Attaches specified title to the image

end

