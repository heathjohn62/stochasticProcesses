% John Heath
% ACM 116 Problem Set 5
% Problem 2 Sanity Check
clc; clear; close all;

lam = 0.3;
theory = (lam.^3 + 2 .* lam.^4 + 2 ./ 3 .* lam.^5) .* exp(-4 .* lam);
fprintf("Theoretical probability for lambda = 0.3: %.5f \n", theory);
N = 10000000;
draws_1 = poissrnd(lam, N, 1);
draws_2 = poissrnd(lam, N, 1);
draws_3 = poissrnd(lam, N, 1);
draws_4 = poissrnd(lam, N, 1);

events_0_2 = draws_1 + draws_2;
events_1_4 = draws_2 + draws_3 + draws_4;
bool_array = events_0_2 == 2 & events_1_4 == 3;
prob = sum(bool_array) / N;
fprintf("Simulated probability for lambda = 0.3:   %.5f \n", prob);