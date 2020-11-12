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

Rvals = R(find(R));
Gvals = G(find(G));
Bvals = B(find(B));

Rmean = mean(Rvals);
Gmean = mean(Gvals);
Bmean = mean(Bvals);

if (225 < Rmean && Rmean < 255) && (200 < Gmean && Gmean < 255) && (90 < Bmean && Bmean < 130)
    disp('Yellow')
elseif (75 < Rmean && Rmean < 125) && (140 < Gmean && Gmean < 180) && (90 < Bmean && Bmean < 130)
    disp('Green')
elseif (50 < Rmean && Rmean < 90) && (70 < Gmean && Gmean < 110) && (100 < Bmean && Bmean < 120)
    disp('Blue')
elseif (220 < Rmean && Rmean < 255) && (115 < Gmean && Gmean < 155) && (60 < Bmean && Bmean < 100)
    disp('Red')
elseif (105 < Rmean && Rmean < 145) && (70 < Gmean && Gmean < 110) && (130 < Bmean && Bmean < 170)
    disp('Purple')
else
    disp('No color')


end


imNew(:,:,1) = R;
imNew(:,:,2) = G;
imNew(:,:,3) = B;
figure(2); imshow(imNew);

figure(3);
subplot(3, 1, 1)
histogram(Rvals,'BinWidth',1);
axis([0 255 0 inf]);
set(get(gca,'children'),'facecolor',[1 0 0])
set(get(gca,'children'),'facecolor',[1 0 0])

subplot(3, 1, 2)
histogram(Gvals);
axis([0 255 0 inf]);
set(get(gca,'children'),'facecolor',[0 1 0])
set(get(gca,'children'),'facecolor',[0 1 0])

subplot(3, 1, 3)
histogram(Bvals);
axis([0 255 0 inf]);
set(get(gca,'children'),'facecolor',[0 0 1])
set(get(gca,'children'),'facecolor',[0 0 1])