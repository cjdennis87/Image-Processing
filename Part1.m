clear
im = imread('folders01med.JPG');
R = im(:,:,1);
G = im(:,:,2);
B = im(:,:,3);
figure(1); imshow(im); axis on;

[xIn, yIn] = ginput(4);
xCent = mean(xIn);
yCent = mean(yIn);

m = (yIn(2) - yIn(1)) / (xIn(2) - xIn(1));
b = yIn(1) - m * xIn(1);
[x, y] = meshgrid(1:size(im,2), 1:size(im,1));
if yCent < (m*xCent + b)
    R(y > m*x+b) = 0;
    G(y > m*x+b) = 0;
    B(y > m*x+b) = 0;
end
if yCent > (m*xCent + b)
    R(y < m*x+b) = 0;
    G(y < m*x+b) = 0;
    B(y < m*x+b) = 0;
end

m = (yIn(3) - yIn(2)) / (xIn(3) - xIn(2));
b = yIn(2) - m * xIn(2);
[x, y] = meshgrid(1:size(im,2), 1:size(im,1));
if yCent < (m*xCent + b)
    R(y > m*x+b) = 0;
    G(y > m*x+b) = 0;
    B(y > m*x+b) = 0;
end
if yCent > (m*xCent + b)
    R(y < m*x+b) = 0;
    G(y < m*x+b) = 0;
    B(y < m*x+b) = 0;
end

m = (yIn(4) - yIn(3)) / (xIn(4) - xIn(3));
b = yIn(3) - m * xIn(3);
[x, y] = meshgrid(1:size(im,2), 1:size(im,1));
if yCent < (m*xCent + b)
    R(y > m*x+b) = 0;
    G(y > m*x+b) = 0;
    B(y > m*x+b) = 0;
end
if yCent > (m*xCent + b)
    R(y < m*x+b) = 0;
    G(y < m*x+b) = 0;
    B(y < m*x+b) = 0;
end

m = (yIn(1) - yIn(4)) / (xIn(1) - xIn(4));
b = yIn(4) - m * xIn(4);
[x, y] = meshgrid(1:size(im,2), 1:size(im,1));
if yCent < (m*xCent + b)
    R(y > m*x+b) = 0;
    G(y > m*x+b) = 0;
    B(y > m*x+b) = 0;
end
if yCent > (m*xCent + b)
    R(y < m*x+b) = 0;
    G(y < m*x+b) = 0;
    B(y < m*x+b) = 0;
end

imNew(:,:,1) = R;
imNew(:,:,2) = G;
imNew(:,:,3) = B;
figure(2); imshow(imNew);