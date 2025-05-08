function [child1, child2] = Point1Crossover(parent1, parent2)
    % Perform one-point crossover on two parent chromosomes.

    % Ensure that crossover point is a valid index
    crossoverPoint = randi([1, min(length(parent1), length(parent2)) - 1]);

    % Perform crossover
    child1 = [parent1(1:crossoverPoint), parent2(crossoverPoint+1:end)];
    child2 = [parent2(1:crossoverPoint), parent1(crossoverPoint+1:end)];
end
