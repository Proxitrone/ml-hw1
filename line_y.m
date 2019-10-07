function y = line_y(w, x)
%LINE_Y Summary of this function goes here
%   Detailed explanation goes here
    
    y =0;
    n = size(w,1);
    for i=1:n
        y = y+x.^(i-1)*w(i);
    end
end

