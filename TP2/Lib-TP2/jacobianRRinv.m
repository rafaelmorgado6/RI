function Jinv = jacobianRRinv(Q, L1, L2)

    Jinv = inv(jacobianRR(Q, L1, L2));