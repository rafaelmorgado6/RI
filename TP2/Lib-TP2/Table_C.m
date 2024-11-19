function Table_C(LTT, WTS, HTC, STF, LTF, DTF, DTT) % length, width, height

V = [0-DTT     -WTS/2 HTC;  % ponto 1
     0-DTT      WTS/2 HTC;  % ponto 2
     0-DTT-LTT -WTS/2 HTC;  % ponto 3
     0-DTT-LTT  WTS/2 HTC;  % ponto 4
     
     0-DTT     -WTS/2 HTC-100;  % ponto 5
     0-DTT      WTS/2 HTC-100;  % ponto 6
     0-DTT-LTT -WTS/2 HTC-100;  % ponto 7
     0-DTT-LTT  WTS/2 HTC-100;  % ponto 8

     0-DTT     -WTS/2 0;  % ponto 9
     0-DTT      WTS/2 0;  % ponto 10
     0-DTT-LTT -WTS/2 0;  % ponto 11
     0-DTT-LTT  WTS/2 0]; % ponto 12

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

h = patch('Vertices', V, 'Faces', F, 'FaceColor', [0.8 0.8 0.8], 'FaceLighting', 'gouraud', 'EdgeColor', 'black');