% John Heath
% ACM 116 Problem Set 5
% Problem 4B Sanity Check
clc; clear; close all;

tau = 4.0;
lam = 1/5;
N = 100000;
iterations = zeros(N, 1);
for i = 1:N
    T = exprnd(1 ./ lam);
    time = 0;
    while T <= tau
        time = time + T;
        T = exprnd(1 ./ lam);
    end
    iterations(i) = time;
end
fprintf("Simulated: %.3f\n", mean(iterations));

theory =  (- lam .* tau + exp(lam .* tau) - 1) ./ lam;

fprintf("Theoretical: %.3f\n", theory);