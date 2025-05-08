%% Task 3 -- Newton minimization method with step gamma selected based on Armijo's rule

% Define function 
syms f(x, y);
f(x, y) = (x^3) * exp(- x^2 - y^4);
derivativeF = diff(f(x,y)) ;
derivativeF = char(derivativeF) ;

% Plot the function
figure('Name', 'Function plot');
fsurf(f);
xlabel('x');
ylabel('y');
zlabel('f(x, y)');
title(['Function Plot :' char(f)])

gradientF = gradient(f) ;
h = hessian(f) ;   % hessian matrix of f


% epsilon termination constant
epsilon = 0.01;

s=1;    %initial step
a=0.001; % alpha usually at [10^-5,0.1]
b=0.2;  %  beta usually at [0.1,0.5]

%%   Algorithm cannot be terminated --- Hessian matrix not positively definite or wrong results computed 

%% Initial point (0, 0)
initialPoint1 = [0 0];
inPoint1 = [0 0];
Points1Const = zeros(1,2);
Points1Const(1, :) =inPoint1;
k1 = 1;

gradfValue1 = transpose(double(gradientF(inPoint1(1), inPoint1(2))));
% Armijo Rule 
while norm(gradfValue1) >= epsilon
    inPoint1Old = inPoint1 ;
    mk = 1;
    gammaArmijo1 = s*b^mk ; 
    inPoint1 = inPoint1 - gammaArmijo1 *  transpose(( double(inv( h(inPoint1(1), inPoint1(2))) ) * transpose(gradfValue1)));

    while f(inPoint1Old(1), inPoint1Old(2)) - f(inPoint1(1), inPoint1(2)) < ...
            - a * b^mk * s * ( transpose(( double(inv( h(inPoint1(1), inPoint1(2))) ) * transpose(gradfValue1))))
        mk = mk + 1;
    end
    gammaArmijo1 = s*b^mk;  % new gamma
    Points1Armijo(end + 1, :) = inPoint1;
    gradfValue1 = transpose(double(gradientF(inPoint1(1), inPoint1(2))));
    k1 = k1 + 1;

     if (k1 == 151 || f(Points1Armijo(end,1),Points1Armijo(end,2)) >= f(Points1Armijo(end-1,1),Points1Armijo(end-1,2)))  % newton cannot be terminated , this is to be terminated
                break
     end
end


%% Initial point (-1, -1)
initialPoint2 = [-1 -1];
inPoint2 = [-1 -1];
Points2Armijo = zeros(1,2);
Points2Armijo(1, :) =inPoint2;
k2 = 1;

gradfValue2 = transpose(double(gradientF(inPoint2(1), inPoint2(2))));
% Armijo Rule 
while norm(gradfValue2) >= epsilon % Algorithm cannot be terminated --- Hessian matrix not positively definite or wrong results computed
    inPoint2Old = inPoint2 ;
    mk = 0;
    gammaArmijo2 = s*b^mk ; 
    inPoint2 = inPoint2 - gammaArmijo2 * transpose(double(inv( h(inPoint2(1), inPoint2(2))) * transpose(gradfValue2)));

    while func(inPoint2Old(1), inPoint2Old(2)) - func(inPoint2(1), inPoint2(2)) < ...
            - a * b^mk * s * (gammaArmijo2* ( double(inv( h(inPoint2(1), inPoint2(2))) ) * transpose(gradfValue2)))
        mk = mk + 1;
        if (mk>1000)
            break 
        end
    end
    gammaArmijo2 = s * b^mk;  % new gamma
    Points2Armijo(end + 1, :) = inPoint2;
    gradfValue2 = transpose(double(gradientF(inPoint2(1), inPoint2(2))));
    k2 = k2 + 1;

    if (k2 == 151 || f(Points2Armijo(end,1),Points2Armijo(end,2)) >= f(Points2Armijo(end-1,1),Points2Armijo(end-1,2)))  % newton cannot be terminated , this is to be terminated
                break
     end
end


%% Initial point (1, 1)
initialPoint3 = [1 1];
inPoint3 = [1 1];
Points3Armijo = zeros(1,2);
Points3Armijo(1, :) =inPoint3;
k3 = 1;

