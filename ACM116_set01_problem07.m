p = 0.8;
repetitions = 10000;
results1 = zeros(repetitions, 1);


for i=1:repetitions
    y1 = 0;
    y2 = 0;
    while(y1 == y2)
        y1 = rand(1,1) < p;
        y2 = rand(1,1) < p;
    end
    if(y2 == 0)
        results1(i) = 0;
    else
        results1(i) = 1;
    end
end
fprintf("The Average of all flips for algorithim 1 is %.3f.\n", mean(results1));

% Algorithm 2
results2 = zeros(repetitions, 1);
for i=1:repetitions
    y1 = rand(1,1) < p;
    y2 = rand(1,1) < p;
    while(y1 == y2)
        y1 = y2;
        y2 = rand(1,1) < p;        
    end
    if(y2 == 0)
        results2(i) = 0;
    else
        results2(i) = 1;
    end
end
fprintf("The Average of all flips for algorithim 2 is %.3f.\n", mean(results2));