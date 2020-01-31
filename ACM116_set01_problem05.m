% John Heath
% ACM 116 Problem Set 1 
% Problem 5B
clc; clear; close all;

lambda = 5;
samples = 10000;
uniform_samples = rand(samples,1); 
exp_samples = -log(1 - uniform_samples) ./ lambda;

% Actually draw from the exponential distribution.
x = linspace(0, 2.5, 300);
exp_pdf = lambda .* exp(-lambda .* x);

figure;
histogram(exp_samples, 'normalization', 'pdf');
hold on;
line(x,exp_pdf, 'LineWidth', 2, 'Color', 'red');
hold off;
title("Simulated draws from the exponential distribution using the inverse transform method.")
legend('normalized samples', 'PDF')