function [Tlast] = manimate(h, P, Tcurr, Tset, ord)

Tn = eye(4);
for n=1:size(Tset, 3)
    
    if ord == 1 %local
        Tn = Tcurr * Tset(:,:,n);
    else % ord = 0 global
        Tn = Tset(:,:,n) * Tcurr;
    end
    
    Pn = Tn * P ;
    h.Vertices = Pn(1:3,:)';
    pause(0.05)
end

Tlast = Tn;