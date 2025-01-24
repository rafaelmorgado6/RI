function H = DrawFrames(AA,P,F)

    %H = zeros(1, size(AA,3));
    color = {'red', 'green', 'blue', 'yellow', 'cyan', 'magenta', 'black', 'red', 'green', 'blue', 'yellow', 'cyan', 'magenta', 'black'};
    An = eye(4);
    H(1) = patch('Vertices', P(1:3,:)', 'Faces', F, 'FaceColor', 'w');
    for n = 1:size(AA,3)

        An = An * AA(:,:,n);    %AA(:,:,1)->1ª linha, AA(:,:,2)->2ª linha, ... 
        Pn = An * P;
        H(n+1) = patch('Vertices', Pn(1:3,:)', 'Faces', F, 'FaceColor', color{n});
    end