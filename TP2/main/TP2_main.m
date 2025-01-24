
clear, close all, clc

try
    tfid = fopen('tp2.txt');
    tdata = textscan(tfid,'%s=%s');
    fclose(tfid);
    if( numel(tdata{1}) ~= numel(tdata{2}))
        disp('Error reading file. Missing = !')
        clear tdata tfid
    else
        ndata={ tdata{1} repmat('=', size(tdata{1})) tdata{2}};
        sdata=strcat(ndata{1},ndata{2},ndata{3});
        for i=1:numel(sdata)
            try
                eval(sdata{i});
            catch
                sprintf('Bad format in line %d of data file!',i)
            end
        end
        clear i tfid ndata tdata sdata
    end
catch
    disp('Cannot open file.')
end

clc;
t = [0 0 0 0 0 0 0 0];
N = 100;

DH1 = [0 0 H-LZ 0
      0 LX LZ pi/2 
      0 0 LA -pi/2
      0 0 0 pi/2
      0 0 LB -pi/2
      0 0 0 pi/2
      0 0 LC -pi/2
      0 0 0 pi/2
      0 0 LD 0     
      ];  

DH2 = [0 0 H-LZ 0
      0 LX LZ -pi/2 
      0 0 LA pi/2
      0 0 0 -pi/2
      0 0 LB pi/2
      0 0 0 -pi/2
      0 0 LC pi/2
      0 0 0 -pi/2
      0 0 LD 0      
      ]; 

x1_inter1 = 550; y1_inter1 = -450; z1_inter1 = 854; % Intermediário
x1_inter2 = 433; y1_inter2 = -100; z1_inter2 = 1000; % Intermediário
x1_final=741; y1_final=-75; z1_final=864;
phi1=pi; % around z
th1=0; % around y
psi1=0; % around x
eul1=[phi1 th1 psi1]; % notice the order....! ZYX
Tdes1_inter1 = mhtrans(x1_inter1, y1_inter1, z1_inter1) * eul2tform(eul1);
Tdes1_inter2 = mhtrans(x1_inter2, y1_inter2, z1_inter2) * eul2tform(eul1);
Tdes1_final=mhtrans(x1_final,y1_final,z1_final)*eul2tform(eul1); %use default order "ZYX"

x2_inter1=550; y2_inter1=450; z2_inter1=754;
x2_inter2=433; y2_inter2=100; z2_inter2=1000;
x2_final=741; y2_final=75; z2_final=864;
phi2=pi; % around z
th2=0; % around y
psi2=0; % around x
eul2=[phi2 th2 psi2]; % notice the order....! ZYX
Tdes2_inter1 = mhtrans(x2_inter1, y2_inter1, z2_inter1) * eul2tform(eul1);
Tdes2_inter2 = mhtrans(x2_inter2, y2_inter2, z2_inter2) * eul2tform(eul1);
Tdes2_final=mhtrans(x2_final,y2_final,z2_final)*eul2tform(eul2); %use default order "ZYX"

figure;
set(gcf, 'WindowState', 'maximized');
hold on
grid on;
xlabel('X');
ylabel('Y');
zlabel('Z');
view(115, 15);
axis equal;
axis([-3000 3000 -2000 2000 0 3000]);

q01 = zeros(size(DH1, 1), 1); 
[q1_inter1, ~, ~] = invkinYaskawa(DH1, q01, Tdes1_inter1);
[q1_inter2, ~, ~] = invkinYaskawa(DH1, q01, Tdes1_inter2);
q1_inter2(4) = pi/2;
q1_inter2(6) = pi/4;
[q1, ~, ~] = invkinYaskawa(DH1, q01, Tdes1_final);
q1(1) = pi;
Q1_start = [q01, q1_inter1];
Q1_full = [q1_inter1, q1_inter2, q1];
MQ1_start = LinspaceVectMulti(Q1_start, N);
MQ1 = LinspaceVectMulti(Q1_full, N);
MDH1_start = GenerateMultiDH(DH1, MQ1_start, t);
MDH1 = GenerateMultiDH(DH1, MQ1, t);
AAA1_start = CalculateRobotMotion(MDH1_start);
AAA1 = CalculateRobotMotion(MDH1);

q02 = zeros(size(DH2, 1), 1);
[q2_inter1, ~, ~] = invkinYaskawa(DH2, q02, Tdes2_inter1);
[q2_inter2, ~, ~] = invkinYaskawa(DH2, q02, Tdes2_inter2);
q2_inter2(4) = -pi/2;
q2_inter2(6) = -pi/4;
[q2, ~, ~] = invkinYaskawa(DH2, q02, Tdes2_final);
q2(1) = pi;
Q2_start = [q02, q2_inter1];
Q2_full = [q2_inter1, q2_inter2, q2];
MQ2_start = LinspaceVectMulti(Q2_start, N);
MQ2 = LinspaceVectMulti(Q2_full, N);
MDH2_start = GenerateMultiDH(DH2, MQ2_start, t);
MDH2 = GenerateMultiDH(DH2, MQ2, t);
AAA2_start = CalculateRobotMotion(MDH2_start);
AAA2 = CalculateRobotMotion(MDH2);


