function Q = invkinRRRantro(x,y,z,L1,L2,L3)

q3A = acos((x^2 + y^2 + (z-L1)^2-L2^2-L3^2)/(2*L2*L3));
q3 = [q3A,-q3A];

A = L3*cos(q3)+L2;
B = sqrt(L3^2*sin(q3).^2+(L3*cos(q3)+L2).^2 -(z-L1)^2);
C = L3*sin(q3)+z-L1;

q2A = 2*atan((A+B)./C);
q2B = 2*atan((A-B)./C);

q3 = [q3,q3];
q2 = [q2A q2B];
k = sign(L3*cos(q2+q3) + L2*cos(q2));

q1 = atan2(real(k)*y,real(k)*x);

Q = [q1;q2;q3];
end

