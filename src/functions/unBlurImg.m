function [ blurredFFT, mask, out ] = unBlurImg( img )
spFilter = medfilt2(img);
blurredFFT = myFFT(spFilter);
mask = periodicFilter(blurredFFT);
out = blurredFFT.*mask;
visibleOut = log(abs(out+1));
invFFT = ifftshift(out);
newimg = ifft2(invFFT,'symmetric');

%Displaying the FFT of the blurred image, and it's histogram
visibleFFT = log(abs(blurredFFT+1));
figure;
subplot(1,3,1); printImg(visibleFFT, 'Periodic Noise in Frequency Domain');
subplot(1,3,2); printImg(mask, 'Mask to apply to filter noise');
subplot(1,3,3); printImg(visibleOut, 'Image after mask filtering');



figure; 
subplot(1,3,1); printImg(img, 'Original Blurry Saturn');
subplot(1,3,2); printImg(spFilter, 'After Salt and Pepper Filter');
subplot(1,3,3); printImg(newimg, 'After Periodic Noise Filter');






end

