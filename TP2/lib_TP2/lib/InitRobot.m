function [H,h,P,AAA] = InitRobot(QQ, NN, DH, jTypes, sScale)

if nargin <4
    jTypes = zeros(size(QQ,1),1);
    sScale = 0.3;
elseif nargin <5
    sScale = 0.3;
end

[P,F] = seixos3(sScale);
MQ = [];
for k = 1:size(QQ,2)-1
    Qi = QQ(:,k);
    Qf = QQ(:,k+1);
    
    MQ = [MQ LinspaceVect(Qi, Qf,NN)];

end
    
MDH = GenerateMultiDH(DH, MQ, jTypes);

AAA = (CalculateRobotMotion(MDH));

AA = (AAA(:,:,:,1));
org = LinkOrigins(AA);
h = DrawLinks(org);
H = DrawFrames(AA,P,F);
end

