
%% Ex1
clear, close all, clc

L1 = 3;
L2 = 2;

Q=rad2deg(invkinRR(2,2,L1,L2))

%% Ex2
clear, close all, clc

L1 = 3;
L2 = 2;

p1 = [4; 0]';

p2 = [-1; 1]';

% Definir a matriz DH-base para o robô
DH = [0 L1 0 0 
      0 L2 0 0];

% Configurações das juntas para os pontos inicial e final (cotovelo para baixo)
Qi = invkinRR(p1(1), p1(2), L1, L2);
Qf = invkinRR(p2(1), p2(2), L1, L2);

N = 200;

% Gera N pontos espaçados entre Qi e Qf
MQ = LinspaceVect(Qi(:,1), Qf(:,1), N);

% Armazena todas as matrizes de transformação para cada uma das configurações de ângulos
MDH = GenerateMultiDH(DH, MQ);

AAA = CalculateRobotMotion(MDH);

figure
grid on
axis equal
hold on
axis([-3 6 -3 5])

[P,F] = seixos3(0.5);
AA = AAA(:,:,:,1);
org = LinkOrigins(AA);
h = DrawLinks(org); % Desenha os elos do robô com base nas origens.
H = DrawFrames(AA, P, F);
AnimateRobot(H, AAA, P, h, 0.02);


%% Ex3

clear, close all, clc

L1 = 3;
L2 = 2;

p1 = [4; 0]';
p2 = [-1; 1]';

% Definir a matriz DH-base para o robô
DH = [0 L1 0 0 
      0 L2 0 0];

% Configurações das juntas para os pontos inicial e final (cotovelo para baixo)
Qi = invkinRR(p1(1), p1(2), L1, L2);
Qf = invkinRR(p2(1), p2(2), L1, L2);

N = 200;


figure
grid on
axis equal
hold on
axis([-3 4.5 -3 4])

[H, h, P, AAA]= initRobot([Qi(:,1), Qf(:,2)], N, DH, [0 0]', 0.5);
AnimateRobot(H, AAA, P, h, 0.02);

%% Ex4
% Criar a função RoboEndPath

%% Ex5

clear, close all, clc

L1 = 4;
L2 = 2;

p1 = [4; 0]';
p2 = [-2; 2]';

% Definir a matriz DH-base para o robô
DH = [0 L1 0 0 
      0 L2 0 0];
N =200;

% Configurações das juntas para os pontos inicial e final (cotovelo para baixo)
Qi = invkinRR(p1(1), p1(2), L1, L2);
Qf = invkinRR(p2(1), p2(2), L1, L2);

figure
grid on
axis equal
hold on
axis([-3 7 -3 7])

[P,F] = seixos3(0.5);
[H, h, P, AAA]= initRobot([Qi(:,2), Qf(:,2)], N, DH, [0 0]', 0.5);

MQ1 = LinspaceVect ( Qi (: ,2) , Qf (: ,2) ,50);
MDH1 = GenerateMultiDH (DH , MQ1 );
AAA1 = CalculateRobotMotion ( MDH1 );
[x1 ,y1 ,z1 ]= RobotEndPath ( AAA1 );

MQ2 = LinspaceVect ( Qi (: ,1) , Qf (: ,2) ,50);
MDH2 = GenerateMultiDH (DH , MQ2 );
AAA2 = CalculateRobotMotion ( MDH2 );
[x2 ,y2 ,z2 ]= RobotEndPath ( AAA2 );

MQ3 = LinspaceVect ( Qi (: ,2) , Qf (: ,1) ,50);
MDH3 = GenerateMultiDH (DH , MQ3 );
AAA3 = CalculateRobotMotion ( MDH3 );
[x3 ,y3 ,z3 ]= RobotEndPath ( AAA3 );

plot3 (x1 , y1 , z1 , 'r-', x3 , y3 , z3 , 'b-', x2 , y2 , z2 , 'g-');

%% Ex6
% Criar a função invkinRRR

%% Ex7

clear, close all, clc

L1 = 2;
L2 = 1;
L3 = 1;


p1 = [2; -1]';
p2 = [2; 2.5]';

% Definir a matriz DH-base para o robô
DH = [0 L1 0 0 
      0 L2 0 0
      0 L3 0 0];

Qi = invkinRRR(p1(1), p1(2), 0, L1, L2, L3);
Qf = invkinRRR(p2(1), p2(2), 0, L1, L2, L3);

N = 200;

figure
grid on
axis equal
hold on
axis([-3 4.5 -3 4])

[H, h, P, AAA]= initRobot([Qi(:,1), Qf(:,1)], N, DH, [0 0 0]', 0.5);
AnimateRobot(H, AAA, P, h, 0.02);