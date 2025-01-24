function Z = jointAxes(AA)

An = eye(4);

Z = zeros(3, size(AA,3)+1);
Z(:,1) = [0 0 1]';

for n = 1:size(AA,3)
    An = An * AA(:,:,n);

    Z(:,n+1)= An(1:3,3);
end


