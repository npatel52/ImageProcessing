function [ out ] = imgInterp( img )
% This function takes an image as an input and interpolate it 4 times its
% original size

% img is low resolution flower of size 709 by 736

% Creating array of size 4 times as big
[m,n,c] = size(img);
out = zeros(m*4,n*4,c);

% Taking FFT of all three arrays
for k = 1:3
    out(49:80,49:80,k) = fftshift(fft2(img(:,:,k)));   
    out(:,:,k) = ifft2(fftshift(out(:,:,k)));
end

% Normalize by multiplying with 16
out = uint8(16*real(out));
imagesc(out);

end

