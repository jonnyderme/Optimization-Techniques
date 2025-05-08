function value = fBar(u1Bar,u2Bar,genes,size)
%Calculation of fBar
% Function to calculate value for each Gaussian kernel

value = 0 ;
for i = 1:5:size

    A = genes(i) ;     % magnitude of gaussian
    c1 = genes(i+1) ;  % center c1 
    c2 = genes(i+2) ;  % center c2
    s1 = genes(i+3) ;  % standard deviation s1
    s2 = genes(i+4) ;  % standard deviation s2

    power = ((u1Bar-c1)^2/(2*s1^2)) + ((u2Bar-c2)^2/(2*s2^2)) ;
    value = value + A * exp(-power) ;
end

end