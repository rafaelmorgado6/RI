function isValid = VerifyWorkspace(points, limits)

    if size(points, 1) == 4
        points = points(1:3, :);
    end

    if any(points(1, :) < limits(1) | points(1, :) > limits(2)) || ...
       any(points(2, :) < limits(3) | points(2, :) > limits(4)) || ...
       any(points(3, :) < limits(5) | points(3, :) > limits(6))
        disp('Ponto fora do espaço de trabalho! Programa encerrado.');
        isValid = false;
    else
        isValid = true;
    end
end
