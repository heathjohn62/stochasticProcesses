% John Heath
% ACM 116 Problem Set 2
% Problem 6
clc; clear; close all;

for i=1:4
    n = 10.^i;
    N = 10.^3;
    % Generate n x N samples from the Rademacher distribution.
    rademacher_samples = (rand(N, n) < 0.5) .* 2 - 1;
    % sum across each set of 10  and normalize to get each Y_n.
    Yn = (sum(rademacher_samples, 2) ./ n) .* sqrt(n);
    figure;
    ecdf(Yn);
    hold on;
    x = linspace(-5, 5, 100);
    plot(x, normcdf(x, 0, 1),'-');
    hold off;
    title(sprintf("ECDF of normalized rademacher samples versus std. normal CDF for n=%i.", n));
    legend('Emperical CDF', 'Standard Normal CDF')
end
