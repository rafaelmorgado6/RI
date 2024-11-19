addpath '../Lib/'

%% Ex1

clear, close all, clc

DH = [0 3 0 0
      0 1.5 0 0];

A1 = Tlink(DH(1,1), DH(1,2), DH(1,3), DH(1,4))
A2 = Tlink(DH(2,1), DH(2,2), DH(2,3), DH(2,4))

AA = Tlinks(DH)

%% EX2b 

clear, close all, clc

DH = [-pi/4 1 0 0
      pi/2 1.5 0 0
      -pi/3 0.5 0 0];

AA = Tlinks(DH);

Org = LinkOrigins(AA)

%% Ex3


clear, close all, clc

DH = [-pi/4 1 0 0
      pi/2 1.5 0 0
      -pi/3 0.5 0 0];

[P,F] = seixos3(0.4)
axis equal
grid on
AA = Tlinks(DH);

Org = LinkOrigins(AA)
DrawLinks(Org);
DrawFrames(AA, P, F)

%% Ex4

L1 = 3;
L2 = 2;
L3 = 2;


% RR planar:
DH_RR = [0 L1 0 0
         0 L2 0 0];


[P,F] = seixos3(0.8);
subplot(2, 2, 1);
axis equal
grid on
title("RR planar")

AA = Tlinks(DH_RR);
Org = LinkOrigins(AA);
DrawLinks(Org);
DrawFrames(AA, P, F)


% RRR planar:
DH_RRR = [0 L1 0 0
          0 L2 0 0
          0 L3 0 0];


[P,F] = seixos3(0.8);
subplot(2, 2, 2);
axis equal
grid on
title("RRR planar")

AA = Tlinks(DH_RRR);
Org = LinkOrigins(AA);
DrawLinks(Org);
DrawFrames(AA, P, F)


% RR a 3D:
DH_RR3D = [0 0 L1 pi/2
           0 L2 0 0];


[P,F] = seixos3(0.8);
subplot(2, 2, 3);
axis equal
grid on
view(3)
title("RR a 3D")

AA = Tlinks(DH_RR3D);
Org = LinkOrigins(AA);
DrawLinks(Org);
DrawFrames(AA, P, F)


% RRR antropomorfico:
DH_RRA = [0 0 L1 pi/2
          0 L2 0 0
          0 L3 0 0];

[P,F] = seixos3(0.8);
subplot(2, 2, 4);
axis equal
grid on
view(3)
title("RRR antropomrfico:")

AA = Tlinks(DH_RRA);
Org = LinkOrigins(AA);
DrawLinks(Org);
DrawFrames(AA, P, F)


%% Ex5

clear, close all, clc

L1 = 3;
L2 = 3;
L3 = 2;

DH = [0 0 L1 pi/2
      pi/4 L2 0 0
      -pi/4 L3 0 0];

[P,F] = seixos3(0.8);
axis equal
grid on
view(3)
title("RRR antropomrfico:")

AA = Tlinks(DH);
Org = LinkOrigins(AA);
DrawLinks(Org);
DrawFrames(AA, P, F)

%% Ex6

clear, close all, clc

D = 0.2;    % altura/largura do paralelipipdo
L = 1;      % comprimento do paralelipipdo 
d = 1.5;    % d*D -> largura base da pirâmide
f = 0.15;   % f*L -> altura da pirâmide

[V,F] = seta3Dx(); %seta3Dx(D, L, d, f)

% Criar a figura
figure;

% Plotar o paralelepípedo
patch('Vertices', V, 'Faces', F, 'FaceColor', 'b', 'FaceAlpha', 1); % Azul
hold on; 

% Configurações do gráfico
grid on;
xlabel('X');
ylabel('Y');
zlabel('Z');
view(135, 25);
axis equal;
axis([-5 5 -5 5 -5 5]); % Ajuste dos eixos para melhor visualização

hold off; % Liberar o gráfico


%% Ex7 errado
clear, close all, clc

[V,F] = setas3D();

grid on;
xlabel('X');
ylabel('Y');
zlabel('Z');
view(135, 25);
axis equal;
axis([-20 20 -20 20 -20 20]); % Ajuste dos eixos para melhor visualização

T2 = hrotz(-pi/2);
%V_homog = [V, ones(size(V, 1), 1)]';
V2 = T2 * V_homog;

h1=patch('Vertices',V2(1:3,:)','Faces',F,'FaceColor','g')

T3 = hrotx(pi/2);
V3 = T3 * V2;
h2=patch('Vertices',V3(1:3,:)','Faces',F,'FaceColor','b')

T4 = hrotz(-pi/2);
V4 = T4 * V2;
h3=patch('Vertices',V4(1:3,:)','Faces',F,'FaceColor','r')



