function MQ = LinspaceVect(Qi, Qf, N)

MQ = zeros(size(Qi,1), N);
for n = 1 : size(Qi,1)
    MQ(n,:) = linspace(Qi(n), Qf(n), N);
end
end