[h1, H1, AA1, h2, H2, AA2] = CD_Robot(DH1,DH2);

[P,F] = seixos3(10); 

Table_A(LTF, WTS, HTA, DTF, STF);
Table_B(LTF, WTS, HTB, DTF, STF);
Table_C(LTT, WTS, HTC, STF, LTF, DTF, DTT);

[RV,RF,Rh] = Red_Block(LBL, WBL, HBL);
RV = [RV ones(size(RV,1),1)]';

[BV,BF,Bh] = Blue_Block(LBL, WBL, HBL);
BV = [BV ones(size(BV,1),1)]';

Tcurr = mhtrans(2037, -350, 804);
Tcurr2 = mhtrans(2037, 350, 704);
Tcurr3 = mhtrans(125, -1164.5, 1223) * mhrotx(pi/2);
Tcurr4= mhtrans(125, 1164.5, 1223) * mhrotx(-pi/2);

RV_transformed = Tcurr * RV;
set(Rh, 'Vertices', RV_transformed(1:3, :)');

BV_transformed = Tcurr2 * BV;
set(Bh, 'Vertices', BV_transformed(1:3, :)');

order = 0;
NN = 20;
T(:,:,:,1) = mhtrans(-linspace(0,1467,NN),0,0);
T2(:,:,:,1) = mhtrans(-linspace(0,1000,NN),0,0);


workspace_limits = [-1164, 1164, -1164, 1164, 354, 2092];

if ~VerifyWorkspace([x1_inter1; y1_inter1; z1_inter1], workspace_limits) || ...
   ~VerifyWorkspace([x1_inter2; y1_inter2; z1_inter2], workspace_limits) || ...
   ~VerifyWorkspace([x1_final; y1_final; z1_final], workspace_limits) || ...
   ~VerifyWorkspace([x2_inter1; y2_inter1; z2_inter1], workspace_limits) || ...
   ~VerifyWorkspace([x2_inter2; y2_inter2; z2_inter2], workspace_limits) || ...
   ~VerifyWorkspace([x2_final; y2_final; z2_final], workspace_limits)
    return; 
end

pause(1.5);

for repeat = 1:5
    Tcurr = mhtrans(2037, -350, 804);
    Tcurr2 = mhtrans(2037, 350, 704);
    Tcurr3 = mhtrans(125, -1164.5, 1223) * mhrotx(pi/2);
    Tcurr4= mhtrans(125, 1164.5, 1223) * mhrotx(-pi/2);
    
    RV_transformed = Tcurr * RV;
    set(Rh, 'Vertices', RV_transformed(1:3, :)');
    
    BV_transformed = Tcurr2 * BV;
    set(Bh, 'Vertices', BV_transformed(1:3, :)');

    for n=1:size(T,4)
        manimate_both(Rh, RV, Tcurr, T(:,:,:,n), Bh, BV, Tcurr2, T(:,:,:,n), order(n));
        pause(0.05)
    end
    
    AnimateRobot_both(H1, AAA1_start, P, h1, H2, AAA2_start, h2, 0.00001);
    
    [GripperV1, GripperF1, hGripper1] = SimpleGripper();
    GripperV1 = [GripperV1 ones(size(GripperV1, 1), 1)]';
    
    [GripperV2, GripperF2, hGripper2] = SimpleGripper();
    GripperV2 = [GripperV2 ones(size(GripperV2, 1), 1)]';
    
    GripperV1_transformed = Tcurr3 * GripperV1;
    set(hGripper1, 'Vertices', GripperV1_transformed(1:3, :)');
    
    GripperV2_transformed = Tcurr4 * GripperV2;
    set(hGripper2, 'Vertices', GripperV2_transformed(1:3, :)');
    
    [Tlast1, Tlast2] = AnimateRobotAndBlocks(H1, AAA1, P, h1, Rh, RV, ...
                                         H2, AAA2, h2, Bh, BV, ...
                                         hGripper1, GripperV1, hGripper2, GripperV2, ...
                                         0.02, 75, -75);

    MQ1_return = LinspaceVect(MQ1(:, end), q01, 50); 
    MQ2_return = LinspaceVect(MQ2(:, end), q02, 50); 
    
    MDH1_return = GenerateMultiDH(DH1, MQ1_return, t);
    MDH2_return = GenerateMultiDH(DH2, MQ2_return, t);

    AAA1_return = CalculateRobotMotion(MDH1_return);
    AAA2_return = CalculateRobotMotion(MDH2_return);
    
    pause(0.5)
    ClearGrippers(hGripper1, hGripper2);
    AnimateRobot_both(H1, AAA1_return, P, h1, H2, AAA2_return, h2, 0.02);
    
    Tcurr = Tlast1;
    Tcurr(2, 4) = Tcurr(2, 4) + 70;
    Tcurr2 = Tlast2;
    Tcurr2(2, 4) = Tcurr2(2, 4)-70;
    for n=1:size(T,4)
        manimate_both(Rh, RV, Tcurr, T2(:,:,:,n), Bh, BV, Tcurr2, T2(:,:,:,n), order(n));
        pause(0.05)
    end
end