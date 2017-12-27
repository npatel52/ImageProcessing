function [ imgEnhanced ] = edgeEnhancement( img )
% Performs edge enhancement

[m,n,c] = size(img);
imageEnhanced = zeros(m,n,c);

for k = 1:3
    smooth = conv2(img(:,:,k),ones(10,10)/100,'same');
    imgEdges = img(:,:,k) - uint8(smooth);
    imgEnhanced(:,:,k) = img(:,:,k) + 2*imgEdges;
end

subplot(1,2,1);
imagesc(img);
title('Original');

subplot(1,2,2);
imagesc(imgEnhanced);
title('Enhanced');

end

