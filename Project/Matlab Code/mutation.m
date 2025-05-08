
function mut_pop = mutation(individual,gsize,populationNum)
% Function that randomly chooses one gene from the individual to mutate.

% random value within its set limits.
mutationGene = randi(populationNum);

switch(mod(mutationGene,5))
    case 1
        individual(mutationGene,1:5:gsize) = -1 + 2*rand; %magnitude of Gaussian
    case 2
        individual(mutationGene,2:5:gsize) = -3 + 7*rand; %center1 [-3,4]
    case 3
        individual(mutationGene,3:5:gsize) = -4 + 7*rand; %center2 [-4,3]
    case 4
        individual(mutationGene,4:5:gsize) = 0.2 + 1.1 * rand; %sigma1 [0.2,1.3]
    case 0
        individual(mutationGene,5:5:gsize) = 0.2 + 1.1 * rand; %sigma2 [0.2,1.3]
end
mut_pop = individual(mutationGene,1:gsize); %The individual, with one of his genes changed
end