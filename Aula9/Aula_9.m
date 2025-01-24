
%% Ex1

clear, close all, clc;

L1 = 3;
L2 = 2;

A = [4, 0]';
B = [-3, 1]';

N = 100;

% Definição do vetor DH para o robô
DH = [0, L1, 0, 0;
      0, L2, 0, 0];

QA = invkinRR(A(1), A(2), L1, L2);
QB = invkinRR(B(1), B(2), L1, L2);

dq = (QB(:,1) - QA(:,1)) / N;

dR = [];

q = QA(:,1);

subplot(1,2,1)
hold on;
grid on;    

subplot(1,2,2)
hold on;
grid on;
[H,h,P,~] = initRobot([QA(:,1) QA(:,1)], N, DH, [0 0], 0.5);

for k=1:N
    q = q + dq;
    J = jacobianRR(q, L1, L2);
    dr = J * dq;
    dr(:, k) = dr;

    subplot(1,2,1)
    plot(k, dr(1), '+r')
    plot(k, dr(2), '*b')

    subplot(1,2,2)
    MDH = GenerateMultiDH(DH, q, [0 0]');
    AAA = CalculateRobotMotion(MDH);
    AnimateRobot(H,AAA,P,h, 0.1);

    pause(1/100)

end

%% Ex2

clear, close all, clc;

L1 = 3;
L2 = 2;

A = [4, 0]';
B = [-3, 1]';

N = 100;

% Definição do vetor DH para o robô
DH = [0, L1, 0, 0;
      0, L2, 0, 0];

QA = invkinRR(A(1), A(2), L1, L2);
QB = invkinRR(B(1), B(2), L1, L2);

dq = (QB(:,2) - QA(:,2)) / N;

dR = [];

q = QA(:,1);

subplot(1,2,1)
hold on;
grid on;    

subplot(1,2,2)
hold on;
grid on;
[H,h,P,~] = initRobot([QA(:,2) QA(:,2)], N, DH, [0 0]', 0.5);

for k=1:N
    q = q + dq;
    J = jacobianRR(q, L1, L2);
    dr = J * dq;
    dR(:, k) = dr;

    subplot(1,2,1)
    plot(k, dr(1), '+r')
    plot(k, dr(2), '*b')

    subplot(1,2,2)
    MDH = GenerateMultiDH(DH, q, [0 0]');
    AAA = CalculateRobotMotion(MDH);
    AnimateRobot(H,AAA,P,h, 0.1);

    pause(1/100)

end



%% Ex4

clear, close all, clc;

L1 = 3;
L2 = 2;
L3 = 1;

DH = [0 0 L1 pi/2
      0 L2 0 0
      0 L3 0 0];

Q = [pi/2 0 -pi/2]';
MDH = GenerateMultiDH(DH,Q);
AA = Tlinks(MDH(:,:,1));
Z = jointAxis(AA);
initRobot([Q Q], 1, DH, [0 0 0]', 0.75);

hold on;
grid on;
xlabel('x');
ylabel('y');
zlabel('z');
axis equal;
axis([-2 2 -1 4 -1 5 ]); % Mantém proporções corretas
view(140,25);

%% Ex5

clear, close all, clc;

L1 = 3;
L2 = 2;

DH = [0 L1 0 0
      0 L2 0 0];

Q = [0 pi/4]';

Janalitico = jacobianRR(Q, L1, L2);

MDH = GenerateMultiDH(DH, Q);
AA = Tlinks(MDH(:,:,1));

Jgeometrico = jacobianGeom(AA, [0 0]);

%% Ex6

clear, close all, clc;

L1 = 3; 
L2 = 2;

DH = [0 L1 0 0;
      0 L2 0 0];

B = [-4 3]';
A = [4 0]';

QA = invkinRR(A(1), A(2), L1, L2);
QB = invkinRR(B(1), B(2), L1, L2);
Qi = QA(:, 2);  % Redundância elbow up

N = 100;
dr = (B - A) / N;

Q = Qi;
allQ = Q;
jTyp = [0 0]';

for n = 1:N-1
    MDH = GenerateMultiDH(DH, Q, jTyp);
    AA = Tlinks(MDH(:, :, 1));
    J = jacobianGeom(AA, jTyp);
    J(3:6, :) = [];
    Ji = inv(J);
    dq(:, n) = Ji * dr;
    Q = Q + dq(:, n);
    allQ = [allQ Q];
end

% Figura para plotar velocidades angulares
figure
subplot(1, 2, 1)
dq1 = dq(1, :) / (1 / N);
dq2 = dq(2, :) / (1 / N);
plot(dq1, 'r.');
hold on
plot(dq2, 'b+');
legend({'angular speed - 𝜃1', 'angular speed - 𝜃2'});
grid on;
xlabel('iteration/time');
ylabel('angular speed');

% Animação do robô
subplot(1, 2, 2); 
hold on; grid on;
axis equal; axis([-6 6 -5 8 -1 8]);
xlabel('XX'); ylabel('YY'); zlabel('ZZ');
view(0, 90);
grid on;

NN = 3;
QQ = allQ;
jTypes = [0 0]';
[H, h, p, AAA] = initRobot(QQ, NN, DH, jTypes, 0.75);
%pause;
AnimateRobot(H, AAA, p, h, 0.01);
disp('Finish')

%% Ex7

clear, close all, clc;

% Comprimentos dos elos
L1 = 3; 
L2 = 2; 
L3 = 1;

% Parâmetros DH do robô RRR
DH = [0 L1 0 0;
      0 L2 0 0;
      0 L3 0 0];

% Pontos inicial e final no espaço operacional
A = [4; 0; 0];    % Ponto inicial (x, y, φ)
B = [-3; 4; 0];   % Ponto final (x, y, φ)

% Orientação inicial e final do efetuador
phi_A = 0;        % Ângulo inicial do efetuador
phi_B = pi/2;     % Ângulo final do efetuador

% Vetores de orientação inicial e final
eul_A = [0; 0; phi_A];
eul_B = [0; 0; phi_B];

% Número de passos da simulação
N = 100;

% Incrementos no espaço operacional
dr = [(B - A); eul_B - eul_A] / N;

% Cinemática inversa para calcular a configuração inicial
QA = invkinRRR(A(1), A(2), phi_A, L1, L2, L3); % Configuração inicial
Q = QA(:,1); % Configuração atual
allQ = Q; % Inicializa histórico das configurações

% Tipo das juntas (todas rotacionais)
jTypes = [0 0 0]';

% Loop para simulação do movimento
for n = 1:N-1
    % Geração da matriz DH
    MDH = GenerateMultiDH(DH, Q, jTypes);
    
    % Cálculo do Jacobiano geométrico completo
    AA = Tlinks(MDH(:, :, 1));
    J = jacobianGeom(AA, jTypes);
    
    % Remover as linhas desnecessárias para planaridade
    J(3:5, :) = [];
    
    % Inversa do Jacobiano para calcular velocidades articulares
    Ji = inv(J);
    dq = Ji * dr([1 2 6]); % Considera apenas (dx, dy, dϕ)
    
    % Atualizar configuração das juntas
    Q = Q + dq;
    allQ = [allQ Q]; % Salva as configurações ao longo do tempo
end

% Figura para plotar velocidades angulares
figure;
subplot(1, 2, 1);
dq1 = diff(allQ(1, :)) / (1 / N);
dq2 = diff(allQ(2, :)) / (1 / N);
dq3 = diff(allQ(3, :)) / (1 / N);
plot(dq1, 'r.', 'DisplayName', 'dθ1/dt');
hold on;
plot(dq2, 'b.', 'DisplayName', 'dθ2/dt');
plot(dq3, 'g.', 'DisplayName', 'dθ3/dt');
legend();
grid on;
xlabel('Iteration');
ylabel('Angular Speed (rad/s)');
title('Velocidades Angulares das Juntas');

% Animação do robô
subplot(1, 2, 2);
hold on; grid on;
axis equal; axis([-6 6 -5 8 -1 8]);
xlabel('X'); ylabel('Y'); zlabel('Z');
view(0, 90);
grid on;

NN = 1;
QQ = allQ;
[H, h, p, AAA] = initRobot(QQ, NN, DH, jTypes, 0.75);
AnimateRobot(H, AAA, p, h, 0.01);
disp('Simulação Finalizada');

%% Ex8 - Movimento Subdefinido do Robô RRR Planar

clear, close all, clc;

% Comprimentos dos elos
L1 = 3; 
L2 = 2; 
L3 = 1;

% Parâmetros DH do robô RRR
DH = [0 L1 0 0;
      0 L2 0 0;
      0 L3 0 0];

% Pontos inicial e final no espaço operacional
A = [4; 0];    % Ponto inicial (x, y)
B = [-3; 4];   % Ponto final (x, y)

% Número de passos da simulação
N = 100;

% Incrementos no espaço operacional
dr = (B - A) / N;

% Cinemática inversa para calcular a configuração inicial
QA = invkinRRR(A(1), A(2), 0, L1, L2, L3); % Configuração inicial
Q = QA(:, 1); % Configuração atual (elbow-down)
allQ = Q; % Inicializa histórico das configurações

% Tipo das juntas (todas rotacionais)
jTypes = [0 0 0]';

% Loop para simulação do movimento
for n = 1:N-1
    % Geração da matriz DH
    MDH = GenerateMultiDH(DH, Q, jTypes);
    
    % Cálculo do Jacobiano geométrico completo
    AA = Tlinks(MDH(:, :, 1));
    J = jacobianGeom(AA, jTypes);
    
    % Reduz o Jacobiano para considerar apenas dx e dy
    J = J(1:2, :); % Considera apenas as duas primeiras linhas
    
    % Calcula a pseudo-inversa do Jacobiano (3x2)
    Ji = pinv(J);
    dq = Ji * dr; % Considera apenas dx e dy
    
    % Atualizar configuração das juntas
    Q = Q + dq;
    allQ = [allQ Q]; % Salva as configurações ao longo do tempo
end

% Figura para plotar velocidades angulares
figure;
subplot(1, 2, 1);
dq1 = diff(allQ(1, :)) / (1 / N);
dq2 = diff(allQ(2, :)) / (1 / N);
dq3 = diff(allQ(3, :)) / (1 / N);
plot(dq1, 'r.', 'DisplayName', 'dθ1/dt');
hold on;
plot(dq2, 'b.', 'DisplayName', 'dθ2/dt');
plot(dq3, 'g.', 'DisplayName', 'dθ3/dt');
legend();
grid on;
xlabel('Iteration');
ylabel('Angular Speed (rad/s)');
title('Velocidades Angulares das Juntas');

% Animação do robô
subplot(1, 2, 2);
hold on; grid on;
axis equal; axis([-6 6 -5 8 -1 8]);
xlabel('X'); ylabel('Y'); zlabel('Z');
view(0, 90);
grid on;

NN = 1;
QQ = allQ;
[H, h, p, AAA] = initRobot(QQ, NN, DH, jTypes, 0.75);
AnimateRobot(H, AAA, p, h, 0.01);
disp('Simulação Finalizada');
