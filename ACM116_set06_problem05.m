% John Heath
% ACM 116 Problem Set 6
% Problem 5
clc; clear; close all;
N = 1000;
reps = 1000;
m = zeros(reps, 1);
% synthesize a lower triangular matrix of 0.1s, like I drew in the last
% page of the problem set.
T = tril(ones(N)) .* 0.1;
figure();
hold on;
for i = 1:reps
    % draw the standard normal RVs in a vector
    Z = normrnd(0, 1, N, 1);
    % Calculate the Brownian motion vector
    B = T * Z;
    % Record the maximum because that's all we need for the calulation.
    m(i) = max(B);
    plot(linspace(0, 10, 1000), B)
end
hold off;
% Determine the probability that the motion reached the point 4.
m = m >= 4;
prob = mean(m);
fprintf("The simulated probability that the brownian motion travels as \n");
fprintf("far as m=4 is %.3f.\n\n", prob);

theory = 2 .* (1 - normcdf(4 ./ sqrt(10)));

fprintf("The theoretical probability that the brownian motion travels as \n");
fprintf("far as m=4 is about %.5f.\n", theory);