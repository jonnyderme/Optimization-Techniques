function [k, limits] = fibonacciMethod(indexF , aInitial , bInitial ,l)
%indexF is the index of the function selected. 1 for f1, 2 for f2 and 3 for f3
%aInitial is the lower limit
%bInitial is the upper limit
%l is the final search margin

a_k(1) = aInitial ;
b_k(1) = bInitial ;
k = 0;
i = 0;

a = aInitial ; 
b = bInitial ;
while  fibonacci(i) < (b-a)/l
    i = i + 1 ;   
end

for k = 1:1:(i-1)
    x1 = a + fibonacci(i-k)/fibonacci(i-k+1)*(b-a);
    x2 = a + fibonacci(i-k-1)/fibonacci(i-k+1)*(b-a);
    if k == i-1
        x2 = a + fibonacci(i-k)/fibonacci(i-k+1)*(b-a)+0.001;
    end

    if functionSelector(x2,indexF) < functionSelector(x1,indexF)
        b = x1;

    else
        a = x2;
    end

    % fprintf('k=%d\n',k) ;
    a_k(k+1) = a ;
    b_k(k+1) = b ; 
    % fprintf("a = %d", a_k(k+1), "b = %d\n", b_k(k+1)) ; 
end
limits = [a_k ; b_k] ; 

 
end
