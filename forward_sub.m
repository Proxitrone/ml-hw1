function y = forward_sub(L, P, e)
%FORWARD_SUB Summary of this function goes here
%   Detailed explanation goes here
    m = size(e,1);
    y = zeros(m,1);
    b = P*e;
    for i=1:m
       y(i)= (b(i) - (L(i,:)*y))/L(i,i);
    end
    
end

