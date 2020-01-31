% John Heath
% ACM 116 Problem Set 2
% Problem 5
clc; clear; close all;

fprintf("The real value of I is %.4f.\n", 1./4);
% Part A
% To approximate I = \int_0^1{x^3}, We can take the sum:
% (1/N) * \sum_{i = 1}^N{x_i^3}
samples = rand(100,1);
approx_1 = (1 ./ 100) .* sum(samples.^3);
fprintf("The Monte Carlo Approx. for I using the uniform distribution is %.4f.\n"...
    , approx_1);

% Part B (see explanation on earlier page)
x = betarnd(4, 1);
f = betapdf(x, 4, 1);
fprintf("The Monte Carlo Approx. for I using the beta distribution is %.4f.\n"...
    , x.^3 ./ f);