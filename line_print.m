function line = line_print(w,error)
%LINE_PRINT Summary of this function goes here
%   Detailed explanation goes here
    format long
    eq_string = '';
    n = size(w, 1);
    for i =1:n
        eq_string = append('+ ',num2str(w(i), 10),'X^', num2str(i-1),' ',eq_string);
    end
    eq_string = eq_string(2:end);
    line_string = append('Fitting line: ', eq_string);
    disp(line_string);
    disp(append('Totall error: ', num2str(error, 10)));
    disp(' ');
end

