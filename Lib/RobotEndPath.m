function [X,Y,Z] = RobotEndPath(AAA)
% RobotEndPath: Calcula o caminho do end-effector do robô a partir das hipermatrizes de transformação.
% 
% Parâmetros:
%   AAA - Sequência de hipermatrizes calculadas por CalculateRobotMotion.
% 
% Retorna:
%   X, Y, Z - Vetores das coordenadas sucessivas do end-effector do robô.

P = zeros(3, size(AAA,4));

% Loop sobre cada configuração do robô
for n =1: size (AAA ,4)
    A= eye(4);
    
    % Loop sobre cada elo do robô
    for k =1: size (AAA ,3)
       
 % Multiplica a matriz acumulada pela matriz de transformação do k-ésimo elo
        A = A * AAA(:,:,k,n);  
    end
    
     % Armazena as coordenadas do end-effector na matriz P
        % A posição do end-effector é dada pela 4ª coluna da matriz de transformação A
    P(:,n) = A(1:3,4);
end

X = P(1,:);
Y = P(2,:);
Z = P(3,:);
