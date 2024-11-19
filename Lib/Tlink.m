function A = Tlink(theta, l, d, alpha)
    % Função para criar a matriz de transformação associada a um elo
    % utilizando os parâmetros de Denavit-Hartenberg (D-H).

    A = hrotz(theta)*htrans(l,0,d)*hrotx(alpha);