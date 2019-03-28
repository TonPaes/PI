clear all, clc
k = imread('rice_binary.png');
%figure, imshow(k);
%k = rgb2gray(k);
[lin, col]=size(k);
janela=3;


%t = [1 1 1 ; 1 -2 1; -1 -1 -1]; %NORTE
t = [-1 -1 -1 ; 1 -2 1; 1 1 1]; %SUL
%t = [-1 1 1 ; -1 -2 1; -1 1 1]; %LESTE
%t = [1 1 -1 ; 1 -2 -1; 1 1 -1]; %OESTE
%t = [1 1 1 ; -1 -2 1; -1 -1 1]; %NORDESTE
%t = [1 1 1 ; 1 -2 -1; 1 -1 -1]; %NOROESTE
%t = [-1 -1 1 ; -1 -2 1; 1 1 1]; %SUDESTE
%t = [1 -1 -1 ; 1 -2 -1; 1 1 1]; %SUDOESTE


for i=2:lin-1
    for j=2:col-1
        soma = 0;
        u = 1;
        for indice_linha=i-1:i+1
            p = 1;
           for indice_coluna=j-1:j+1
                soma=soma+(k(indice_linha,indice_coluna)*t(u,p));
                p = p + 1;
            end
            u = u + 1;
        end
        k2(i,j)=soma;
    end
end
figure, imshow(k2)