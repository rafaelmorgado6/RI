function [V,F,h] = Red_Block(LBL, WBL, HBL, DTF, LTF, STF, WTS, HTA) % length, width, height

V = [DTF+LTF     -STF/2-WTS+((WTS-LBL)/2) HTA;  % ponto 1
     DTF+LTF     -STF/2-((WTS-LBL)/2)     HTA;  % ponto 2
     DTF+LTF-WBL -STF/2-WTS+((WTS-LBL)/2) HTA;  % ponto 3
     DTF+LTF-WBL -STF/2-((WTS-LBL)/2)     HTA;  % ponto 4
     
     DTF+LTF     -STF/2-WTS+((WTS-LBL)/2) HTA+HBL;  % ponto 5
     DTF+LTF     -STF/2-((WTS-LBL)/2)     HTA+HBL;  % ponto 6
     DTF+LTF-WBL -STF/2-WTS+((WTS-LBL)/2) HTA+HBL;  % ponto 7
     DTF+LTF-WBL -STF/2-((WTS-LBL)/2)     HTA+HBL];  % ponto 8


F = [1 2 4 3
     5 6 8 7
     1 2 6 5
     3 4 8 7
     2 4 8 6
     1 3 7 5
     ];

h = patch('Vertices', V, 'Faces', F, 'FaceColor', "Red", 'FaceLighting', 'gouraud', 'EdgeColor', 'Black');