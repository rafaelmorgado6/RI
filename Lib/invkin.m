% function [q, iter, errors] = invkin(DH, q0, desired_pose, tol, max_iters, lambda, jType ) 
% % Generic function to calculate inverse kinematics in a numeric iterative approach
% % Inputs:
% % DH − matrix of the robot
% % q0 − Initial guess for joint angles
% % desired_pose − 4x4 transformation matrix for the desired end−effector pose
% % tol − Tolerance for position/orientation error
% % max_iters − Maximum number of iterations to try
% % lambda − Damping factor (small positive value)
% % jType − vector with types of joints (0 rot, 1=prims)
% %
% % q − solution found
% % iter − number of iterations used
% % errors − vector or errors
% %
% % vsantos, Nov 2024
% %−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
% 
% if nargin < 7, jType = zeros(1,size(DH,1));end
% if nargin < 6, lambda = 0.01; end
% if nargin < 5, max_iters= 10000; end
% if nargin < 4, tol = 1e-5; end
% 
% if numel(jType) < 2, jType = zeros(1,size(DH,1)); end
% % Initialize variables
% q = q0; % Start with the initial guess
% success = false;
% 
% for iter = 1:max_iters
%     % Current end−effector pose
%     MDH=GenerateMultiDH(DH,q,jType);
%     AA=Tlinks(MDH(:,:,1));
%     current_pose=eye(4);
%     
%     for k=1:size(AA,3)
%         current_pose = current_pose*AA(:,:,k);
%     end
%     
%     Rcur=current_pose(1:3,1:3);
%     Rdes=desired_pose(1:3,1:3);
% 
%     % Calculate the pose error
%     position_error = desired_pose(1:3, 4) - current_pose(1:3, 4);
%     orientation_error=vee(Rcur'*Rdes - eye(3));
%     errors = [position_error; orientation_error];
%     
%     % Check if the error is within the tolerance
%     if norm(errors) < tol
%         success = true;
%         break;
%     end
%     
%     % Jacobian for the current configuration
%     J = jacobianGeom(AA, jType);
%     %J_I = pinv(J); %usual common solution
%     % Using the Damped Least Squares (DLS). Stronger for more cases
%     % use "\" instead of "inv()" −− more eficient in Matlab
%     J_dls = (J' * J + (lambda^2) * eye(size(J, 2)))\J';
%     J_I = J_dls;
%     delta_q = J_I * errors;
%     q = q + delta_q; % Update joint angles
% end
% if ~success
% warning('Inverse kinematics did not converge within the maximum number of iterations');
% end

function [q, iter, errors] = invkin(DH, q0, desired_pose,tol, max_iters, lambda, jType)
% Function to calculate inverse kinematics from Yaskawa in a numeric iterative approach
% Inputs:
% DH − matrix of the robot
% q0 − Initial guess for joint angles
% desired_pose − 4x4 transformation matrix for the desired end−effector pose
% tol − Tolerance for position/orientation error
% max_iters − Maximum number of iterations to try
% lambda − Damping factor (small positive value)
% jType − vector with types of joints (0 rot, 1=prims)
%
% q − solution found
% iter − number of iterations used
% errors − vector or errors
%
% vsantos, Nov 2024
%−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
if nargin < 7, jType = zeros(1,size(DH,1));end
if nargin < 6, lambda = 0.1; end
if nargin < 5, max_iters= 10000; end
if nargin < 4, tol = 10^-8; end


if numel(jType) < 2, jType = zeros(1,size(DH,1)); end

% Initialize variables
q = q0; % Start with the initial guess
success = false;

for iter = 1:max_iters
    % Current end−effector pose
    MDH=GenerateMultiDH(DH,q,jType);
    AA=Tlinks(MDH(:,:,1));
    current_pose=eye(4);
    for k=1:size(AA,3)
        current_pose = current_pose*AA(:,:,k);
    end
    
    Rcur=current_pose(1:3,1:3);
    Rdes=desired_pose(1:3,1:3);
    % Calculate the pose error
    position_error = desired_pose(1:3, 4) - current_pose(1:3, 4);
    orientation_error=vee(Rcur'*Rdes - eye(3));
    errors = [position_error; orientation_error];
    % Check if the error is within the tolerance
    if norm(errors) < tol
        success = true;
        break;
    end
    
    % Jacobian for the current configuration
    J = jacobianGeom(AA,jType);
    %J_I = pinv(J); %usual common solution
    % Using the Damped Least Squares (DLS). Stronger for more cases
    % use "\" instead of "inv()" −− more eficient in Matlab
    J_dls = (J' * J + (lambda^2) * eye(size(J, 2)))\J';
    J_I = J_dls;
    delta_q = J_I * errors;
    q = q + delta_q; % Update joint angles
end

if ~success
    warning('Inverse kinematics did not converge within the maximum number of iterations');
end