function [V4,F4,h] = fig_4()

% Definindo as vértices do cubo
V4 = [0 0 0;   % Ponto 1
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
     
     0 0 1;   % Ponto 1
     1 0 1;   % Ponto 2
     1 1 1;   % Ponto 3
     0 1 1;   % Ponto 4
     0 0 2;   % Ponto 5
     1 0 2;   % Ponto 6
     1 1 2;   % Ponto 7
     0 1 2];  % Ponto 29

% Definindo as faces do cubo
F4 = [1 2 3 4;   % Face inferior
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
     20 17 21 24]; 

h = patch('Vertices', V4, 'Faces', F4, 'FaceColor', 'blue', 'FaceLighting', 'gouraud', 'EdgeColor', 'black');

