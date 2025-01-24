function [V7,F7,h] = fig_7()

% Definindo as vértices do cubo
V7 = [0 0 0;   % Ponto 1
     1 0 0;   % Ponto 2
     1 1 0;   % Ponto 3
     0 1 0;   % Ponto 4
     0 0 1;   % Ponto 5
     1 0 1;   % Ponto 6
     1 1 1;   % Ponto 7
     0 1 1;
     
     0 1 0;   % Ponto 8
     1 1 0;   % Ponto 9
     1 2 0;   % Ponto 10
     0 2 0;   % Ponto 11
     0 1 1;   % Ponto 12
     1 1 1;   % Ponto 13
     1 2 1;   % Ponto 14
     0 2 1;
     
     0 1 1;   % Ponto 8
     1 1 1;   % Ponto 9
     1 2 1;   % Ponto 10
     0 2 1;   % Ponto 11
     0 1 2;   % Ponto 12
     1 1 2;   % Ponto 13
     1 2 2;   % Ponto 14
     0 2 2;
     
     0 2 1;   % Ponto 8
     1 2 1;   % Ponto 9
     1 3 1;   % Ponto 10
     0 3 1;   % Ponto 11
     0 2 2;   % Ponto 12
     1 2 2;   % Ponto 13
     1 3 2;   % Ponto 14
     0 3 2];  % Ponto 29

% Definindo as faces do cubo
F7 = [1 2 3 4;   % Face inferior
     5 6 7 8;   % Face superior
     1 2 6 5;   % Face frontal
     2 3 7 6;   % Face direita
     3 4 8 7;   % Face traseira
     4 1 5 8;
     
     9 10 11 12; 
     13 14 15 16; 
     9 10 14 13;  
     10 11 15 14;  
     11 12 16 15;  
     12 9 13 16;
     
     17 18 19 20; 
     21 22 23 24; 
     17 18 22 21;  
     18 19 23 22;  
     19 20 24 23;  
     20 17 21 24;
     
     25 26 27 28; 
     29 30 31 32; 
     25 26 30 29;  
     26 27 31 30;  
     27 28 32 31;  
     28 25 29 32]; 

h = patch('Vertices', V7, 'Faces', F7, 'FaceColor', [1, 0.647, 0], 'FaceLighting', 'gouraud', 'EdgeColor', 'black');

