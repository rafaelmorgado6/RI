function H = DrawFrames(AA,P,F)

H(1) = patch('Vertices', P(1:3,:)', 'Faces', F, 'FaceColor', 'g');

a = LinkOrigins(AA);

Tn = eye(4);
for n = 1:size(AA,3)

    Tn = Tn*AA(:,:,n);

    Pn = Tn * P;

    H(n+1) = patch('Vertices', Pn(1:3,:)', 'Faces', F, 'FaceColor', 'g');

end
end