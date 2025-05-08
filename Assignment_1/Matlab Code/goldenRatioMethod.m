function [k,limits] = goldenRatioMethod(indexF , aInitial , bInitial , l)
%indexF is the index of the function selected. 1 for f1, 2 for f2 and 3 for f3
%aInitial is the lower limit
%bInitial is the upper limit
%l is the final search margin


a_k(1) = aInitial ;
b_k(1) = bInitial ;
k = 0;
gamma = 0.618; %phi

a = aInitial ; 
b = bInitial ; 
while  b-a >= l
    x1 = a + gamma*(b-a);
    x2 = a + (1-gamma)*(b-a);
    if functionSelector(x2,indexF) < functionSelector(x1,indexF)
        b = x1;
    else
        a = x2;
    end

    k = k + 1;
    %fprintf('k=%d\n',k) ;
    a_k(k+1) = a ;
    b_k(k+1) = b ; 
    %fprintf("a = %d", a_k(k), "b = %d\n", b_k(k)) ; 

end 
limits = [a_k ; b_k] ; 
end
