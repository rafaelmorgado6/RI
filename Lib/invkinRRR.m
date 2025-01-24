function Q = invkinRRR(x, y, phi, L1, L2, L3)
    % invkinRRR - Calcula a cinemática inversa de um robô planar RRR
    % Entrada:
    %   x, y - Coordenadas do end-effector
    %   phi - Orientação do end-effector em radianos
    %   L1, L2, L3 - Comprimentos dos elos
    % Saída:
    %   Q - Matriz de soluções [q1A q1B; q2A q2B; q3A q3B]

    % Calcular as coordenadas do ponto Pwx e Pwy
    Pwx = x - L3 * cos(phi);
    Pwy = y - L3 * sin(phi);
    
    % Usar a função invkinRR para calcular theta1 e theta2
    Q_rr = invkinRR(Pwx, Pwy, L1, L2);

    % Adicionar a redundância para theta3
    theta3_A = phi - (Q_rr(1, 1) + Q_rr(2, 1));  % Solução A
    theta3_B = phi - (Q_rr(1, 2) + Q_rr(2, 2));  % Solução B

    % Montar a matriz de soluções
    Q = [Q_rr; theta3_A, theta3_B];
end