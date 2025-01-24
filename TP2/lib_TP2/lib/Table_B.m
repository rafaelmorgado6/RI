function Table_B(LTF, WTS, HTB, DTF, STF) % length, width, height, A<->B

V = [DTF+LTF     STF/2     HTB;  % ponto 1
     DTF+LTF     STF/2+WTS HTB;  % ponto 2
     DTF         STF/2     HTB;  % ponto 3
     DTF         STF/2+WTS HTB;  % ponto 4
     
     DTF+LTF STF/2     HTB-100;  % ponto 5
     DTF+LTF STF/2+WTS HTB-100;  % ponto 6
     DTF     STF/2     HTB-100;  % ponto 7
     DTF     STF/2+WTS HTB-100;  % ponto 8

     DTF+LTF STF/2     0;  % ponto 9
     DTF+LTF STF/2+WTS 0;  % ponto 10
     DTF     STF/2     0;  % ponto 11
     DTF     STF/2+WTS 0]; % ponto 12

VM = [DTF+LTF STF+WTS/1.5 HTB;
     DTF+LTF STF     HTB;
     DTF     STF+WTS/1.5 HTB;
     DTF     STF     HTB];   

F = [1 2 4 3
     5 6 8 7
     1 3 7 5
     1 2 6 5
     2 4 8 6
     3 4 8 7
     9 5 5 5
     10 6 6 6
     11 7 7 7
     12 8 8 8
     ];

FM = [1 2 4 3];

h = patch('Vertices', V, 'Faces', F, 'FaceColor', [0.8 0.8 0.8], 'FaceLighting', 'gouraud', 'EdgeColor', 'black');
hM = patch('Vertices', VM, 'Faces', FM, 'FaceColor', [0 0.7 0], 'FaceLighting', 'gouraud', 'EdgeColor', 'black');