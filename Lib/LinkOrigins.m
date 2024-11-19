function Org = LinkOrigins(AA)
    % Função para calcular as origens dos diversos sistemas de coordenadas
    % de um manipulador, dado a hipermatriz de transformações AA
    
    
    % Origem sistema global
    Org = zeros(3, size(AA,3)+1);
    
    An = eye(4);
    for n = 1:size(AA,3)

        An = An * AA(:,:,n);    %AA(:,:,1)->1ª linha, AA(:,:,2)->2ª linha, ... 
        Org(:,n+1) = An(1:3,4); %An(1:3,4)-> extrai os elementos das duas primeiras linhas da quarta coluna.
    end