% John Heath
% ACM 116 Problem Set 4
% Problem 3B
clc; clear; close all;

% Generate 10 2-vectors from the normal distribution with 0 mean, sigma = 1
X = normrnd(0, 1, 10, 2);
G = [1 2; 3 4];
SigmaW = [.03.^2, 0; 0, .03.^2];
% Generate 10 2-vectors for noise
W = normrnd(0, .03, 10, 2);
% matrix for holding results to be calculated
Xestimate = zeros(10, 2);
% loop through the output for each vector and make the estimate using the
% Weiner filter. 
for i = 1:10
    x = [X(i, 1); X(i, 2)];
    w = [W(i, 1); W(i, 2)];
    
    % Calculate the output
    y = G * x + w;
    
    % Calculate the wiener filter
    % Sigma_x is the identity, mu_x = 0
    g = G.' * inv(G * G.' + SigmaW) * y;
    Xestimate(i, 1) = g(1);
    Xestimate(i, 2) = g(2);
end

figure;
plot(X(:, 1), X(:, 2), '.b', 'MarkerSize', 10);
hold on;
plot(Xestimate(:, 1), Xestimate(:, 2), '.r', 'MarkerSize', 10);
hold off;
legend('Input', 'Wiener Filter Approximation');
title("Simulation of Weiner filter for n = 10 standard normal 2-vectors.");
xlabel("Component 1");
ylabel("Component 2");
