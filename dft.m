clear all
close all 
clc
tic
imagem=imread('lena.bmp');
imagem=imcrop(imagem,[1 1 200 200]);
tipo=1; % para DFT
% tipo=-1 % para IDFT
% captura a dimensao da imagem
imagem=rgb2gray(imagem);
figure, imshow(imagem);
imagem=double(imagem);
% captura a dimensao da imagem
[dimensaox,dimensaoy]=size(imagem);
if dimensaox == dimensaoy
    dimensao=dimensaox;
else
    error ('A imagem deve ser NxN');
end
% inicializacao das variaveis
nivelDeCinza=0;
res=0;
ImagemAux=zeros(dimensao,dimensao);
ImageRes=zeros(dimensao,dimensao);
% Define se sera DFT ou IDFT
if tipo==1
    imaginario=-j;
elseif tipo==0
    imaginario=j;
else
    error ('Voce nao digitou um tipo valido. Digite 1 para DFT e 0 para IDFT');
end 
%Somatorio interno.
for v=0:(dimensao-1),
    for x=(0:dimensao-1),
        for y=0:(dimensao-1),
            nivelDeCinza=imagem(x+1,y+1);  
            res=nivelDeCinza*exp((imaginario*2*pi*v*y)/dimensao)+res;
        end
        ImagemAux(x+1,v+1)=res;
        res=0;
    end
end
% Somatorio Externo
somatorio=0;
for u=0:(dimensao-1),
    for v=0:(dimensao-1),
        for x=0:(dimensao-1),
somatorio=ImagemAux(x+1,v+1)*exp((imaginario*2*pi*u*x)/dimensao)+somatorio;
        end
        ImageRes(u+1,v+1)=somatorio;
        somatorio=0;
    end
end
espectroLogaritmico=log(abs(ImageRes)+1);
espectroLogaritmicoCentralizado=fftshift(espectroLogaritmico);
centralizadoComEscala=(uint8(espectroLogaritmicoCentralizado*(255/max(espectroLogaritmico(:)))));
especLogaritmicoComEscala=(uint8(espectroLogaritmico*(255/max(espectroLogaritmico(:)))));
figure, subplot(2,2,1), imshow(especLogaritmicoComEscala), title('Espectro Logaritmo com Escala dft');
subplot(2,2,2), imshow(centralizadoComEscala), title('Espectro Logaritmo Centralizado com Escala dft');
tempo=toc/60;
strcat(num2str(tempo),' minutos')