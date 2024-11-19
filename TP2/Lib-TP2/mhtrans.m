function A = mhtrans(X, Y, Z)

m = max([numel(X), numel(Y), numel(Z)]);

X(end:m) = X(end);
Y(end:m) = Y(end);
Z(end:m) = Z(end);

A = zeros(4, 4, m);

for n=1:m
    A(:,:,n) = htrans(X(n), Y(n), Z(n));
end