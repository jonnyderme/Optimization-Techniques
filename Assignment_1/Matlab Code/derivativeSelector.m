function derivativef = derivativeSelector(x,indexDerivative)

    if indexDerivative==1   % Function 1
       derivativef = 3*(x-1)^2 + 2*(x-4)*cos(x) - ((x-4)^2)*sin(x) ;
       syms x ; 
       derivativeF = diff((x-1)^3 + ((x-4)^2)*cos(x)) ; 
       derivativeF = char(derivativeF) ;
       %fprintf('The derivative of function %d is : %s \n ',indexDerivative , derivativeF) ;

    elseif indexDerivative==2  % Function 2
        derivativef =2*x - 2*exp(-2*x) - 4 ;   
        syms x ;
        derivativeF = diff(exp(-2*x) + (x-2)^2) ; 
        derivativeF = char(derivativeF) ;
        %fprintf('The derivative of function %d is : %s \n ',indexDerivative , derivativeF) ;

    elseif indexDerivative==3  % Function 3
       derivativef = x + cos(x/5)/5 + 2*x*log(x/2) ;
       syms x ; 
       derivativeF = diff((x^2)*log(x/2) + sin(0.2*x)) ;
       derivativeF = char(derivativeF) ;
       %fprintf('The derivative of function %d is : %s \n ',indexDerivative , derivativeF) ;
   
    else
        print("Error.Wrong inputs\n") 
    end
end