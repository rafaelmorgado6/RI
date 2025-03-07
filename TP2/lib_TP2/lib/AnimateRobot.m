function AnimateRobot(H, AAA, P, h, sd)

for k = 1:size(AAA,4)

    AA = AAA(:,:,:,k);
    org = real(LinkOrigins(AA));
    
    h.XData = org(1,:);
    h.YData = org(2,:);
    h.ZData = org(3,:);

    T = eye(4);

    for i = 1:size(AA,3)
        T = T * AA(:,:,i);
        Pn = T*P;
        H(i+1).Vertices=Pn(1:3,:)';
    end
    
    plot3(org(1,end), org(2,end), org(3,end), '.r')
    pause(sd)
end
end

