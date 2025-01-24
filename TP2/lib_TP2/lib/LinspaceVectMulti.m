function MQ = LinspaceVectMulti(Q_full, N)

    MQ = [];
    segments = size(Q_full, 2) - 1; % Número de segmentos
    points_per_segment = floor(N / segments); % Pontos por segmento
    
    for i = 1:segments

        segment = LinspaceVect(Q_full(:, i), Q_full(:, i + 1), points_per_segment);
        if i < segments
            segment(:, end) = []; % Evitar duplicação do ponto final do segmento
        end
        MQ = [MQ, segment];
    end
end
