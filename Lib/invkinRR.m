function Q = invkinRR(x, y, L1, L2)
    % invkinRR - Calcula a cinemática inversa de um robô RR planar
    % Entrada:
    %   x, y - Coordenadas do ponto-alvo
    %   L1, L2 - Comprimentos dos elos do robô
    % Saída:
    %   Q - Matriz de soluções [q1A q1B; q2A q2B]
    
    cos_theta2_A = (x^2 + y^2 - L1^2 - L2^2) / (2 * L1 * L2);
    cos_theta2_A = max(-1, min(1, cos_theta2_A));
    
    theta2_A = acos(cos_theta2_A); % Solução A (cotovelo para baixo)
    theta2_B = -theta2_A;
   
    theta1_A = atan2(y * (L1 + L2 * cos(theta2_A)) - x * L2 * sin(theta2_A), x * (L1 + L2 * cos(theta2_A)) + y * L2 * sin(theta2_A));
    theta1_B = atan2(y * (L1 + L2 * cos(theta2_B)) - x * L2 * sin(theta2_B), x * (L1 + L2 * cos(theta2_B)) + y * L2 * sin(theta2_B));

    Q = [theta1_A, theta1_B;
         theta2_A, theta2_B];

end