function [xNew,yNew] = armijo(x,y,d)
    s=1;    %initial step
    a=0.001; %alpha should be between 10^-5 and 0.1
    b=0.2;  %beta should be between 0.1 and 0.5
    mk=0;
    gammaArmijo = s*b^mk;
    xNew = x + gammaArmijo*d(1);
    yNew = y + gammaArmijo*d(2);
    v1 = func(x,y);
    v2 = func(xNew,yNew);
    
    while (v1-v2)<=(-a*(b^mk)*s*d'*grad(x,y))
        mk = mk + 1;
        gammaArmijo = s*b^mk;
        xNew = x + gammaArmijo*d(1);
        yNew = y + gammaArmijo*d(2);
        v2 = func(xNew,yNew);
    end
end
