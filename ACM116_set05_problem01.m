% John Heath
% ACM 116 Problem Set 5
% Problem 1B
clc; clear; close all;

% time interval between appointments. 
dt = 30;

% Draw appointment durations independently from the exponential
% distribution with lambda = 1/dt. Note that matlab parametrizes the
% exponential distribution with mu = 1/lambda, so mu = dt.
num_appts = cast(5 .* 60 ./ dt, 'int32'); 
N = 10000;
T = exprnd(dt, [num_appts, N]);

% For every patient, the waiting time is equal to the maximum of 0 and the
% waiting time of the previous patient plus the previous patient's
% appointment duration minus the time allotted for the appointment.
W = zeros(num_appts, N);
for i = 2:num_appts
    W(i, :) = max(0, T(i-1, :) + W(i-1, :) - dt);
end
% average the waiting times across the realizations for each patient
wAvg = sum(W, 2) ./ N;
plot(1:10, wAvg, '.b', 'markersize', 15);
hold on;
plot(2, 30 ./ exp(1), '.r', 'MarkerSize', 12);
hold off;
legend("Simulated  expected waiting times", ...
    "Theoretical expected waiting time for patient 2")
xlabel('Patient Number');
ylabel('Expected waiting time (min)');
title('Average simulated waiting time vs. place in queue');

% Part C
% We can just print out the expected time for the 10th patient in the 30
% minute case:
fprintf(...
"The expected waiting time for the 10th patient with dt = 30 min is %.3f",...
wAvg(10))
fprintf(" minutes. \n")

% We can re-run the above code with a different dt to find the expected
% time for the 20th patient if dt = 15. 
dt = 15;
num_appts = cast(5 .* 60 ./ dt, 'int32'); 
T = exprnd(dt, [num_appts, N]);
W = zeros(num_appts, N);
for i = 2:num_appts
    W(i, :) = max(0, T(i-1, :) + W(i-1, :) - dt);
end
wAvg15 = sum(W, 2) ./ N;

% Report the value:
fprintf(...
"The expected waiting time for the 20th patient with dt = 15 min is %.3f",...
wAvg15(20))
fprintf(" minutes. \n");

% Comment Appropriately
if wAvg15(20) > wAvg(10)
    disp("It is better to be the 10th patient with dt = 30 minutes.")
else
    disp("It is better to be the 20th patient with dt = 15 minutes.")
end