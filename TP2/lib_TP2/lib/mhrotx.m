function [MM] = mhrotx(A)

MM=zeros(4,4,length(A));

for n=1:length(A)
    a = A(n);
    M=hrotx(a); 
    MM(:,:,n)=M;     
end
end

