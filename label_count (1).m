close all 			% fechar todas as janelas
clear 				% limpar a memória
clc 				% limpa a tela da área de trabalho
pkg load image
tam_fonte = 14; 		% tamanho do fonte de exibição
A=imread('blobs.tif'); 	% Ler o arquivo
figure, imshow(A); 	% mostrar a imagem
A=im2bw(A, 0.3); 	% converter a imagem em binária
figure, imshow(~A); 	% mostra a imagem negativa
rotulada=bwlabel(~A,4); % aplica o bwlabel e altere aqui para conectividade 4 ou 8
qtd_regioes=max(max(rotulada)); % qtd regiões rotuladas
props = regionprops(rotulada,'Centroid', 'Area'); % centróides
for k = 1 : qtd_regioes % insere os rótulos das regiões
    pos_Centroid = props(k).Centroid;
    text(pos_Centroid(1)-15, pos_Centroid(2), num2str(k), 'FontSize', tam_fonte, 'FontWeight', 'Bold','Color', 'Red');
end
