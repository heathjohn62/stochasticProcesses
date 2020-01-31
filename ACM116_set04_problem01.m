% John Heath
% ACM 116 Problem Set 4
% Problem 1B
clc; clear; close all;

A = [1./12, 1./12, 1./12;
    1./12, 29./12, 1./12;
    1./12, 1./12, 13./12];

[Q,D] = eig(A);
disp("Here is the decorrelating transformation for W:");
Q