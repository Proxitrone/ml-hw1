function [X, L, U, P] = my_LU_inv(A)
%MY_LU Summary of this function goes here
%   LUP factorization
    N = size(A, 1);
    P = eye(N);
    L = zeros(N);
    A_temp = A;
    %temp_row = zeros(1)
    for i=1:N
        % Find max element beneath diagonal i
        [~, index] = max(A_temp(i:N, i));
        if index>1
            % Swap rows to put max element into diagonal
            % record the change in P and L
            temp_row_A = A_temp(i,:);
            temp_row_P = P(i,:);
            temp_row_L = L(i,:);
            A_temp(i,:) = A_temp(i+index-1,:);
            P(i,:) = P(i+index-1,:);
            L(i,:) = L(i+index-1,:);
            A_temp(i+index-1,:) = temp_row_A;
            P(i+index-1,:) = temp_row_P;
            L(i+index-1,:) = temp_row_L;
        end
        
        for j=i+1:N
           % Divide each row beneath the diagonal by the element in the diagonal
           L(j, i) = A_temp(j,i)/A_temp(i,i);
           A_temp(j,:) = A_temp(j,:) - L(j, i)*A_temp(i,:);
        end
    end
    
    L = L + eye(N);
    U = A_temp;
    %%%%%%%%%% Inverse
    % Solve the equation LUX=PI
    % Once we have LU, we solve 2 equations
    % 1. Ly=PB for y
    % 2. UX = y for x
    X = zeros(N);
    I = eye(N);
    for i=1:N
        % Solve for each column of X
        % LUX(:,i) = PI(:,i)
        % 1. Ly = PI(:,i)
       
        y = forward_sub(L, P, I(:,i));
        % 2. UX(:,i) = y
        
        X(:,i) = backward_sub(U, y);
    end
    
end

