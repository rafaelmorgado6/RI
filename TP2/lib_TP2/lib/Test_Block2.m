function [V,F,h] = Test_Block2()

V = [0 0 0;  % ponto 1
     0 150 0   ;  % ponto 2
     -40 0 0;  % ponto 3
     -40 150 0;  % ponto 4
     
     0 0 50;  % ponto 5
     0 150 50;  % ponto 6
     -40 0 50;  % ponto 7
     -40 150 50];  % ponto 8


F = [1 2 4 3
     5 6 8 7
     1 2 6 5
     3 4 8 7
     2 4 8 6
     1 3 7 5
     ];

h = patch('Vertices', V, 'Faces', F, 'FaceColor', "Red", 'FaceLighting', 'gouraud', 'EdgeColor', 'Black');