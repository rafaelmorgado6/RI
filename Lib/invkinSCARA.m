function Q = invkinSCARA(x, y, z, phi, LA, LB, LC, LD)
    d3 = LA - z - LD;

    Q_RR = invkinRR(x, y, LB, LC);      % Q_RR = [theta1_A, theta1_B;
                                        %         theta2_A, theta2_B];
    theta1_A =  Q_RR(1, 1);
    theta1_B =  Q_RR(1, 2);  
    theta2_A = -Q_RR(2, 1);  % Pass a -theta2_A
    theta2_B = -Q_RR(2, 2);  % Passa a -theta2_B

    theta4_A = theta1_A - theta2_A - phi;
    theta4_B = theta1_B - theta2_B - phi;

    Q = [theta1_A, theta1_B;
         theta2_A, theta2_B;
         d3, d3;
         theta4_A, theta4_B];
end