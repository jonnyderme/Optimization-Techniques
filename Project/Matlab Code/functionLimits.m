function [minf,maxf] = functionLimits(numPoints)
% Calculating the maximum and the mininum value of f(u1,u2) 

fValues = zeros(numPoints,numPoints) ;
u1Values = linspace(-1,2,numPoints) ; 
u2Values = linspace(-2,1,numPoints) ; 

u1Count = 1;

for iU1 = 1: numPoints
    u2Count = 1 ;
    for iU2 = 1: numPoints
        fValues(u1Count,u2Count) = f(u1Values(iU1),u2Values(iU2)) ;
    u2Count = u2Count + 1 ;
    end
    u1Count = u1Count + 1 ;
end

minf = min(min(fValues)) ;
maxf = max(max(fValues)) ;
end