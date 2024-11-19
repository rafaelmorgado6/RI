function jacobianGeom()

N=size(AA,3); % number of joints
if nargin < 2 % if few arguments
    jTyp = 0;
end

if numel(jTyp) < 2 % if not a vector
    jTyp=zeros(N,1);
end
   
Zis=JointAxes(AA); % the joint axes
Org=LinkOrigins(AA); % the link origins

ON=Org(***); % TCP (last system)

for i=1:N % for each joint...
    Oi=Org(***); % ... get its origin
    Zi=Zis(***); % ... get its z axis
    if jTyp(i) == 0 % if rotational
        Jvi=cross(***, ***);
        Jwi=Zi;
    else % if prismatic
        Jvi=Zi;
        Jwi=[***]';
    end
        Jv(:,i)=Jvi; % set Jv component
        Jw(:,i)=Jwi; % set Jw component
end
J=[Jv; Jw]; % compose final J