function [w, error] = lse(x, y, n, lambda)
%LSE Summary of this function goes here
%   Detailed explanation goes here
    
    % Design matrix based on n
    PHI = ones(size(x,1), n);
    for i=1:n
       PHI(:,i) = x.^(i-1); 
    end
    % Inverse of PHI to gett solution
    %w = inv(PHI'*PHI+lambda*eye(size(PHI'*PHI)))*PHI'*y;
    w = my_LU_inv(PHI'*PHI+lambda*eye(size(PHI'*PHI))) * PHI'*y;
    error = norm(PHI*w-y)^2;
end

