% John Heath
% ACM 116 Problem Set 6
% Problem 1
clc; clear; close all;

lam = 5;
iterations = 100000;
times = []; % we will append to this array whenever we have a valid time.
for i = 1:iterations
    failed = false;
    num_survived = 0;
    t = 0;
    while (~failed)
        % Failures are a poisson process, so waiting times are
        % exponentially distributed. 
        t = t + exprnd(1 ./ lam);
        if (rand() < 0.1)
            failed = true;
        else
            num_survived = num_survived + 1;
        end
    end
    if (failed && num_survived == 9)
        times = [times t];
    end
end
fprintf("The expected time until failure given that it takes \n");
fprintf("10 shocks to fail the system is about %.4f seconds.\n", mean(times));