pkg load image

A = imread('moon.jpg');

%Laplaciano

h =[-1 -1 -1; -1 8 -1; -1 -1 -1];

B = imfilter(A,h);

C = A + B;

figure, subplot(1,3,1), imshow(A), title('Original');
subplot(1,3,2), imshow(B), title('Laplaciano');
subplot(1,3,3), imshow(C), title('Original + Laplaciano');

imwrite(A, 'Original');
imwrite(B, 'Laplaciano');
imwrite(C, 'Original_plus_laplaciano');
