close all 			% fechar todas as janelas
clear 				% limpar a mem�ria
clc % limpa a tela da �rea de trabalho
pkg load image				
tam_fonte = 8; 		% tamanho do fonte de exibi��o
A=imread('rice_binary.png'); 	% Ler o arquivo
figure, imshow(A); 	% mostrar a imagem
rotulada=bwlabel(A,8); % aplica o bwlabel e altere aqui para conectividade 4 ou 8
qtd_regioes=max(max(rotulada)); % qtd regi�es rotuladas
props = regionprops(rotulada,'Centroid'); % centr�ides
for k = 1 : qtd_regioes % insere os r�tulos das regi�es
    pos_Centroid = props(k).Centroid;
    text(pos_Centroid(1)-3, pos_Centroid(2), num2str(k), 'FontSize', tam_fonte, 'FontWeight', 'Bold','Color', 'Red');
end
