addpath '../Lib/'

%% Ex1

clear all; close all; clc

P1 = [0.5 0 0 1]';
P2 = [0.5 2 0 1]';
P3 = [1 2 0 1]';
P4 = [0 3 0 1]';
P5 = [-1 2 0 1]';
P6 = [-0.5 2 0 1]';
P7 = [-0.5 0 0 1]';

A1 = [P1 P2 P3 P4 P5 P6 P7]; 

hold on;
grid on;
view(135, 25)
xlabel('X');
ylabel('Y');
zlabel('Z');
axis([-1 7 -1 7 -1 7])

line([0 0]', [0 0]', [0 10]');
line([0 10]', [0 0]', [0 0]');
line([0 0]', [0 10]', [0 0]');

traj = [0 0 0 4 4 4
        0 0 6 6 6 0
        0 5 5 5 0 0];

pp = line(traj(1,:)', traj(2,:)', traj(3,:)')
pp.LineStyle='-.';
pp.Color='r';

[P,F]=seixos3(); 
% P -> Lista de pontos
% F -> Lista de faces

patch('Vertices',P(1:3,:)','Faces',F,'FaceColor','g')

T2 = htrans(0,0,5) * hrotx(-pi/2);
P2 = T2 * P;
patch('Vertices',P2(1:3,:)','Faces',F,'FaceColor','b')

T3 = T2 * htrans(0, 0, 6) * hroty(pi/2)
P3 = T3 * P;
patch('Vertices',P3(1:3,:)','Faces',F,'FaceColor','b')

T4 = T3 * htrans(0, 0, 4) * hrotx(-pi/2)
P4 = T4 * P;
patch('Vertices',P4(1:3,:)','Faces',F,'FaceColor','b')

T5 = T4 * htrans(0, 0, 5) * hroty(pi/2)
P5 = T5 * P;
patch('Vertices',P5(1:3,:)','Faces',F,'FaceColor','b')


T6 = T5 * htrans(0, 0, 6) * hrotx(-pi/2)
P6 = T6 * P;
patch('Vertices',P6(1:3,:)','Faces',F,'FaceColor','b')

%% Ex2

clear all; close all; clc

A = mhrotx(linspace(0, pi/2, 2));
% vai de 0 a pi/2 e tem duas medidas(0 e pi/2)

%% Ex3

clear all; close all; clc

A = mhtrans([1, 2], [0, 1], [3, 4]);

%% Ex5 

clear all; close all; clc

P1 = [0.5 0 0 1]';
P2 = [0.5 2 0 1]';
P3 = [1 2 0 1]';
P4 = [0 3 0 1]';
P5 = [-1 2 0 1]';
P6 = [-0.5 2 0 1]';
P7 = [-0.5 0 0 1]';

A1 = [P1 P2 P3 P4 P5 P6 P7]; 

hold on;
grid on;
view(135, 25)
xlabel('X');
ylabel('Y');
zlabel('Z');
axis([-1 7 -1 7 -1 7])

[P,F]=seixos3(); 
% P -> Lista de pontos
% F -> Lista de faces

h = patch('Vertices',P(1:3,:)','Faces',F,'FaceColor','g')

NN = 20
T(:,:,:,1) = mhtrans(0,0,linspace(0,5,NN));
T(:,:,:,2) = mhrotx(linspace(0,-pi/2,NN));
T(:,:,:,3) = mhtrans(0,linspace(0,6,NN),0);
T(:,:,:,4) = mhroty(linspace(0,pi/2,NN));
T(:,:,:,5) = mhtrans(linspace(0,4,NN),0,0);
T(:,:,:,6) = mhrotx(linspace(0,-pi/2,NN));
T(:,:,:,7) = mhtrans(0,0,linspace(0,-5,NN));
T(:,:,:,8) = mhroty(linspace(0,pi/2,NN));
T(:,:,:,9) = mhtrans(0,-linspace(0,5,NN),0);
T(:,:,:,10) = mhrotx(linspace(0,-pi/2,NN));



order = [0 1 0 1 0 1 0 1 0 1];

Tcurr = eye(4,4);
for n=1:size(T,4)
    Tcurr = manimate(h, P, Tcurr, T(:,:,:,n), order(n));
    pause(0.05)
end

%% Ex 6/7

clear all; close all; clc

%Definition of vertices
points=[1 -1 0   %point 1
        1  1 0   %point 2
       -1  1 0   %point 3
       -1 -1 0   %point 4
        0  0 2]; %point 5
             
% homogeneous version for transformations
hpoints=[points';ones(1,size(points,1))];

%definition of faces
Faces1 = [1 2 5 5   %face1
          2 3 5 5   %face2
          3 4 5 5   %face3
          4 1 5 5   %face4
          1 2 3 4]; %face5

%simple color index to paint the faces
fColor= [0 1 0; % verde
         1 0.5 0; % laranja
         0 0 1; % azul
         1 1 0; % amarelo
         1 0 0]; % laranja

hold on;
grid on;
view(135, 25)
xlabel('X');
ylabel('Y');
zlabel('Z');
axis([-5 5 -5 5 -5 5])
 
patch('Vertices', points, 'Faces', Faces1,'FaceVertexCData', fColor, 'FaceColor', 'flat');

T2 = htrans(4,0,0)
P2 = T2 * hpoints;
patch('Vertices', P2(1:3,:)', 'Faces', Faces1,'FaceVertexCData', fColor, 'FaceColor', 'flat');

%% Ex 8

clear all; close all; clc

%Definition of vertices
points=[1 -1 0   %point 1
        1  1 0   %point 2
       -1  1 0   %point 3
       -1 -1 0   %point 4
        0  0 2]; %point 5
             
% homogeneous version for transformations
hpoints=[points';ones(1,size(points,1))];

%definition of faces
Faces1 = [1 2 5 5   %face1
          2 3 5 5   %face2
          3 4 5 5   %face3
          4 1 5 5   %face4
          1 2 3 4]; %face5

%simple color index to paint the faces
fColor= [0 1 0; % verde
         1 0.5 0; % laranja
         0 0 1; % azul
         1 1 0; % amarelo
         1 0 0]; % laranja

hold on;
grid on;
view(135, 25)
xlabel('X');
ylabel('Y');
zlabel('Z');
axis([-8 8 -8 8 -8 8])
 
h = patch('Vertices', points, 'Faces', Faces1,'FaceVertexCData', fColor, 'FaceColor', 'flat');

NN = 20
T(:,:,:,1) = mhtrans(0,0,linspace(0,5,NN));
T(:,:,:,2) = mhrotx(linspace(0,-pi/2,NN));
T(:,:,:,3) = mhtrans(0,linspace(0,6,NN),0);
T(:,:,:,4) = mhroty(linspace(0,pi/2,NN));
T(:,:,:,5) = mhtrans(linspace(0,4,NN),0,0);
T(:,:,:,6) = mhrotx(linspace(0,-pi/2,NN));
T(:,:,:,7) = mhtrans(0,0,linspace(0,-5,NN));
T(:,:,:,8) = mhroty(linspace(0,pi/2,NN));
T(:,:,:,9) = mhtrans(0,0,linspace(0,5,NN));
T(:,:,:,10) = mhrotx(linspace(0,-pi/2,NN));

order = [0 1 0 1 0 1 0 1 1 1];
Tcurr = eye(4,4);
for n=1:size(T,4)
    Tcurr = manimate(h, hpoints, Tcurr, T(:,:,:,n), order(n));
    pause(0.05)
end

%% Ex 9

close all, clear all, clc

P1 = [0.5 0 0 1]';
P2 = [0.5 2 0 1]';
P3 = [1 2 0 1]';
P4 = [0 3 0 1]';
P5 = [-1 2 0 1]';
P6 = [-0.5 2 0 1]';
P7 = [-0.5 0 0 1]';

A1 = [P1 P2 P3 P4 P5 P6 P7]; 

[P,F]=seixos3(); 
% P -> Lista de pontos
% F -> Lista de faces

% Passo 2: Definir os ângulos de Euler (convertidos para radianos)
eul1 = deg2rad([0, 0, 60]);  
eul2 = deg2rad([0, -30, 60]); 
eul3 = deg2rad([45, -30, 60]);  % Ângulos [45º, -30º, 60º]

% Converter os ângulos de Euler para matriz de transformação homogênea
tform1 = eul2tform(eul1);  % Rotação ZYX por padrão
tform2 = eul2tform(eul2);  
tform3 = eul2tform(eul3);  

% Passo 3: Aplicar a transformação aos vértices do objeto
P_transformed1 = tform1 * P;  % Multiplicação da matriz de transformação pelos vértices homogêneos
P_transformed2 = tform2 * P;
P_transformed3 = tform3 * P;

figure;
hold on;
grid on;
view(135, 25)
xlabel('X');
ylabel('Y');
zlabel('Z');
title("[0, 0, 60]");
axis([-5 5 -5 5 -5 5])
line([0 0]', [0 0]', [0 10]');
line([0 10]', [0 0]', [0 0]');
line([0 0]', [0 10]', [0 0]');
patch('Vertices',P_transformed1(1:3,:)','Faces',F,'FaceColor','y')

figure;
hold on;
grid on;
view(135, 25)
xlabel('X');
ylabel('Y');
zlabel('Z');
title("[0, -30, 60]");
axis([-5 5 -5 5 -5 5])
line([0 0]', [0 0]', [0 10]');
line([0 10]', [0 0]', [0 0]');
line([0 0]', [0 10]', [0 0]');
patch('Vertices',P_transformed2(1:3,:)','Faces',F,'FaceColor','y')

figure;
hold on;
grid on;
view(135, 25)
xlabel('X');
ylabel('Y');
zlabel('Z');
title("[45, -30, 60]");
axis([-5 5 -5 5 -5 5])
line([0 0]', [0 0]', [0 10]');
line([0 10]', [0 0]', [0 0]');
line([0 0]', [0 10]', [0 0]');
patch('Vertices',P_transformed3(1:3,:)','Faces',F,'FaceColor','y')

T = eul2tform(deg2rad([45, 0, 0])) * eul2tform(deg2rad([0, -30, 0])) * eul2tform(deg2rad([0, 0, 60]));
P_transformedT = T * P;
figure;
hold on;
grid on;
view(135, 25)
xlabel('X');
ylabel('Y');
zlabel('Z');
title("T");
axis([-5 5 -5 5 -5 5])
line([0 0]', [0 0]', [0 10]');
line([0 10]', [0 0]', [0 0]');
line([0 0]', [0 10]', [0 0]');
patch('Vertices',P_transformedT(1:3,:)','Faces',F,'FaceColor','y')