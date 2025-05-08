function [k,limits] = derivativeMethod(indexF , aInitial , bInitial , l)
%indexF is the index of the function selected. 1 for f1, 2 for f2 and 3 for f3
%aInitial is the lower limit
%bInitial is the upper limit
%l is the final search margin

a_k(1) = aInitial ;
b_k(1) = bInitial ;
k = 0 ;
n=0;

a = aInitial ; 
b = bInitial ;
while (0.5)^n > l/(b-a)
    n=n+1;
end

for iK = 1:1:n
    k = iK;
    x = (a+b)/2;
    d = derivativeSelector(x,indexF);
    if d==0
        break ;

    elseif d > 0
        b = x;
        a_k(k+1) = a ;
        b_k(k+1) = b ; 

    else 
        a = x;
        a_k(k+1) = a ;
        b_k(k+1) = b ; 
    end   
end
limits = [a_k ; b_k] ;
end