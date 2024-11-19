function MQ = LinspaceVect(Qi, Qf, N)
    
% Inicializa a matriz MQ de zeros com 3 linhas(Qi) e 4 colunas(N)
    MQ = zeros(length(Qi), N);
    
% Para cada elemento de Qi e Qf, gera o linspace e armazena na linha correspondente de MQ
    for i = 1:length(Qi)

        % linha i, todas as colunas de MQ
        MQ(i, :) = linspace(Qi(i), Qf(i), N);
    end
end
