function Org = LinkOrigins(AA)

An = eye(4);

Org = zeros(3, size(AA,3)+1);

for n = 1:size(AA,3)
    An = An * AA(:,:,n);

    Org(:,n+1)= An(1:3,4);
end

