function Test_CD(DH1, H1, h1, DH2, H2, h2)

Qi = [0 0 0 0 0 0 0 0 0]';
Qf = [pi/2 0 0 0 0 0 0 0 0]';
N = 50;

[P,F] = seixos3(150); 

MQ = LinspaceVect(Qi, Qf, N);

MDH1 = GenerateMultiDH(DH1, MQ);
MDH2 = GenerateMultiDH(DH2, MQ);

AAA1 = CalculateRobotMotion(MDH1);
AAA2 = CalculateRobotMotion(MDH2);

AnimateRobot(H1, AAA1, P, h1, 0.1);
AnimateRobot(H2, AAA2, P, h2, 0.1);