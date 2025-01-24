function AA = Tlinks(DH)
    % Função para gerar a matriz de transformação para todos os elos
    % com base na matriz de Denavit-Hartenberg (DH).
    % DH é uma matriz onde cada linha contém [theta, l, d, alpha]
    
    AA = zeros(4,4,size(DH,1));
    for r = 1: size(DH,1) % nº de linhas 
        
        % Esses quatro parâmetros são passados para a função Tlink, que calcula a matriz de transformação associada a esse elo específico.
        An = Tlink(DH(r,1),DH(r,2),DH(r,3),DH(r,4));
        
        AA(:,:,r) = An;
    
    end