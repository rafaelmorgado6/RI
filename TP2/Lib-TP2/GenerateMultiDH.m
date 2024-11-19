function MDH = GenerateMultiDH(DH, MQ, t)
% DH - Matriz base de Denavit-Hartenberg (com valores para a posição zero)
% MQ - Matriz de múltiplas posições das juntas (gerada por LinspaceVect)
% t - Vetor que indica o tipo de junta (0 - rotacional, 1 - prismática)

if nargin < 3
    t = zeros(size(DH, 1), 1);
end
MDH = zeros(size(DH, 1), 4, size(MQ, 2));

for n = 1 : size(MQ,2)
    DHn = DH;
    for k = 1:size(t,1)
        if t(k) == 0  %juntas prismáticas
            DHn(k,1) = DH(k,1) + MQ(k,n);
        else          %juntas rotacionais
            DHn(k,3) = DH(k,3) + MQ(k,n);
        end
    end
    MDH(:,:,n)= DHn;
end