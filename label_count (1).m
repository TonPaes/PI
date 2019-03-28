close all 			% fechar todas as janelas
clear 				% limpar a mem�ria
clc 				% limpa a tela da �rea de trabalho
pkg load image
tam_fonte = 14; 		% tamanho do fonte de exibi��o
A=imread('blobs.tif'); 	% Ler o arquivo
figure, imshow(A); 	% mostrar a imagem
A=im2bw(A, 0.3); 	% converter a imagem em bin�ria
figure, imshow(~A); 	% mostra a imagem negativa
rotulada=bwlabel(~A,4); % aplica o bwlabel e altere aqui para conectividade 4 ou 8
qtd_regioes=max(max(rotulada)); % qtd regi�es rotuladas
props = regionprops(rotulada,'Centroid', 'Area'); % centr�ides
for k = 1 : qtd_regioes % insere os r�tulos das regi�es
    pos_Centroid = props(k).Centroid;
    text(pos_Centroid(1)-15, pos_Centroid(2), num2str(k), 'FontSize', tam_fonte, 'FontWeight', 'Bold','Color', 'Red');
end
