% John Heath
% ACM 116 Problem Set 2
% Problem 4C
clc; clear; close all;

lambda = 1;
n = 100;
m = 120;
rep = 10.^4;
% generate 10000 x 100 draws from the poisson distribution
samples_all = poissrnd(lambda, rep, n);
% sum each set of 100 draws to make each S_n
samples = sum(samples_all, 2);
% determine whether each sum is greater than m
samples = samples >= m;
freq = sum(samples) ./ length(samples);
fprintf("The simulation says that P(S_n > m) is about %.4f.\n", freq);
fprintf("The markov bound says that P(S_n > m) <= %.4f.\n",...
        n .* lambda ./ m);
fprintf("The central limit theorem says that P(S_n > m) is about %.4f.\n",...
        0.5 - 0.5 .* erf((m - n .* lambda)./sqrt(2 .* lambda .* n)));