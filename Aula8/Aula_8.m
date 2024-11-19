
%% Ex1
% Criar função invkinRRRantro

%% Ex2
clear, close all, clc

L1 = 2;
L2 = 3;
L3 = 1;

A = [3, -1, 0]';
B = [-1, 1, 4]';            

DH = [0 0 L1 pi/2
      0 L2 0 0
      0 L3 0 0];

QA = invkinRRRantro(A(1), A(2), A(3), L1, L2, L3);
QB = invkinRRRantro(B(1), B(2), B(3), L1, L2, L3);

N = 200;

subplot(2, 2, 1); % Cria uma grade de 1x2, selecionando o primeiro gráfico
grid on;
hold on;
axis equal;
view(140, 35);
xlim([-4 4]);
ylim([-4 4]);
zlim([-3 6]);
[H1, h1, P1, AAA1]= initRobot([QA(:,1), QB(:,1)], N, DH, [0 0 0]', 0.8);
AnimateRobot(H1, AAA1, P1, h1, 0.02);

subplot(2, 2, 2); % Cria uma grade de 1x2, selecionando o primeiro gráfico
grid on;
hold on;
axis equal;
view(140, 35);
xlim([-4 4]);
ylim([-3 3]);
zlim([-3 6]);
[H2, h2, P2, AAA2]= initRobot([QA(:,1), QB(:,2)], N, DH, [0 0 0]', 0.8);
AnimateRobot(H2, AAA2, P2, h2, 0.02);

subplot(2, 2, 3); % Cria uma grade de 1x2, selecionando o primeiro gráfico
grid on;
hold on;
axis equal;
view(140, 35);
xlim([-4 4]);
ylim([-4 4]);
zlim([-3 6]);
[H3, h3, P3, AAA3]= initRobot([QA(:,1), QB(:,3)], N, DH, [0 0 0]', 0.8);
AnimateRobot(H3, AAA3, P3, h3, 0.02);

subplot(2, 2, 4); % Cria uma grade de 1x2, selecionando o primeiro gráfico
grid on;
hold on;
axis equal;
view(140, 35);
xlim([-4 4]);
ylim([-4 4]);
zlim([-3 6]);
[H4, h4, P4, AAA4]= initRobot([QA(:,2), QB(:,3)], N, DH, [0 0 0]', 0.8);
AnimateRobot(H4, AAA4, P4, h4, 0.02);

%% Ex3 
% Criar a função invkinSCARA

%% EX4

clear;
close all;
clc;

% Comprimentos dos elos
LA = 3;
LB = 2;
LC = 1;
LD = 1;

% Parâmetros DH para robô SCARA
DH = [0 0 LA 0;
      0 LB 0 pi;
      0 LC 0 0;
      0 0 0 0;
      0 0 LD 0];

% Posições desejadas para o robô alcançar
PP = [
    0, -2, 0, 0;
    2, -2, 0, 0;
    4,  0, 0, 0;
    2,  2, 0, 0;
    0,  2, 0, 0;
];

% Configurações da figura
figure
view(45,30)
grid on 
axis equal
hold on
axis([-4 4 -4 4 -2 4])
xlabel('X');
ylabel('Y');
zlabel('Z');


% Cálculo da cinemática inversa para cada ponto em `PP`
QQ = []; % Inicializa matriz de posições articulares
for n = 1:size(PP, 1)
    Q = invkinSCARA(PP(n,1), PP(n,2), PP(n,3), PP(n,4), LA, LB, LC, LD);
    r=1;
    QQ(:,n)=Q(:,r) ; % Adiciona cada configuração de junta em `QQ`
end

% Adiciona uma linha de zeros, conforme a sua abordagem anterior
QQ = [QQ(1,:); zeros(1, width(QQ)); QQ(2:end,:)];

NN = 30;  % Número de quadros para interpolação suave

% Inicializa e anima o robô
[H, h, P, AAA] = initRobot(QQ, NN, DH, [0 0 0 1]', 0.5);
AnimateRobot(H, AAA, P, h, 0.02);


%% Ex5 

clear;
close all;
clc;

% Comprimentos dos elos
LA = 3;
LB = 2;
LC = 1;
LD = 1;

% Parâmetros DH para robô SCARA
%     θ d a  α
DH = [0 0 LA 0;
      0 LB 0 pi;
      0 LC 0 0;
      0 0 0 0;  % Junta prismática
      0 0 LD 0];

% Posições desejadas para o robô alcançar
PP =[0 -2 2 0 % new
     0 -2 0 0
     0 -2 2 0 %new
     2 -2 2 0 %new
     2 -2 0 0
     2 -2 2 0 %new
     4 0 2 0 % new
     4 0 0 0
     4 0 2 0 % new
     2 2 2 0 % new
     2 2 0 0
     2 2 2 0 % new
     0 2 2 0 % new
     0 2 0 0
     0 2 2 0 % new
     ];

% Configurações da figura
figure
view(45,30)
grid on 
axis equal
hold on
axis([-4 4 -4 4 -2 4])
xlabel('X');
ylabel('Y');
zlabel('Z');


% Cálculo da cinemática inversa para cada ponto em `PP`
QQ = []; % Vai guardar os parametros da cinematica inversa

for n = 1:size(PP, 1)
    Q = invkinSCARA(PP(n,1), PP(n,2), PP(n,3), PP(n,4), LA, LB, LC, LD);
    r=1; % Redundância
    QQ(:,n)=Q(:,r) ; % Adiciona cada configuração de junta em `QQ`
end

% Adiciona uma linha de zeros, conforme a sua abordagem anterior
QQ = [QQ(1,:); zeros(1, width(QQ)); QQ(2:end,:)];

NN = 30;  % Número de quadros para interpolação suave

% Inicializa e anima o robô
[H, h, P, AAA] = initRobot(QQ, NN, DH, [0 0 0 1]', 0.5);
AnimateRobot(H, AAA, P, h, 0.02);

