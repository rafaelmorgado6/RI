function Q = invkinRR(x,y,L1,L2)

q2A = acos((x^2 + y^2 -L1^2 -L2^2)/(2*L1*L2));
q2B = -q2A;
q1A = atan2(y*(L1+L2*cos(q2A)) -x*L2*sin(q2A),x*(L1+L2*cos(q2A)) +y*L2*sin(q2A));
q1B = atan2(y*(L1+L2*cos(q2B)) -x*L2*sin(q2B),x*(L1+L2*cos(q2B)) +y*L2*sin(q2B));

Q = [q1A q1B
    q2A q2B];
end

