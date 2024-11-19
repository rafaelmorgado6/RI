function Z = jointAxis(AA)

    Z = zeros(3, size(AA,3) + 1);
    
    Z(:,1) = [0 0 1]';
    
    T = eye(4);
    
    for k=1:size(AA,3)
        T = T * AA(:,:,k);
        Z(:,k+1) = T(1:3, 3);
    end