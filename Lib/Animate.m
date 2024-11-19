function tFinal=Animate(h, P, tInicial, D, N)
% h -> handle da figura
% P -> vertices iniciais da figura
% tInicial -> matriz atualizada que serve de inicio a iteração seguinte
% D -> vetor com [trans(x,y,z) rotx roty rotz]
% N -> numero de iterações 

for n  =linspace(0, 1, N)  %  cria uma sequência de N valores que vão de 0 a 1
    
    Dn = n*D;

    Tn = htrans(Dn(1), Dn(2), Dn(3)) * hrotx(Dn(4)) * hroty(Dn(5))* hrotz(Dn(6));

    Pn = tInicial * Tn * P;

    h.Vertices = Pn(1:3,:)';
    pause(0.01)
end

% retorna a matriz tFinal, que é a transformação acumulada de todas as translações e rotações.
% Esta matriz será usada como tInicial para a próxima transformação no loop principal da animação.
tFinal = tInicial * Tn;