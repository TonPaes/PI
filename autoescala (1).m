close all % fechar todas as janelas
clear % limpar a mem�ria
clc % limpa a tela da �rea de trabalho
pkg load image
A=imread('cacau_escuro.tif'); % Ler o arquivo
%cte_brilho=50;
f_max=max(max(A)); %%%%%novidade
f_min=min(min(A)); %%%%%novidade
figure, imshow(A); % mostrar a imagem
figure, imhist(A);
[lin col]=size(A); % obt�m dimens�es da imagem
for i=1:lin
    for j=1:col
        B(i,j)=(255/(f_max-f_min))*(A(i,j)-f_min); %%%%%novidade
        if B(i,j)>255
            B(i,j)=255;
        else
            if B(i,j)<0
                B(i,j)=0;
            end
        end
    end
end
figure, imhist(B);
figure, imshow(B);
