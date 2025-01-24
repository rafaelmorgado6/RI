function h = DrawLinks(Org,color)

if nargin < 2
    color = 'black';
end

grid on
h = line(Org(1,:), Org(2,:), Org(3,:), 'LineWidth',3, 'Color', color);

end

