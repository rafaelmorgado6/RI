function [QQ, t] = PolyTrajV(Q0, Qf, Qv0, Qvf, N, t0, tf)
    % Q0, Qf - valores iniciais e finais as juntas
    % Qv0,Qvf - velocidades iniciais e finais das juntas
    % N - numero de pontos da trajetoria
    % t0,tf - instantes inicial e final da trajetoria


if Qv0 == 0
    Qv0 = zeros(size(Q0));
end

if Qvf==0
    Qvf = zeros(size(Qf));
end

t=linspace(t0,tf,N);
a0 = Q0;
a1 = Qv0;
a2 = 3/(tf-t0)^2 * (Qf-Q0) - 2/(tf-t0)*Qv0 - 1/(tf-t0)*Qvf;
a3 = -2/(tf-t0)^3 * (Qf-Q0) + 1/(tf-t0)^2*(Qvf+Qv0);
QQ = a0 + a1*(t-t0) + a2*(t-t0).^2 + a3*(t-t0).^3;