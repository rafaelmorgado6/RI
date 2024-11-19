function Q = invkinRRRantro(x, y, z, L1, L2, L3)

q3A = acos((x^2 + y^2 + (z - L1)^2 - L2^2 - L3^2) / (2 * L2 * L3));
q3 = [q3A, -q3A];   %Two solutions for the elbow

A = L3 * cos(q3) + L2;
B = sqrt(L3 * L3 * sin(q3).^2 + (L3 * cos(q3) +L2).^2 - (z-L1)^2);
C = L3 * sin(q3) + z - L1;

q2A = 2*atan((A+B) ./ C);
q2B = 2*atan((A-B) ./ C);

%  % Cálculo de theta2 com as duas soluções
% q2A = 2 * atan((L3 * cos(q3A) + L2 + sqrt((L3 * sin(q3A))^2 + (L3 * cos(q3A) + L2)^2 - (z - L1)^2)) / (L3 * sin(q3A) + (z - L1)));
% q2B = 2 * atan((L3 * cos(q3A) + L2 - sqrt((L3 * sin(q3A))^2 + (L3 * cos(q3A) + L2)^2 - (z - L1)^2)) / (L3 * sin(q3A) + (z - L1)));

q3 = [q3, q3];
q2 = [q2A, q2B];    % Quatro configurações com base nas combinações de q3

k=sign( L3*cos(q2+q3)+L2*cos(q2) );
q1=atan2(k*y, k*x); %obtain the 4 solutions for q1 at once
Q=[q1;q2;q3]; %Q has the 4 solutions for q1, q2 & q3

