function [ vertical, horizontal] = verticalAndHorizontal( img )
% Larger magnitude of partial derivates indicates edges
mask = [ones(4,2),-ones(4,2)];

horizontal = conv2(img(:,:,1),mask','same');
vertical   = conv2(img(:,:,1),mask,'same');

% Fix color range gray to see edges 
colormap(gray);

% Creates a plot grid 1 by 2 and active plot 1
subplot(1,2,1);
imagesc(abs(horizontal));
title('Horizontal edges');
subplot(1,2,2);
imagesc(abs(vertical));
title('Vertical edges');

end

