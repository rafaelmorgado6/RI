function MM = mhrotz(A)

MM=zeros(4,4,length(A));

for n=1:length(A)
    M=hrotz(A(n)); 
    MM(:,:,n)=M;     
end
end