function [ shiftedFFT] = myFFT( noiseImg )

fftImg = fft2(double(noiseImg)); %taking the fast fourier transform in 2-D of the noisy img
shiftedFFT = fftshift(fftImg); % shifting the low frequency values to the center

end

