function [Tlast1, Tlast2] = manimate_both(h1, P1, Tcurr1, Tset1, h2, P2, Tcurr2, Tset2, ord)
    % Animação para duas figuras
    % h1, P1, Tcurr1, Tset1: Dados da primeira figura
    % h2, P2, Tcurr2, Tset2: Dados da segunda figura
    % ord: Ordem das transformações

    % Número de passos de animação
    N = max(size(Tset1, 3), size(Tset2, 3)); % Assume que ambos têm tamanhos similares

    for n = 1:N
        % Atualização para a figura 1
        if n <= size(Tset1, 3)
            if ord == 1
                Tn1 = Tcurr1 * Tset1(:, :, n);
            else
                Tn1 = Tset1(:, :, n) * Tcurr1;
            end
            Pn1 = Tn1 * P1; % Transformação dos pontos
            h1.Vertices = Pn1(1:3, :)'; % Atualiza os vértices da primeira figura
        else
            Tn1 = Tcurr1; % Se Tset1 acabou, mantenha a última transformação
        end

        % Atualização para a figura 2
        if n <= size(Tset2, 3)
            if ord == 1
                Tn2 = Tcurr2 * Tset2(:, :, n);
            else
                Tn2 = Tset2(:, :, n) * Tcurr2;
            end
            Pn2 = Tn2 * P2; % Transformação dos pontos
            h2.Vertices = Pn2(1:3, :)'; % Atualiza os vértices da segunda figura
        else
            Tn2 = Tcurr2; % Se Tset2 acabou, mantenha a última transformação
        end

        % Pausa para a animação
        pause(0.05);
    end

    % Retornar as últimas transformações
    Tlast1 = Tn1;
    Tlast2 = Tn2;
end
