function J = jacobianGeom(AA, jTyp)

N=size(AA,3); % number of joints
if nargin < 2 % if few arguments
    jTyp = 0;
end

if numel(jTyp) < 2 % if not a vector
    jTyp=zeros(N,1);
end
   
Zis=jointAxis(AA); % the joint axes
Org=LinkOrigins(AA); % the link origins

ON=Org(:,end); % TCP (last system)

for i=1:N % for each joint...
    Oi=Org(:,i); % i get its origin
    Zi=Zis(:,i); % i get its z axis
    if jTyp(i) == 0 % if rotational
        Jvi=cross(Zi, ON-Oi);
        Jwi=Zi;
    else % if prismatic
        Jvi=Zi;
        Jwi=[0 0 0]';
    end
        Jv(:,i)=Jvi; % set Jv component
        Jw(:,i)=Jwi; % set Jw component
end
J=[Jv; Jw]; % compose final J