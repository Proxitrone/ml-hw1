function x = backward_sub(U, y)
%BACKWARD_SUB Summary of this function goes here
%   Detailed explanation goes here

    m = size(y,1);
    x = zeros(m,1);
    for i=m:-1:1
        x(i)= (y(i) - (U(i,:)*x))/U(i,i);
    end
end

