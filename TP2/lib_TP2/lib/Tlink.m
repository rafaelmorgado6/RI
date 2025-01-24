function A = Tlink(theta, l, d, alpha)

A = hrotz(theta)*htrans(l,0,d)*hrotx(alpha);

end

