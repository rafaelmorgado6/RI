function AAA = CalculateRobotMotion(MDH)
    % CalculateRobotMotion calcula o movimento de todos os elos do robô e armazena 
    % em uma superhipermatriz AAA.
    %
    % Parâmetros:
    %   MDH - matriz de Denavit-Hartenberg modificada para o robô.
    %         Dimensão esperada: [num_elos, 4, num_configs]
    %
    % Retorno:
    %   AAA - hipermatriz com as transformações de todos os elos para todas
    %         as configurações. Dimensão: [4, 4, num_elos, num_configs]

    AAA = zeros(4, 4, size(MDH,1), size(MDH,3));
    
    % Itera sobre cada configuração
    for n=1:size(MDH,3)

        AA = Tlinks(MDH(:, :, n)); 
        AAA(:,:,:,n) = AA;   
    end
end