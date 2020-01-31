n = 100;
reps = 20000;
boxes = zeros(reps, 1);
for i = 1:reps
    pokedex = 1:n;
    num_pokemon = 0;
    while(sum(pokedex) ~= 0)
        num_pokemon = num_pokemon + 1;
        pokemon = fix(rand(1,1) .* n + 1);
        if(ismember(pokemon, pokedex))
            pokedex(pokemon) = 0;
        end
    end
    boxes(i) = num_pokemon;
end
fprintf("The expected number of boxes for n = %i is %.3f.", n, mean(boxes));