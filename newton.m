function [w, error] = newton(x, y, n, lambda)
%NEWTON Summary of this function goes here
%   Detailed explanation goes here
    
    max_iter = 20;
    obj = [];
    epsilon = 10e-4;
    % Design matrix based on n
    PHI = ones(size(x,1), n);
    for i=1:n
       PHI(:,i) = x.^(i-1); 
    end
    
    H = 2*(PHI'*PHI);
    w_prev = ones(size(PHI,2), 1);
    for i =1:max_iter
        grad = 2*(PHI'*PHI)*w_prev - 2*PHI'*y;
        % Use my LU inv
        %w_next = w_prev - inv(H)*grad;
        w_next = w_prev - my_LU_inv(H)*grad;
        
        obj = [obj, norm(PHI*w_next-y)^2];
        if (i>1 && obj(i)-obj(i-1)<epsilon)
           w = w_next;
           break; 
        end
        w_prev = w_next;
    end
    
    
    error = obj(end);
end

