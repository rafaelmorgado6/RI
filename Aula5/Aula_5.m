addpath '../Lib/'

%% Ex1

clear, close all, clc

N = 4;
Qi = [1 3 -2]';
Qf = [4 0 -8]';
 
LinspaceVect(Qi, Qf, N)


%% Ex2

clear, close all, clc

N = 4;
QA = [1 3 -2]';
QB = [4 0 -4]';
QC = [3 5 0]';
QD = [6 -1 3]';

MQ1 = LinspaceVect(QA, QB, N);
MQ2 = LinspaceVect(QB, QC, N);
MQ3 = LinspaceVect(QC, QD, N);

% (:, 1:end-1) -> remove a ultima coluna de MQn
MMQ = [MQ1(:, 2:end) MQ2(:, 2:end) MQ3(:, 2:end)];
plot(MMQ')
grid on


%% Ex3

clear, close all, clc

MQ = [0, pi/4, pi/2;
      0, pi/2, pi;
      0, pi/4, pi/2];

DH = [0, pi/2, 0.2, 0;
      0, 0, 0.3, 0;
      0, -pi/2, 0.4, 0];

GenerateMultiDH(DH, MQ)


%% Ex4

clear, close all, clc

L1 = 2;
L2 = 1;

Qi = [0 0]';        % Ângulos de junt iniciais
Qf = [pi/3 pi/3]';  % Ângulos de junta finais 
N = 7;              % Nº de etapas

[P, F] = seixos3(0.2);
DH = [0 L1 0 0      % Elo 1 
      0 L2 0 0];    % Elo 2

figure
grid on
axis equal

% Gera N pontos espaçados entre Qi e Qf
MQ = LinspaceVect(Qi, Qf, N);

% Armazena todas as matrizes de transformação para cada uma das configurações de ângulos
MDH = GenerateMultiDH(DH, MQ);

for n=1:size(MDH,3)
    DHn = MDH(:,:,n);    % Obter as camadas(matriz transf.) de MDH
    AA = Tlinks(DHn);   % Calcula as matrizes de transformação.
    org = LinkOrigins(AA);  % Obtém as origens dos links a partir das matrizes de transformação.
    h = DrawLinks(org); % Desenha os elos do robô com base nas origens.
    H = DrawFrames(AA, P, F) % Desenha os frames de referência com base nas matrizes de transformação.
end


%% Ex 5/6

clear, close all, clc


L1 = 1;
L2 = 1;

Qi = [0 0 0]';
Qf = [0 pi/3 1]';
N = 5;

t = [0 0 1];

% Matriz D-H RRP 
DH = [0 0 L1 pi/2  % Elo1 
      pi/2 0 0 pi/2 % Elo2
      0 0 L2 0];    % Elo3

figure
grid on
view(25,10);
axis equal
xlabel('X');
ylabel('Y');
zlabel('Z');
    

% Gera N pontos espaçados entre Qi e Qf
MQ = LinspaceVect(Qi, Qf, N);

% Armazena todas as matrizes de transformação para cada uma das configurações de ângulos
MDH = GenerateMultiDH(DH, MQ, t);

[P, F] = seixos3(0.2);

for n=1:size(MDH,3)
    DHn = MDH(:,:,n);    % Obter as camadas(matriz transf.) de MDH
    AA = Tlinks(DHn);   % Calcula as matrizes de transformação.
    org = LinkOrigins(AA);  % Obtém as origens dos links a partir das matrizes de transformação.
    h = DrawLinks(org); % Desenha os elos do robô com base nas origens.
    H = DrawFrames(AA, P, F) % Desenha os frames de referência com base nas matrizes de transformação.
end
























