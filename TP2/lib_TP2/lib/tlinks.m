function AA = tlinks(DH)
for n = 1:size(DH,1)
    An = Tlink(DH(n,1),DH(n,2),DH(n,3),DH(n,4));

    AA(:,:,n) = An;
end
end
