function M = TransGeom(x,y,a)

M = [cos(a) -sin(a) x
     sin(a) cos(a)  y
     0      0       1];

end

