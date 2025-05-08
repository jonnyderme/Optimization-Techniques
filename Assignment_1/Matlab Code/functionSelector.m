function f = functionSelector(x,indexFunction)

    if indexFunction==1  % Function 1
        f = (x-1)^3 + ((x-4)^2)*cos(x);
      
    elseif indexFunction==2  % Function 2
        f = exp(-2*x) + (x-2)^2 ; 

    elseif indexFunction==3     % Function 3
        f = (x^2)*log(0.5*x) + sin(0.2*x) ; 
    
    else
        print("Error\n") 
    end
end