gradfValue3 = transpose(double(gradientF(inPoint3(1), inPoint3(2))));
% Armijo Rule 
while norm(gradfValue3) >= epsilon  % Algorithm cannot be terminated --- Hessian matrix not positively definite or wrong results computed
    inPoint3Old = inPoint3 ;
    mk = 0;
    gammaArmijo3 = s*b^mk ; 
    inPoint3 = inPoint3 - gammaArmijo3 * transpose(( double(inv( h(inPoint3(1), inPoint3(2))) ) * transpose(gradfValue3) ));
  
    while f(inPoint3Old(1), inPoint3Old(2)) - f(inPoint3(1), inPoint3(2)) < ...
            - a * b^mk * s * (transpose(( double(inv( h(inPoint3(1), inPoint3(2))) ) * transpose(gradfValue3))))
        mk = mk + 1;
    end
    gammaArmijo3 = s * b^mk;  % new gamma
    Points3Armijo(end + 1, :) = inPoint3;
    gradfValue3 = transpose(double(gradientF(inPoint3(1), inPoint3(2))));
    k3 = k3 + 1;

    if (k3 == 151 || f(Points3Armijo(end,1),Points3Armijo(end,2)) >= f(Points3Armijo(end-1,1),Points3Armijo(end-1,2)))   % newton cannot be terminated , this is to be terminated
                break
    end
end

%% Visualise results----Plots
%%  Gamma (step) reduced by Armijo rule


%% Starting Point (0,0)
figure('Name', ['Newton Method with gamma (Armijo Rule) = ' num2str(gammaArmijo1) '. Starting point =(' num2str(initialPoint1(1)) ',' num2str(initialPoint1(2)) ')']) 
fsurf(f) 
hold on
plot3(Points1Armijo(:, 1), Points1Armijo(:, 2), f(Points1Armijo(:, 1), Points1Armijo(:, 2)), "r*")
hold on 
plot3(Points1Armijo(end,1),Points1Armijo(end, 2),f(Points1Armijo(end, 1), Points1Armijo(end, 2)),'g+','LineWidth',2,'MarkerSize', 10)
legend('f','steps','final solution')
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
zlabel('f(x, y)','FontWeight','bold')
title('Newton Method for gamma reduced by Armijo rule' , 'Starting Point (0,0)')



figure('Name', ['Steepest Descent Method with gamma (Armijo Rule) = ' num2str(gammaArmijo1) '. Starting point =(' num2str(initialPoint1(1)) ',' num2str(initialPoint1(2)) ')'])
fcontour(f)
hold on
scatter(Points1Armijo(:, 1), Points1Armijo(:, 2),'+','r')
hold on 
scatter(Points1Armijo(end,1),Points1Armijo(end, 2),100,'filled','p','k','LineWidth',2)
legend("z","steps","final solution")
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
title('Newton Method for gamma reduced by Armijo rule' , 'Starting Point (0,0)')



% Plot of the convergence of the objective function as to the number of repetitions
figure('Name', ['f Values for each iteration. Newton Method with gamma (Armijo Rule) = ' num2str(gammaArmijo1) '. Starting point =(' num2str(initialPoint1(1)) ',' num2str(initialPoint1(2)) ')'])
plot(1:size(Points1Armijo), f(Points1Armijo(:, 1), Points1Armijo(:, 2)))
xlabel('Iterations')
ylabel('f(xk,yk)')
title('Newton Method for gamma reduced by Armijo rule' , 'Starting Point (0,0)')




%% Starting Point (-1,-1)
figure('Name', ['Newton Method with gamma reduced by Armijo Rule = ' num2str(gammaArmijo2) '. Starting point =(' num2str(initialPoint2(1)) ',' num2str(initialPoint2(2)) ')']) 
fsurf(f) 
hold on
plot3(Points2Armijo(:, 1), Points2Armijo(:, 2), f(Points2Armijo(:, 1),Points2Armijo(:, 2)), "r*")
hold on 
plot3(Points2Armijo(end,1),Points2Armijo(end, 2),f(Points2Armijo(end, 1), Points2Armijo(end, 2)),'g+','LineWidth',2,'MarkerSize', 10)
legend('f','steps','final solution')
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
zlabel('f(x, y)','FontWeight','bold')
title('Newton for gamma reduced by Armijo Rule', 'Starting Point (-1,-1)')



