function [x1new x2new] = SteepestDescentProjection(xkbar , x1Limits , x2Limits)
    x1Old = xkbar(1);
    x2Old = xkbar(2);
    
    x1new = x1Old;
    x2new = x2Old;

    if x1Old >= x1Limits(2)
        x1new = x1Limits(2);
    elseif x1Old <= x1Limits(1)
        x1new = x1Limits(1);
    end

    if x2Old >= x2Limits(2)
        x2new = x2Limits(2);
    elseif x2Old <= x2Limits(1)
        x2new = x2Limits(1);
    end
end

