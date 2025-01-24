function MM = mhroty(A)

MM=zeros(4,4,length(A));

for n=1:length(A)
    M=hroty(A(n)); 
    MM(:,:,n)=M;    
end
end