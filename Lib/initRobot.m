function [H, h, P, AAA] = initRobot(QQ, NN, DH, jTypes, sScale)

MQ = [];
for k = 1:size(QQ, 2)-1

    Qi = QQ(:,k);
    Qf = QQ(:,k+1);
    MQ = [MQ LinspaceVect(Qi, Qf, NN)];

end

MDH = GenerateMultiDH(DH, MQ, jTypes);

AAA = CalculateRobotMotion(MDH);  

[P,F] = seixos3(sScale);
AA = AAA(:,:,:,1);
org = LinkOrigins(AA);
h = DrawLinks(org); % Desenha os elos do robô com base nas origens.
H = DrawFrames(AA, P, F);

