function [q, iter, errors] = invkinYaskawa(DH, q0, desired_pose, tol, max_iters, lambda, jType)
    if nargin < 7, jType = zeros(1, size(DH, 1)); end
    if nargin < 6, lambda = 0.1; end
    if nargin < 5, max_iters = 1000; end
    if nargin < 4, tol = 1e-8; end

    % Inicializações
    q = q0;
    success = false;

    % Pesos para erros
    position_weight = 1;
    orientation_weight = 0.1;
    step_limit = 0.1; % Limitar o tamanho do passo

    for iter = 1:max_iters
        % Pose atual
        MDH = GenerateMultiDH(DH, q, jType);
        AA = tlinks(MDH(:, :, 1));
        current_pose = eye(4);
        for k = 1:size(AA, 3)
            current_pose = current_pose * AA(:, :, k);
        end

        Rcur = current_pose(1:3, 1:3);
        Rdes = desired_pose(1:3, 1:3);

        % Erros
        position_error = desired_pose(1:3, 4) - current_pose(1:3, 4);
        orientation_error = vee(Rcur' * Rdes - eye(3));
        errors = [position_weight * position_error; orientation_weight * orientation_error];

        % Convergência
        if norm(errors) < tol
            success = true;
            break;
        end

        % Jacobiano e DLS
        J = jacobGeom(AA, jType);
        J_dls = (J' * J + (lambda^2) * eye(size(J, 2))) \ J';
        delta_q = J_dls * errors;

        % Limitar passo
        if norm(delta_q) > step_limit
            delta_q = (delta_q / norm(delta_q)) * step_limit;
        end

        q = q + delta_q; % Atualizar ângulos articulares
    end
    if ~success
        warning('Inverse kinematics did not converge within the maximum number of iterations');
    end
end