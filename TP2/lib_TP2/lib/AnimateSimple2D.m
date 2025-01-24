function AnimateSimple2D(h, P, M, N)

XX = [];
YY = [];
RR = [];

for k=1:size(M,2)-1    
    XX = [XX linspace(M(1,k), M(1,k+1), N)];
    YY = [YY linspace(M(2,k), M(2,k+1), N)];
    RR = [RR linspace(M(3,k), M(3,k+1), N)];
end

MM = [XX; YY; RR]

for k=1:length(MM)
    Pk = TransGeom(MM(1,k), MM(2,k), MM(3,k));%*P;
    Pk = Pk*P;
    h.Vertices = Pk';
    pause(0.1)
end