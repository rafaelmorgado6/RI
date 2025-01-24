function AnimateRobot_both(H1, AAA1, P, h1, H2, AAA2, h2, sd)
    
    maxFrames = max(size(AAA1, 4), size(AAA2, 4));

    for k = 1:maxFrames
      
        if k <= size(AAA1, 4)
            AA1 = AAA1(:, :, :, k);
            org1 = real(LinkOrigins(AA1));
            
            h1.XData = org1(1, :);
            h1.YData = org1(2, :);
            h1.ZData = org1(3, :);
            
            T1 = eye(4);
            for i = 1:size(AA1, 3)
                T1 = T1 * AA1(:, :, i);
                Pn1 = T1 * P;
                H1(i + 1).Vertices = Pn1(1:3, :)';
            end
        end
       
        if k <= size(AAA2, 4)
            AA2 = AAA2(:, :, :, k);
            org2 = real(LinkOrigins(AA2));
            
            h2.XData = org2(1, :);
            h2.YData = org2(2, :);
            h2.ZData = org2(3, :);
            
            T2 = eye(4);
            for i = 1:size(AA2, 3)
                T2 = T2 * AA2(:, :, i);
                Pn2 = T2 * P;
                H2(i + 1).Vertices = Pn2(1:3, :)';
            end
        end

        pause(sd);
    end
end
