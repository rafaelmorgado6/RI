
%% Ex1 
% criar função CaculateRobotMotion

%% Ex2

clear, close all, clc


L1 = 2;
L2 = 2;
L3 = 1;

Qi = [0 0 0]';
QA = [pi/2 pi/4 -pi/4]';
Qf = [0 -pi/4 pi/4]';
N = 200;

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
xlabel('X');
ylabel('Y');
zlabel('Z');

[P,F] = seixos3(0.5);
AA = AAA(:,:,:,1);
org = LinkOrigins(AA);
h = DrawLinks(org); % Desenha os elos do robô com base nas origens.
H = DrawFrames(AA, P, F);
AnimateRobot(H, AAA, P, h, 0.1);