figure('Name', ['Newton Method with gamma reduced by Armijo Rule = ' num2str(gammaArmijo2) '. Starting point =(' num2str(initialPoint2(1)) ',' num2str(initialPoint2(2)) ')'])
fcontour(f)
hold on
scatter(Points2Armijo(:, 1), Points2Armijo(:, 2),'+','r')
hold on 
scatter(Points2Armijo(end,1),Points2Armijo(end, 2),100,'filled','p','k','LineWidth',2)
legend("z","steps","final solution")
xlabel("x")
ylabel("y")
title("Newton method for gamma reduced by Armijo Rule" ,"Starting Point: (" + initialPoint2(1) +","+ initialPoint2(2) + ")")



% Plot of the convergence of the objective function as to the number of repetitions
figure('Name', ['f Values for each iteration. Newton Method with gamma (Armijo Rule) = ' num2str(gammaArmijo2) '. Starting point =(' num2str(initialPoint2(1)) ',' num2str(initialPoint2(2)) ')'])
plot(1:size(Points2Armijo), f(Points2Armijo(:, 1), Points2Armijo(:, 2)))
xlabel('Iterations')
ylabel('f(xk,yk)')
title("Newton Method for gamma reduced by Armijo Rule" ,"Starting Point: (" + initialPoint2(1) +","+ initialPoint2(2) + ")")



%% Starting Point (1,1)
figure('Name', ['Newton Method with gamma reduced by Armijo Rule = ' num2str(gammaArmijo3) '. Starting point =(' num2str(initialPoint3(1)) ',' num2str(initialPoint3(2)) ')']) 
fsurf(f) 
hold on
plot3(Points3Armijo(:, 1), Points3Armijo(:, 2), f(Points3Armijo(:, 1),Points3Armijo(:, 2)), "r*")
hold on 
plot3(Points3Armijo(end,1),Points3Armijo(end, 2),f(Points3Armijo(end, 1), Points3Armijo(end, 2)),'g+','LineWidth',2,'MarkerSize', 10)
legend('f','steps','final solution')
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
zlabel('f(x, y)','FontWeight','bold')
title('Newton Method for gamma reduced by Armijo rule' , 'Starting Point (1,1)')



figure('Name', ['Steepest Descent Method with gamma (Armijo Rule) = ' num2str(gammaArmijo3) '. Starting point =(' num2str(initialPoint3(1)) ',' num2str(initialPoint3(2)) ')'])
fcontour(f)
hold on
scatter(Points3Armijo(:, 1), Points3Armijo(:, 2),'+','r')
hold on 
scatter(Points3Armijo(end,1),Points3Armijo(end, 2),100,'filled','p','k','LineWidth',2)
legend("z","steps","final solution")
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
title('Newton Method for gamma reduced by Armijo rule' , 'Starting Point (1,1)')


% Plot of the convergence of the objective function as to the number of repetitions
figure('Name', ['f Values for each iteration. Steepest Descent Method with gamma (Armijo Rule) = ' num2str(gammaArmijo3) '. Starting point =(' num2str(initialPoint3(1)) ',' num2str(initialPoint3(2)) ')'])
plot(1:size(Points3Armijo), f(Points3Armijo(:, 1), Points3Armijo(:, 2)))
xlabel('Iterations','FontWeight','bold')
ylabel('f(xk,yk)','FontWeight','bold')
title("Newton Method for gamma reduced by Armijo Rule." ,"Starting Point: (" + initialPoint3(1) +","+ initialPoint3(2) + ")")

%%
IterationsPoint1Task3ArmijoGamma = size(Points1Armijo,1) ;
IterationsPoint2Task3ArmijoGamma = size(Points2Armijo,1) ;
IterationsPoint3Task3ArmijoGamma = size(Points3Armijo,1) ;

close all ; 

