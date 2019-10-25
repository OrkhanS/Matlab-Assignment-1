% Task 4

image = imread('my.jpg');


S_imageNearest = imresize(image, [128 128], 'nearest');
S_imageBilinear = imresize(image, [128 128], 'bilinear');
S_imageBicubic = imresize(image, [128 128], 'bicubic');


Z_imageNearest = imresize(S_imageNearest, [1024 1024], 'nearest');
Z_imageBilinear = imresize(S_imageBilinear, [1024 1024], 'bilinear');
Z_imageBicubic = imresize(S_imageBicubic, [1024 1024], 'bicubic');

 

R_imageNearest = imrotate(image, 35, 'nearest');  R_imageNearest = imresize(R_imageNearest, [420 333]);
R_imageBilinear = imrotate(image, 35, 'bilinear'); R_imageBilinear = imresize(R_imageBilinear, [420 333]);
R_imageBicubic = imrotate(image, 35, 'bicubic'); R_imageBicubic = imresize(R_imageBicubic, [420 333]);


figure(4);
subplot(4,3,2),imshow(image);
title("Original");
subplot(4,3,4),imshow(S_imageNearest); [x y z]=size(S_imageNearest);
xlabel(y);ylabel(x);
title("Shrink nearest");
subplot(4,3,5),imshow(S_imageBilinear); [x y z]=size(S_imageBilinear);
xlabel(y);ylabel(x);
title("Shrink bilinear");
subplot(4,3,6),imshow(S_imageBicubic);[x y z]=size(S_imageBicubic);
xlabel(y);ylabel(x);
title("Shrink bicubic");
subplot(4,3,7),imshow(Z_imageNearest);[x y z]=size(Z_imageNearest);
xlabel(y);ylabel(x);
title("Zoom nearest");
subplot(4,3,8),imshow(Z_imageBilinear);[x y z]=size(Z_imageBilinear);
xlabel(y);ylabel(x);
title("Zoom bilinear");
subplot(4,3,9),imshow(Z_imageBicubic);[x y z]=size(Z_imageBicubic);
xlabel(y);ylabel(x);
title("Zoom bicubic");
subplot(4,3,10),imshow(R_imageNearest);[x y z]=size(R_imageNearest);
xlabel(y);ylabel(x);
title("Rotate nearest");
subplot(4,3,11),imshow(R_imageBilinear);[x y z]=size(R_imageBilinear);
xlabel(y);ylabel(x);
title("Rotate bilinear");
subplot(4,3,12),imshow(R_imageBicubic);[x y z]=size(R_imageBicubic);
xlabel(y);ylabel(x);
title("Rotate bicubic");


%------------------------------------------

% Task 5



nX = 1024;
nY = 1024;
newM = zeros(nX, nY, 3, class(S_imageNearest));

for i = 1:nX
    for j = 1:nY
        for k = 1:3
            
            if i<=8&&j<=8
                newM(i,j,k) = S_imageNearest(1,1,k);
                
            elseif i<=8&&j>8
                    newM(i,j,k) = S_imageNearest(i,1,k);
                    
            elseif i>8&&j<=8
                    newM(i,j,k) = S_imageNearest(1,j,k);
                    
            else
              
                newM(i,j,k) = S_imageNearest((floor(i./8)),(floor(j./8)),k);
            end
        end
    end
end

                
xlabel(1024);ylabel(1024);
figure(5);
imshow(newM);
title('Zoomed Pic');

