function [  ] = directional( h, v, theta )
colormap(gray);
imagesc(abs( h*cos(theta) + v * sin(theta)));
end

