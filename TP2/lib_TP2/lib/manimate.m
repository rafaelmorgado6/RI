function Tlast = manimate(h,P,Tcurr,Tset,ord)
for n = 1:size(Tset,3)
    
    if ord == 1
        Tn = Tcurr * Tset(:,:,n);
    else
        Tn = Tset(:,:,n) * Tcurr;
    end
    
    Pn = Tn*P;

    h.Vertices = Pn(1:3,:)';

    pause(0.05)
end

Tlast = Tn;
end

