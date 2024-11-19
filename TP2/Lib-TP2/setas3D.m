function [V, F] = setas3D()
    
    D = 1;    % altura/largura do paralelipipdo
    L = 12;      % comprimento do paralelipipdo 
    d = 2;    % d*D -> largura base da pirâmide
    f = 0.5;   % f*L -> altura da pirâmide
    
    [V,F] = seta3Dx(D,L,d,f); %seta3Dx(D, L, d, f)
    
