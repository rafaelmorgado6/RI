function [TT] = mhroty(A)
    
TT = zeros(4, 4, length(A));
    
for n = 1:length(A)
        
        T = hroty(A(n));
        TT(:,:,n) = T;
end
end