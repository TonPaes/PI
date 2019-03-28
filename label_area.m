close all % fechar todas as janelas
clear % limpar a mem�ria
clc % limpa a tela da �rea de trabalho
pkg load image
fontSize = 10; % tamanho do fonte de exibi��o
A=imread('blobs.tif'); % Ler o arquivo
figure, imshow(A); % mostrar a imagem
A=im2bw(A, 0.3); % converter a imagem em bin�ria
figure, imshow(~A); % mostra a imagem negativa
rotulada=bwlabel(~A,4); % aplica o bwlabel e altere aqui para conectividade 4 ou 8
qtd_regioes=max(max(rotulada)); % quantifica as regioes rotuladas
props = regionprops(rotulada,'Centroid','Area'); % obtem o centroide das regioes
for k = 1 : qtd_regioes % insere os n�meros dos r�tulos nas regi�es
    pos_Centroid = props(k).Centroid;
    vlr_area=props(k).Area;
    text(pos_Centroid(1)-15, pos_Centroid(2), num2str(vlr_area), 'FontSize', fontSize, 'FontWeight', 'Bold','Color', 'Red');
end