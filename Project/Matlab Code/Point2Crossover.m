function [child1, child2] = Point2Crossover(parent1, parent2)
    % Perform two-point crossover on two parent chromosomes.

    % Ensure that crossover points are valid indices
    crossoverPoint1 = randi([1, min(length(parent1), length(parent2)) - 1]);
    crossoverPoint2 = randi([crossoverPoint1 + 1, min(length(parent1), length(parent2))]);

    % Perform crossover
    child1 = [parent1(1:crossoverPoint1), parent2(crossoverPoint1+1:crossoverPoint2), parent1(crossoverPoint2+1:end)];
    child2 = [parent2(1:crossoverPoint1), parent1(crossoverPoint1+1:crossoverPoint2), parent2(crossoverPoint2+1:end)];
end
