function error = linear_regression(testcase_file, bases, lambda)
%LINEAR_REGRESSION Summary of this function goes here
%   Detailed explanation goes here
    
%% Load data
    testcase = load(testcase_file);
    error = 1;
%% LSE    
    lse();
    

%% Newton
    newton();


%% Plots
    figure;
    h = scatter(testcase(:,1), testcase(:,2));
    set(h,'Marker','square');

    error = 0;
end

