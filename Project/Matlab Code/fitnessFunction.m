function MSE = fitnessFunction(genes,size,numPoints)
% Calculation of the fitness function : MSE

u1Limits = [-1 2] ;
u2Limits = [-2 1] ;

u1Values = linspace(u1Limits(1),u1Limits(2),numPoints) ;
u2Values = linspace(u2Limits(1),u2Limits(2),numPoints) ;

error = 0;
n = numPoints^2;

for iU1 = 1: numPoints
   for iU2 = 1: numPoints

       error = error + ( f(u1Values(iU1),u1Values(iU2))  - fBar(u1Values(iU1),u1Values(iU2),genes,size))^2;
    end
end
% Mean Square Error
MSE = error/n; 
end