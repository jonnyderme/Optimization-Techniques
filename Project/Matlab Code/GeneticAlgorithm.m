function [bestCandidate,errorBestChromosome] = GeneticAlgorithm(gaussiansNum,maxGenerations,mutationChance,nextGenPercentages)

tic;

populationSize = 150 ; 
generation = 1 ; 
chromosomes = gaussiansNum * 5 ; 

numGenes = gaussiansNum * 5 ;
genes = zeros(1,chromosomes) ;
population = zeros(populationSize,numGenes+1) ;

% Limits for u1,u2 and centers c1,c2
u1Limits = [-1,2] ; 
u2Limits = [-2,1] ; 

c1Limits = [u1Limits(1)-2 u1Limits(2)+2] ;    
c2Limits = [u2Limits(1)-2 u1Limits(2)+2] ;

errorBestChromosome = NaN(1,maxGenerations);
bestChromosome = zeros(maxGenerations,numGenes+1); %stores every chromosome of every generation

numPointsMinMax = 200 ; 
[minf,maxf] = functionLimits(numPointsMinMax) ;

% First Generation - Random values
numPointsMSE = 50 ; 
for iP = 1:populationSize
    for iC = 1:5:numGenes
        genes(iC) = minf + (maxf - minf)*rand; % A parameter : Magnitude of each Gausssian function
        genes(iC+1) = c1Limits(1) + (c1Limits(2) - c1Limits(1))*rand; %center1
        genes(iC+2) = c2Limits(1) + (c2Limits(2) - c2Limits(1))*rand; %center2
        genes(iC+3) = 0.2 + 1.1 * rand ; % sigma1 between [0.2,1.3]
        genes(iC+4) = 0.2 + 1.1 * rand ; % sigma2 between [0.2,1.3]
    end
    population(iP,1:numGenes) = genes;
    population(iP,numGenes+1) = fitnessFunction(genes,numGenes,numPointsMSE);
end

% Sorting the 1st generation based on the fitness score of each indivual.
population = sortrows(population,numGenes+1);

bestChromosome(generation,:) = (population(1,:));
errorBestChromosome(generation) = population(1,numGenes+1); 
prevError = population(1,numGenes+1);


bestChromPerc = nextGenPercentages(1) ;
randomPerc = nextGenPercentages(2) ;                  % "random" percentages for the   
crossoverPerc = nextGenPercentages(3) ;               % crossover method.

% Check that the 3 percentages for the next generation are correct 
if (sum(nextGenPercentages)~=1)
    fprintf('Wrong percentages for the next generation\n')
end

% Selections of chromosomes depending on every percentage 
bestSelections = populationSize*bestChromPerc ;
randomSelections = populationSize*randomPerc ;
crossoverSelections = populationSize*crossoverPerc ;

randomStart = bestSelections +1 ;
randomEnd = randomStart + randomSelections - 1 ;
 
bestChromPopulation = population(1:bestSelections,1:numGenes) ;
crossoverPopulation = zeros(crossoverSelections, length(bestChromPopulation)) ;

while ( prevError >=0.001 && generation <= maxGenerations)
    generation = generation + 1;

    randomData = zeros(1,randomSelections) ;
    randomPopulation = population(randomStart:end,1:numGenes) ; 

    for i=1:randomSelections
       randomData(i) = randi(size(randomPopulation,1));
    end
   
    selectedPopulation = randomPopulation(randomData,:);
    population(randomStart:randomEnd, 1:end-1) = selectedPopulation ;

    % Apply crossover on the pseudorandom part of our population that we chose.
    for i=1:crossoverSelections
      randBest = zeros(1,2) ; 
      while (randBest(1)==randBest(2))
            randBest = [randi(size(bestChromPopulation,1)) randi(size(bestChromPopulation,1))] ;
      end
      crossoverPopulation(i,:) = averageCrossover(bestChromPopulation(randBest(1),:),bestChromPopulation(randBest(2),:));
      population(randomEnd+1:end, 1:numGenes) = crossoverPopulation ;
    end

    %Mutating some of the  individuals
    for i = 1:populationSize
      if rand * 100 < mutationChance   
        population(i,1:numGenes) = mutation(population,numGenes,populationSize);
      end
    end

    %Calculate again the fitness for each gene
    for j = 1:populationSize
        population(j,numGenes+1) = fitnessFunction(population(j,1:numGenes),numGenes,numPointsMSE);
    end

    % Sorting our population for each generation based on the fitness score 
    % of each indivual.
    population = sortrows(population,chromosomes+1);

    bestChromosome(generation,:) = (population(1,:));
    errorBestChromosome(generation) = population(1,(chromosomes+1)); 
    prevError = population(1,numGenes+1);
end


bestChromosome = sortrows(bestChromosome,numGenes+1) ;
idx = 1 ; 
while(     (bestChromosome(idx,1)==bestChromosome(idx,6)) ...
        || (bestChromosome(idx,2)==bestChromosome(idx,7)) ...
        || (bestChromosome(idx,3)==bestChromosome(idx,8)) ...
        || (bestChromosome(idx,4)==bestChromosome(idx,9)) ...
        || (bestChromosome(idx,5)==bestChromosome(idx,10)) ...
      )
    idx = idx+1 ; 
end


% index of the generation with the lowest MSE.
bestCandidate = bestChromosome(idx,1:end-1) ; % take the individual with that index

elapsedTime = toc;
disp(['Elapsed time for the implemented Genetic Algorithm with ' num2str(gaussiansNum)  ' Gaussians : ' num2str(elapsedTime) ' seconds\n']);

end