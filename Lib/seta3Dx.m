function [P, F] = seta3Dx(D, L, d, f)

    if nargin < 1  % Se nenhum argumento for passado, usa os valores padrão
        D = 0.2;   % Valor padrão de D
    end
    if nargin < 2
        L = 1;      % Valor padrão de L
    end
    if nargin < 3
        d = 1.5;    % Valor padrão de d
    end
    if nargin < 4
        f = 0.15;   % Valor padrão de f
    end

% Definição dos vertices do paralelepípedo
P = [
  %  do paralelepípedo
     0  D  D;  % ponto 3 
     0  D  0;  % ponto 2 
     0  0  D;  % ponto 4 
     0  0  0;  % ponto 1 
     -L  D  D;  % ponto 7 
     -L  D  0;  % ponto 6 
     -L  0  D;  % ponto 8 
     -L  0  0;   % ponto 5 
  % da piramide
    -L  D+(d*D/4) -(d*D/4);  % ponto 10
    -L -(d*D/4) -(d*D/4);  % ponto 9
    -L  D+(d*D/4)  D+(d*D/4);  % ponto 11
    -L -(d*D/4)  D+(d*D/4);  % ponto 12
    -(L+f*L)  D/2  D/2];     % ponto 13 (ápice)

% Definição das faces 
F = [
  % do paralelepípedo
    1 2 4 3;  % face frontal
    5 6 8 7;  % face traseira
    1 3 7 5;  % face esquerda
    2 4 8 6;  % face direita
    1 2 6 5;  % face inferior
    3 4 8 7   % face superior
  % da piramide
     9 10 12 11;   % Base (face inferior)
     9 10 13 13;   % Face lateral 1
    10 12 13 13;   % Face lateral 2
    12 11 13 13;   % Face lateral 3
    11  9 13 13];  % Face lateral 4
