
%% Ex1
% Criar PolyTrajV

%% Ex2

clear, close all, clc;

L1 = 3;
L2 = 2;

DH = [0 L1 0 0
      0 L2 0 0];

P1 = [2, 0]';
P2 = [-4, 2]';

t0 = 0;
tf = 4;
N = 200;

Qv0 = [0 0]';
Qvf = [0 0]';

Q0 = invkinRR(P1(1), P1(2), L1, L2);
Qf = invkinRR(P2(1), P2(2), L1, L2);
Q0 = Q0(:,2);
Qf = Qf(:,1);

QQ = PolyTrajV(Q0, Qf, Qv0, Qvf, N, t0, tf);

figure;
subplot(1,2,1)
grid on;
hold on;
xlabel('tempo (s)');
ylabel('theta');
legend('theta1','theta2')
plot(QQ');

subplot(1,2,2)
hold on;
grid on;
axis([-6 6 -6 8])
xlabel('XX');
ylabel('YY');
[H,h,P,~] = initRobot([Q0 Qf], N, DH, [0 0]', 0.5);


MDH = GenerateMultiDH(DH, QQ, [0 0]');
AAA = CalculateRobotMotion(MDH);
AnimateRobot(H,AAA,P,h, 0.1);

pause(1/100)

%% Ex4

clear, close all, clc;

L1 = 3;
L2 = 2;

DH = [0 L1 0 0
      0 L2 0 0];

P = [4 0 1 4 2 -3
     0 3 4 2 2 3];

N = 100;

Q = [];
for k=1:size(P,2)
    q = invkinRR(P(1,k), P(2,k), L1, L2);
    Q(:,k) = q(:,1);
end 

tt = [0 0.5 1.2 2 2.6 4];
QQ = MultiPolyTrajV(Q, N, tt);

figure;
subplot(1,2,1)
grid on;
hold on;
xlabel('tempo (s)');
ylabel('theta');
legend('theta1','theta2')
plot(QQ');

subplot(1,2,2)
hold on;
grid on;
axis([-6 6 -6 8])
xlabel('XX');
ylabel('YY');
[H,h,P,~] = initRobot(QQ, N, DH, [0 0]', 0.5);


MDH = GenerateMultiDH(DH, QQ, [0 0]');
AAA = CalculateRobotMotion(MDH);
AnimateRobot(H,AAA,P,h, 0.1);


%% Ex5

clear, close all, clc;
L1 = 3;
L2 = 2;
DH = [0 L1 0 0
      0 L2 0 0];

A = [4 0]';
B = [-4 3]';

N = 100;

t=linspace(0,1,N);
P=A+t.*(B-A); 
dr=[diff(P')']; % here, the "dr"s are all the same!

QA=invkinRR(P(1,1),P(2,1),L1,L2); 
Qi=QA(:,2); %starting point

Q = Qi;
QQ =[];
for k=1:size(dr,2)
    dQ = inv(jacobianRR(Q,L1,L2)) * dr(:,k);

    Q = Q + dQ;
    QQ = [QQ Q];
end

hold on;
grid on;
axis([-6 6 -6 8])
xlabel('XX');
ylabel('YY');
[H,h,P,~] = initRobot(QQ, N, DH, [0 0]', 0.5);


MDH = GenerateMultiDH(DH, QQ, [0 0]');
AAA = CalculateRobotMotion(MDH);
AnimateRobot(H,AAA,P,h, 0.1);