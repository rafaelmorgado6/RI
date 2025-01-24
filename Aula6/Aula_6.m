
%% Ex1 
% criar função CaculateRobotMotion

%% Ex2
% criar função AnimateRobot

%% Ex3

clear, close all, clc


L1 = 2;
L2 = 2;
L3 = 1;


Qi = [0 0 0]';
QA = [pi/2 pi/4 -pi/4]';
Qf = [0 -pi/4 pi/4]';
N = 50;

% Matriz D-H RRP 
DH = [0 0 L1 pi/2  % Elo1 
      0 L2 0 0 % Elo2
      0 L3 0 0];    % Elo3
    

% Gera N pontos espaçados entre Qi e Qf
MQ = LinspaceVect(Qi, QA, N), LinspaceVect(Qi, Qf, N);

% Armazena todas as matrizes de transformação para cada uma das configurações de ângulos
MDH = GenerateMultiDH(DH, MQ);

AAA = CalculateRobotMotion(MDH);

figure
grid on
view(140, 35);
axis equal
hold on
xlabel('X');
ylabel('Y');
zlabel('Z');

[P,F] = seixos3(0.5);
AA = AAA(:,:,:,1);
org = LinkOrigins(AA);
h = DrawLinks(org); % Desenha os elos do robô com base nas origens.
H = DrawFrames(AA, P, F);
AnimateRobot(H, AAA, P, h, 0.1);


%% Ex4

close all; clear; clc;

LA = 4;
LB = 3;
LC = 3;
LD = 0.1;
t = [0 0 0 1];
Qi = [0 0 0 0]';
Qf = [pi/2 -pi/4 2 pi/6]';
[P,F] = seixos3(0.3);
N = 30;
Dh = [0 0 LA 0
    0 LB 0 0
    0 LC 0 pi
    0 0 LD 0];


MQ = [LinspaceVect(Qi,Qf,N), LinspaceVect(Qf,Qi,N)];

MDH = GenerateMultiDH(Dh, MQ, t);

AAA = CalculateRobotMotion(MDH);

AA = AAA(:,:,:,1);
org = LinkOrigins(AA);
h = DrawLinks(org);
H = DrawFrames(AA,P,F);

hold on
grid on
axis equal
view(3)

sd = 0.05;
AnimateRobot(H,AAA,P,h,sd);