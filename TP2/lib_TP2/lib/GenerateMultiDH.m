function MDH = GenerateMultiDH(DH, MQ, typ)

for n = 1 : size(MQ,2)
    DHn = DH;
    for k = 1:size(typ,2) 
        if typ(k) == 0 %junts prism
            DHn(k,1) = DH(k,1) + MQ(k,n);
        else %junts rotations
            DHn(k,3) = DH(k,3) + MQ(k,n);
        end
    end
    MDH(:,:,n)= DHn;
    
end
end

