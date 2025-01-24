function [X,Y,Z] = RobotEndPath(AAA)

X = zeros(size(AAA,4),1);
Y = zeros(size(AAA,4),1);
Z = zeros(size(AAA,4),1);

    for n = 1:size(AAA,4)
        A = eye(4);

        for j = 1:size(AAA,3)
            A = A*AAA(:,:,j,n);
        end

        X(n) = A(1,4);
        Y(n) = A(2,4);
        Z(n) = A(3,4);
    end
end

