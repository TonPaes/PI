close all
clc
clear all
tic
imagem=imread('lena.bmp');
size(imagem);
figure, imshow(imagem);
imagem=imcrop(imagem,[1 1 200 200]);
imagem=rgb2gray(imagem);
img=double(imagem);
[dimensaox,dimensaoy]=size(imagem);
if dimensaox == dimensaoy
    dimensao=dimensaox;
else
    error ('A imagem deve ser NxN');
end
imgfft = fft2(img);
iimgfft = ifft2(img);
espectroLogaritmico=log(abs(imgfft)+1);
especLogaritmicoComEscala=(uint8(espectroLogaritmico*(255/max(espectroLogaritmico(:)))));
espectroLogaritmicoCentralizado=fftshift(espectroLogaritmico);
subplot(2,2,1), imshow(mat2gray(espectroLogaritmico)), title('Espectro Logaritmo fft');
subplot(2,2,2), imshow(mat2gray(espectroLogaritmicoCentralizado)), title('Espec Logaritmo com Escala fft');
tempo=toc/60;
strcat(num2str(tempo),' minutos')