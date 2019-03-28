clear all

pkg load image

I = imread('pikachu2.jpg');


imshow(I);
Neg = (255 - I);

%Laplaciano
L = [0, 1, 0; -1 4 -1; 0 -1 0];
lap = imfilter(I,L);

%remoção média
RM = [-1 -1 -1; -1 -1 -1; -1 9 -1];
rmv = imfilter(I,RM);

%Prewitt horizontal
PH =[-1 0 1; -1 0 1; -1 0 1]
pwh = imfilter(I,PH);




figure, subplot(2,3,1);
imshow(I);
subplot(2,3,2), imshow(Neg);
subplot(2,3,3), imshow(lap);
subplot(2,3,4), imshow(rmv);
subplot(2,3,5), imshow(pwh);

