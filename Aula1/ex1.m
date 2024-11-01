addpath '..'/Lib/

%% Ex1
P1 = [-1 0]';
P2 = [1 0]';
P3 = [0 2]';
A1 = [P1 P2 P3];

figure;
fill(A1(1, :),A1(2, :),'b'); %
hold on
axis([-10 10 -10 10]);
grid on
title('Triangulo A1')

v = [5 0]';
A2 = A1 + v;
fill(A2(1, :), A2(2, :), 'r')
legend('Triangulo A1', 'Triangulo A2')

hold off

%% Ex2
clear all; close all; clc
P1 = [-1 0]';
P2 = [1 0]';
P3 = [0 2]';
A1 = [P1 P2 P3];

v = [5 0]';
A2 = A1 + v;

T = rot(deg2rad(50));
A3 = T* A2

fill(A2(1, :), A2(2, :), 'r')
hold on
fill(A1(1, :),A1(2, :),'y')
fill(A3(1, :), A3(2, :), 'b')
axis([-10 10 -10 10])
axis square
grid on

for n= 60: 10: 350
    T = rot(deg2rad(n))
    A3 = T* A2
    fill(A3(1, :), A3(2, :), 'c')
end

h = fill(A2(1, :), A2(2, :), 'g')

for n= 60: 10: 350
    T = rot(deg2rad(n))
    p = T* A2
    h.Vertices = p';
    pause(0.1)
end

%% Ex3
clear all; close all; clc
P1 = [-1 0 1]';
P2 = [1 0 1]';
P3 = [0 2 1]';
A1 = [P1 P2 P3];

h = fill(A1(1, :), A1(2, :), 'r')
hold on
axis([-10 10 -10 10])
axis square
grid on 

u1 = [3 4]';
u2 = [2 -5]';

N = 50;
for n= linspace(0,1,N)
   dx = n*u1(1);
   dy = n*u1(2);
   An1 = TransGeom(dx,dy,0)*A1;
   h.Vertices = An1';
   pause(0.1)
end

R = deg2rad(80)
for n= linspace(0,1,N)
    An2 = TransGeom(0, 0, n*R)*An1;
    h.Vertices = An2';
    pause(0.1)
end

for n= linspace(0,1,N)
   dx1 = n*u2(1);
   dy1 = n*u2(2);
   An3 = TransGeom(dx1,dy1,0)*An2;
   h.Vertices = An3';
   pause(0.1)
end

%% Ex4
clear all; close all; clc
P1 = [-1 0 1]';
P2 = [1 0 1]';
P3 = [0 2 1]';
A1 = [P1 P2 P3];


h = fill(A1(1, :), A1(2, :), 'r');
hold on
axis([-10 10 -10 10])
axis square
grid on
                    %  1º  2º  3º -> Ordem de iterações
M = [5  0  0        % [x1  x2  x3]
     0  5  0        % [y1  y2  y3]
     0  0  2*pi];   % [a1  a2  a3]

AnimateSimple2D(h,A1,M,50)

%% Ex5
clear all; close all; clc

P1 = [0 -1/2 1]';
P2 = [2 0 1]';
P3 = [0 1/2 1]';
A1 = [P1 P2 P3];

h = fill(A1(1, :), A1(2, :), 'y');
hold on
axis([-8 8 -5 5])

grid on
                    
M = [0      -4   -4   -4   1.5    4     4     4     2
     0       2    4    4   4.25   2     4     4     4
  77*pi/90 pi/7  pi/2 pi/2 pi/4 -pi/4 -pi/2 -pi/2 -pi/2];   

AnimateSimple2D(h,A1,M,50)
