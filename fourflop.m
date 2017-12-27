function [ out ] = fourflop( img, s )

[m,n,c] = size(img);

% Creates a subsample image of size (s by s)
small = img(1:m/s:m, 1:n/s:n,:);

[s,t,c] = size(small);

% Four-flop small
up = [small, small(:,t-1:-1:1,:)];
down = [small(s-1:-1:1,:,:), small(s-1:-1:1,t-1:-1:1,:)];
ff = vertcat(up,down);

subplot(2,2,1);
imagesc(ff);
title('Four-flopped image of size 32 by 32');

% Creates an array to store final result (Interpolating to original size)
out = zeros(252,252,3);
% Performing Fourier transform on each layer
for k=1:3
    out(95:157,95:157,k)= fftshift(fft2(ff(:,:,k)));   
    out(:,:,k) = ifft2(fftshift(out(:,:,k)));
end

% Normalize
factor = uint8(small(1:1)/real(out(1:1)));
out = uint8(real(abs(out)));
out = out * 16;

subplot(2,2,2);
imagesc(out);
title('After applying FFT');


subplot(2,2,3);
imagesc(small)
title('Subsampled image 32 by 32');

subplot(2,2,4);
imagesc(out(1:128,1:128,:));
title('Interpolated image using Four-Flop method size 128 by 128');

end

