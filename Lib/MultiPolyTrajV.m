function [QQ, t]= MultiPolyTrajV(Q,N,tt)

V=zeros( size(Q) ); %velocidades de passagem nulas
QQ=[]; 
t=[]; %matriz e vetor para ir concatenando...

for i=1:size(Q,2)-1 % porqueˆ ?
    Qi= Q(:,i) ; 
    Qf= Q(:,i+1); % o que falta?
    Vi= V(:,i) ; 
    Vf= V(:,i+1); % o que falta?
    t0= tt(i) ; 
    tf= tt(i+1); % o que falta?
   
    [q , ttt]=PolyTrajV(Qi,Qf,Vi,Vf,N,t0,tf);
    
    QQ=[QQ q]; %acumulacao dos ˆangulos 
    t=[t ttt]; %acumulacao dos tempos
end
