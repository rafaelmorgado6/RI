addpath '../Lib/'

%% Ex1

P1 = [-1 0 0 1]';
P2 = [1 0 0 1]';
P3 = [0 2 0 1]';

A1 = [P1 P2 P3]

h = fill3(A1(1,:),A1(2,:),A1(3,:), 'red')

grid on;
xlabel('X');
ylabel('Y');
zlabel('Z');
axis([-5 5 -5 5 -5 5])

for t  =linspace(0, 2*pi*2, 500)
    An = hrotx(t)*A1
    h.Vertices = An(1:3,:)';
    pause(0.05)
end

%% Ex2
clear all; close all; clc

P1 = [0.5 0 0 1]';
P2 = [0.5 2 0 1]';
P3 = [1 2 0 1]';
P4 = [0 3 0 1]';
P5 = [-1 2 0 1]';
P6 = [-0.5 2 0 1]';
P7 = [-0.5 0 0 1]';

A1 = [P1 P2 P3 P4 P5 P6 P7]

h = fill3(A1(1,:),A1(2,:),A1(3,:), 'm')
hold on;
grid on;
view(135, 25)
xlabel('X');
ylabel('Y');
zlabel('Z');
axis([-5 5 -5 5 -5 5])

P2 = hroty(pi/2) * hrotx(pi/2) *A1
fill3(P2(1,:),P2(2,:),P2(3,:), 'r')

P3 = hrotz(pi/2) * hrotx(pi/2) *A1
fill3(P3(1,:),P3(2,:),P3(3,:), 'y')

%% Ex3
clear all; close all; clc

P1 = [0.5 0 0 1]';
P2 = [0.5 2 0 1]';
P3 = [1 2 0 1]';
P4 = [0 3 0 1]';
P5 = [-1 2 0 1]';
P6 = [-0.5 2 0 1]';
P7 = [-0.5 0 0 1]';

A1 = [P1 P2 P3 P4 P5 P6 P7]

h = fill3(A1(1,:),A1(2,:),A1(3,:), 'm')
hold on;
grid on;
view(135, 25)
xlabel('X');
ylabel('Y');
zlabel('Z');
axis([-5 5 -5 5 -5 5])

P2 = hroty(pi/2) * hrotx(pi/2) *A1
j = fill3(P2(1,:),P2(2,:),P2(3,:), 'r')

P3 = hrotz(pi/2) * hrotx(pi/2) *A1
k = fill3(P3(1,:),P3(2,:),P3(3,:), 'y')


for t  =linspace(0, 2*pi*10, 500)
    
    An1 = hrotx(t)*A1;      % vel = t*1
    h.Vertices = An1(1:3,:)';
    
    An2 = hrotz(2*t)*P2;    % vel = t*2
    j.Vertices = An2(1:3,:)';

    An3 = hroty(3*t)*P3;    % vel = t*3
    k.Vertices = An3(1:3,:)';
    
    pause(0.05)
end


%% Ex4a 

clear all; close all; clc

P1 = [0.5 0 0 1]';
P2 = [0.5 2 0 1]';
P3 = [1 2 0 1]';
P4 = [0 3 0 1]';
P5 = [-1 2 0 1]';
P6 = [-0.5 2 0 1]';
P7 = [-0.5 0 0 1]';

A1 = [P1 P2 P3 P4 P5 P6 P7]; 

h = fill3(A1(1,:),A1(2,:),A1(3,:), 'b')
hold on;
grid on;
view(135, 25)
xlabel('X');
ylabel('Y');
zlabel('Z');
axis([-10 10 -10 10 -10 10])

% Posiciona a figura no lugar inicial
P = hrotz(pi/2) * hrotx(pi/2) *A1  

% M = [trans(x, y, 0) rotx roty rotz]
M = [0 0 5 0 0 0
     0 0 0 -pi/2 0 0
     0 0 6 0 0 0
     0 0 0 0 pi/2 0
     0 0 4 0 0 0
     0 0 0 -pi/2 0 0
     0 0 5 0 0 0
     0 0 0 0 pi/2 0
     0 0 6 0 0 0];

                   %Tp = [1 0 0 0
     Tp = eye(4);  %      0 1 0 0
                   %      0 0 1 0
                   %      0 0 0 1]
for k=1:size(M,1)
    Tp = Animate(h, P, Tp, M(k,:), 50);
end


