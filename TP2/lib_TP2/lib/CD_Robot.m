function [h1, H1, AA1, h2, H2, AA2] =  CD_Robot(DH1, DH2)

[P,F] = seixos3(1); 


AA1 = tlinks(DH1);
AA2 = tlinks(DH2);

Org1 = LinkOrigins(AA1);
Org2 = LinkOrigins(AA2);

h1 = DrawLinks(Org1);
h2 = DrawLinks(Org2);

H1 = DrawFrames(AA1, P, F);
H2 = DrawFrames(AA2, P, F);