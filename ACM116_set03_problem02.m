% John Heath
% ACM 116 Problem Set 3
% Problem 2, Part C
clc; clear; close all;
a = 2;
b = 6;
g = 2;
n = 10.^4;
% draw all the exposure levels from the beta distribution
x = betarnd(a, b, n, 1);
% turn exposure levels into probabilities by exponentiating by gamma
prob = x.^g;
% randomly determine whether they get the disease given the probability. 
students = rand(n, 1);
% 1 if sick, 0 if healthy
sick = students < prob;
% Compute the expected value of x given that the student is sick
num_sick_students = sum(sick);
% This sums all the values of x that correspond to a sick student. 
x_expectation = sum(sick .* x) ./ num_sick_students;

fprintf("The simulated expected value of x among sick students is %.3f.\n", ...
    x_expectation);
expectation_real = (a + g) ./ (a + b + g);
fprintf("The theoretical expected value of x among sick students is %.3f.\n",...
    expectation_real);
