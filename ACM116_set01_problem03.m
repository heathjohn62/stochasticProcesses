% John Heath
% ACM 116 Problem Set 1 
% Problem 3
clc; clear; close all;

p = 0.3;
expected_value = zeros(100,1);
for n = 1:100
    experiment = rand(n, 1000) < p; % flipping n coins for 1000 trials
    % sums across the columns, taking the total for each set of n coins.
    experiment = sum(experiment, 1);
    % find the average number of heads across the 1000 trials.
    expected_value(n,1) = mean(experiment);
end
n = 1:100;

figure;
plot(n,expected_value, '.');
hold on;
plot(n, n .* p);
hold off;
legend('Predicted', 'Simulation');
title("Exact and simulated expected value for 1-100 coin flips.");
xlabel("n");
ylabel("Expected Value");

figure;
histogram(experiment, 'BinWidth', 1);
title("Simulation of the # of heads resulting from 100 coin flips.")
xlabel("# of heads in each of 1000 trials")
ylabel("# of trials resulting in x heads")