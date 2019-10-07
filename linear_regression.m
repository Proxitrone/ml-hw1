function [error_lse, error_newt] = linear_regression(testcase_file, bases, lambda)
%LINEAR_REGRESSION Summary of this function goes here
%   Detailed explanation goes here
%% Load data
    testcase = load(testcase_file);
    error = 1;
    x= testcase(:,1);
    y = testcase(:,2);
%% LSE    
    [w_lse,error_lse]  = lse(x, y, bases, lambda);
    disp("LSE:");
    line_print(w_lse, error_lse);

%% Newton
    [w_newt, error_newt] = newton(x, y, bases, lambda);
    disp('Newton''s Method:')
    line_print(w_newt, error_newt);
    
%% Plots
    figure;
    subplot(2, 1, 1);
    h = scatter(testcase(:,1), testcase(:,2));
    set(h,'Marker','o');
    hold on
    
    x = linspace(-6, 6);
    y = line_y(w_lse, x);
    plot (x, y);
    title("LSE");
    hold off
    
    subplot(2, 1, 2);
    h = scatter(testcase(:,1), testcase(:,2));
    set(h,'Marker','o');
    hold on
    y = line_y(w_newt, x);
    plot (x, y);
    title("Newton''s method");
    hold off
    
    
end

