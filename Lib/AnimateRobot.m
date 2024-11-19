function AnimateRobot(H, AAA, P, h, sd)
    % Parâmetros:
    %   H  - handles gráficos dos objetos a animar (desenhados por DrawFrames).
    %   AAA - superhipermatriz com a sequência temporal de hipermatrizes 
    %         calculadas por CalculateRobotMotion.
    %   P  - objeto a representar (sistema coordenadas: seixos3).
    %   h  - handle gráfico dos elos do robô (vem de DrawLinks).
    %   sd - indicador do nível de pausa entre passos da animação 
    %        (controla a velocidade da animação).

    for n=1:size(AAA, 4)
        
        AA = AAA(:,:,:,n);

        org = LinkOrigins(AA);  % Obtém as origens dos links a partir das matrizes de transformação.
        
        h.XData = org(1,:);
        h.YData = org(2,:);
        h.ZData = org(3,:);
        
        T = eye(4);
        
        for k=1:size(AA, 3)

            T = T*AA(:,:,k);
            
            Pn = T*P;

            H(k+1).Vertices = Pn(1:3,:)';

        end

         % Adiciona um ponto na posição atual
        plot3(org(1, end), org(2, end), org(3, end), '.r');
        
        pause(sd)
    end