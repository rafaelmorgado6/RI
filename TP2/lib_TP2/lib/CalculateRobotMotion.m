function AAA = CalculateRobotMotion(MDH)

for n=1:size(MDH,3)
    DHn = MDH(:,:,n);
    AA = tlinks(DHn);
    AAA(:,:,:,n) = AA;
end
end

