% John Heath
% ACM 116 Problem Set 1 
% Problem 4
clc; clear; close all;

% Note: fix tosses the decimal.
rolls = fix(rand(10000,1) .* 6 + 1); % simulate 10^4 die rolls.

% A occurs if roll is a 2, 4, or 6
A = rolls == 2 | rolls == 4 | rolls == 6;
% B occurs if roll is 1, 2, 3, or 4
B = rolls == 1 | rolls == 2 | rolls == 3 | rolls == 4;
% A and B both occur if a roll is 2, or 4
AB = rolls == 2 | rolls == 4;

% P(A) will be given by the number of times A occurs versus the total
% number of attempts. This is a average value of the A vector. B and AB
% follow suit. 
p_A = mean(A);
p_B = mean(B);
p_AB = mean(AB);

fprintf("P(A)  is %.3f. \n", p_A);
fprintf("P(B)  is %.3f. \n", p_B);
fprintf("P(AB) is %.3f. \n", p_AB);
fprintf("P(A) * P(B) is %.3f. \n", p_A .* p_B);