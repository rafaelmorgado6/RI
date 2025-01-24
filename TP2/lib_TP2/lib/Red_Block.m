function [V,F,h] = Red_Block(LBL, WBL, HBL) % length, width, height

V = [0 0 0;  % ponto 1
     0 -LBL 0;  % ponto 2
     -WBL 0 0;  % ponto 3
     -WBL -LBL 0;  % ponto 4
     
     0 0 HBL;  % ponto 5
     0 -LBL HBL;  % ponto 6
     -WBL 0 HBL;  % ponto 7
     -WBL -LBL HBL];  % ponto 8


F = [1 2 4 3
     5 6 8 7
     1 2 6 5
     3 4 8 7
     2 4 8 6
     1 3 7 5
     ];

h = patch('Vertices', V, 'Faces', F, 'FaceColor', "Red", 'FaceLighting', 'gouraud', 'EdgeColor', 'Black');