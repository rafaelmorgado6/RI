function AnimateSimple2D(h, P, M, N)
    % h: handle gráfico do objeto
    % P: matriz de vértices do objeto (2D)
    % M: matriz de transformações (cada coluna: [tx ty rα]')
    % N: número de passos para a animação
vertices = P;

% Loop sobre cada transformação em M
for j = 1:size(M, 2) %números de colunas de M
    % Extrair a transformação Mj = [tx; ty; rα]
    tx = M(1, j);
    ty = M(2, j);
    alpha = M(3, j);

    for n= linspace(0,1,N)
        dx = n*tx;
        dy = n*ty;
        da = n*alpha;
        T = TransGeom(dx,dy,da)*vertices;
        h.Vertices = T';
        pause(0.01)
    end
   vertices = T;
end
end


