function [Tlast1, Tlast2] = AnimateRobotAndBlocks(H1, AAA1, P, h1, hBlock1, RV1, ...
                                                 H2, AAA2, h2, hBlock2, RV2, ...
                                                 hGripper1, RVG1, hGripper2, RVG2, ...
                                                 sd, delta_y1, delta_y2)
    maxFrames = max(size(AAA1, 4), size(AAA2, 4));
    Tlast1 = eye(4);
    Tlast2 = eye(4);
   
    T_translation1 = mhtrans(0, delta_y1, 0);
    T_translation2 = mhtrans(0, delta_y2, 0);

    
    for k = 1:maxFrames
        % Atualização do robô 1, bloco 1 e garra 1
        if k <= size(AAA1, 4)
            % Robô 1
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

            T1_adjusted = T1 * T_translation1;
            P_block1 = T1_adjusted * RV1;
            set(hBlock1, 'Vertices', P_block1(1:3, :)');
            
            P_gripper1 = T1 * RVG1;
            set(hGripper1, 'Vertices', P_gripper1(1:3, :)');
            Tlast1 = T1; % Atualiza a última transformação do robô 1
        end

        % Atualização do robô 2, bloco 2 e garra 2
        if k <= size(AAA2, 4)
            % Robô 2
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
            
            T2_adjusted = T2 * T_translation2;
            P_block2 = T2_adjusted * RV2;
            set(hBlock2, 'Vertices', P_block2(1:3, :)');
            
            P_gripper2 = T2 * RVG2;
            set(hGripper2, 'Vertices', P_gripper2(1:3, :)');
            Tlast2 = T2; % Atualiza a última transformação do robô 2
        end

        % Pausa para a animação
        pause(sd);
    end
end
