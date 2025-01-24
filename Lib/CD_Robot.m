function [h1, H1, h2, H2, P] =  CD_Robot(DH1, DH2)

[P,F] = seixos3(150); 

AA1 = Tlinks(DH1);
AA2 = Tlinks(DH2);

Org1 = LinkOrigins(AA1);
Org2 = LinkOrigins(AA2);

h1 = DrawLinks(Org1);
h2 = DrawLinks(Org2);

H1 = DrawFrames(AA1, P, F);
H2 = DrawFrames(AA2, P, F);