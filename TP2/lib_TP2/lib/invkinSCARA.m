function Q = invkinSCARA(x, y, z, phi, LA, LB, LC, LD)

    d3 = LA - z - LD;

    q12 = invkinRR(x,y,LB,LC);

    q12(2,:) = -q12(2,:);
    q4 = q12(1,:)-q12(2,:)-phi;
    d3 = repmat(d3,[1, size(q4,2)]);
    Q = [q12; d3; q4];
end