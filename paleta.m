%Limpando a �rea
clear
close all
clc
pkg load image %poderemos adicionar a chamada do pacote a um script

%Criando uma imagem com n�veis de cinza
C = (0:255)/255;
gray = [C; C; C; C; C; C; C; C; C; C; C; C; C; C; C; C];

figure; imshow(gray), title('N�veis de Cinza');

%Criando uma imagem com n�veis de vermelho
C = (0:255)/255;
red = [C; C; C; C; C; C; C; C; C; C; C; C; C; C; C; C];

figure; imshow(red), title('N�veis de Vermelho');
redmap = colormap(autumn);

%Criando uma imagem com n�veis de verde
C = (0:255)/255;
green = [C; C; C; C; C; C; C; C; C; C; C; C; C; C; C; C];

figure; imshow(green), title('N�veis de Verde');
greenmap = colormap(summer);

%Criando uma imagem com n�veis de azul
C = (0:255)/255;
blue = [C; C; C; C; C; C; C; C; C; C; C; C; C; C; C; C];

figure; imshow(blue), title('N�veis de Azul');
bluemap = colormap(winter);

%Criando uma imagem com n�veis RGB
C = (0:255)/255;
rgb = [C; C; C; C; C; C; C; C; C; C; C; C; C; C; C; C];

figure; imshow(rgb), title('N�veis RGB');
rgbmap = colormap(jet);