function [ out ] = downsample( img )

% Small image
simg = img(1:8:1024,1:8:768,:);
subplot(1,2,1);
imagesc(simg);
title('Downsampled Image size: 128 by 96');

% Now Interpolate the small image back to original size

% Create matrix of that is the size of original matrix
[m,n,c] = size(img);
out = zeros(m,n,c);

% Now interpolating 
for k =1:3
    out(449:576,337:432,k) = fftshift(fft2(simg(:,:,k)));
    out(:,:,k) = real(ifft2(fftshift(out(:,:,k))));
end

out = uint8(out)*64;
subplot(1,2,2);
imagesc(out);
title('Interpolated Image to size: 1024 by 768');

end

