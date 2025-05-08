%% Task 2 Steepest Descent Method with gamma selected based on Armijo's rule

% Define function using symbolic toolbox
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


% epsilon termination constant
epsilon = 0.01;
 
s=1;    %initial step
a=0.001; % alpha usually at [10^-5,0.1]
b=0.2;  %  beta usually at [0.1,0.5]


%% Initial point (0, 0)
initialPoint1 = [0 0];
inPoint1 = [0 0];
Points1Armijo = zeros(1,2);
Points1Armijo(1, :) =inPoint1;
k1 = 1;
gammaArmijo1 = s*b^1 ;

gradfValue1 = transpose(double(gradientF(inPoint1(1), inPoint1(2))));
% Armijo Rule 
while norm(gradfValue1) >= epsilon
    inPoint1Old = inPoint1 ;
    mk = 1;
    gammaArmijo1 = s*b^mk ; 
    inPoint1 = inPoint1 - gammaArmijo1 * gradfValue1;

    while f(inPoint1Old(1), inPoint1Old(2)) - f(inPoint1(1), inPoint1(2)) < ...
            - a * b^mk * s * ( gradfValue1 * transpose(gradfValue1))
        mk = mk + 1;
    end
    gammaArmijo1 = s * b^mk;  % new gamma
    Points1Armijo(end + 1, :) = inPoint1;
    gradfValue1 = transpose(double(gradientF(inPoint1(1), inPoint1(2))));
    k1 = k1 + 1;
end

%% Initial point (-1, -1)
initialPoint2 = [-1 -1];
inPoint2 = [-1 -1];
Points2Armijo = zeros(1,2);
Points2Armijo(1, :) =inPoint2;
k2 = 1;

gradfValue2 = transpose(double(gradientF(inPoint2(1), inPoint2(2))));
% Armijo Rule 
while norm(gradfValue2) >= epsilon
    inPoint2Old = inPoint2 ;
    mk = 1;
    gammaArmijo2 = s*b^mk ; 
    inPoint2 = inPoint2 - gammaArmijo2 * gradfValue2;

    while f(inPoint2Old(1), inPoint2Old(2)) - f(inPoint2(1), inPoint2(2)) < ...
            - a * b^mk * s * ( gradfValue2 * transpose(gradfValue2))
        mk = mk + 1;
    end
    gammaArmijo2 = s * b^mk;  % new gamma
    Points2Armijo(end + 1, :) = inPoint2;
    gradfValue2 = transpose(double(gradientF(inPoint2(1), inPoint2(2))));
    k2 = k2 + 1;
end

%% Initial point (1, 1)
initialPoint3 = [1 1];
inPoint3 = [1 1];
Points3Armijo = zeros(1,2);
Points3Armijo(1, :) =inPoint3;
k3 = 1;

gradfValue3 = transpose(double(gradientF(inPoint3(1), inPoint3(2))));
% Armijo Rule 
while norm(gradfValue3) >= epsilon
    inPoint3Old = inPoint3 ;
    mk = 1;
    gammaArmijo3 = s*b^mk ; 
    inPoint3 = inPoint3 - gammaArmijo3 * gradfValue3;
  
    while f(inPoint3Old(1), inPoint3Old(2)) - f(inPoint3(1), inPoint3(2)) < ...
            - a * b^mk * s * ( gradfValue3 * transpose(gradfValue3))
        mk = mk + 1;
    end
    gammaArmijo3 = s * b^mk;  % new gamma
    Points3Armijo(end + 1, :) = inPoint3;
    gradfValue3 = transpose(double(gradientF(inPoint3(1), inPoint3(2))));
    k3 = k3 + 1;
end



%% Visualise results----Plots
%% Constant step Gamma


%% Starting Point (0,0)
figure('Name', ['Steepest Descent Method with gamma (Armijo Rule) = ' num2str(gammaArmijo1) '. Starting point =(' num2str(initialPoint1(1)) ',' num2str(initialPoint1(2)) ')']) 
fsurf(f) 
hold on
plot3(Points1Armijo(:, 1), Points1Armijo(:, 2), f(Points1Armijo(:, 1), Points1Armijo(:, 2)), "r*")
hold on 
plot3(Points1Armijo(end,1),Points1Armijo(end, 2),f(Points1Armijo(end, 1), Points1Armijo(end, 2)),'g+','LineWidth',2,'MarkerSize', 10)
legend('f','steps','final solution')
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
zlabel('f(x, y)','FontWeight','bold')
title('Steepest Descent for gamma (Armijo Rule). Starting Point (0,0)')



figure('Name', ['Steepest Descent Method with gamma (Armijo Rule) = ' num2str(gammaArmijo1) '. Starting point =(' num2str(initialPoint1(1)) ',' num2str(initialPoint1(2)) ')'])
fcontour(f)
hold on
scatter(Points1Armijo(:, 1), Points1Armijo(:, 2),'+','r')
hold on 
scatter(Points1Armijo(end,1),Points1Armijo(end, 2),100,'filled','p','k','LineWidth',2)
legend("z","steps","final solution")
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
title("Steepest Descent for gamma (Armijo Rule): " + gammaArmijo1 + "." ,"Starting Point: (" + initialPoint1(1) +","+ initialPoint1(2) + ")")



% Plot of the convergence of the objective function as to the number of repetitions
figure('Name', ['f Values for each iteration. Steepest Descent Method with gamma (Armijo Rule) = ' num2str(gammaArmijo1) '. Starting point =(' num2str(initialPoint1(1)) ',' num2str(initialPoint1(2)) ')'])
plot(1:size(Points1Armijo), f(Points1Armijo(:, 1), Points1Armijo(:, 2)))
xlabel('Iterations')
ylabel('f(xk,yk)')
title("Steepest Descent for gamma (Armijo Rule)" ,"Starting Point: (" + initialPoint1(1) +","+ initialPoint1(2) + ")")




%% Starting Point (-1,-1)
figure('Name', ['Steepest Descent Method with gamma reduced by Armijo Rule = ' num2str(gammaArmijo2) '. Starting point =(' num2str(initialPoint2(1)) ',' num2str(initialPoint2(2)) ')']) 
fsurf(f) 
hold on
plot3(Points2Armijo(:, 1), Points2Armijo(:, 2), f(Points2Armijo(:, 1),Points2Armijo(:, 2)), "r*")
hold on 
plot3(Points2Armijo(end,1),Points2Armijo(end, 2),f(Points2Armijo(end, 1), Points2Armijo(end, 2)),'g+','LineWidth',2,'MarkerSize', 10)
legend('f','steps','final solution')
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
zlabel('f(x, y)','FontWeight','bold')
title('Steepest Descent for gamma reduced by Armijo Rule', 'Starting Point (-1,-1)')



figure('Name', ['Steepest Descent Method with gamma reduced by Armijo Rule = ' num2str(gammaArmijo2) '. Starting point =(' num2str(initialPoint2(1)) ',' num2str(initialPoint2(2)) ')'])
fcontour(f)
hold on
scatter(Points2Armijo(:, 1), Points2Armijo(:, 2),'+','r')
hold on 
scatter(Points2Armijo(end,1),Points2Armijo(end, 2),100,'filled','p','k','LineWidth',2)
legend("z","steps","final solution")
xlabel("x")
ylabel("y")
title("Steepest Descent for gamma reduced by Armijo Rule" ,"Starting Point: (" + initialPoint2(1) +","+ initialPoint2(2) + ")")



% Plot of the convergence of the objective function as to the number of repetitions
figure('Name', ['f Values for each iteration. Steepest Descent Method with gamma (Armijo Rule) = ' num2str(gammaArmijo2) '. Starting point =(' num2str(initialPoint2(1)) ',' num2str(initialPoint2(2)) ')'])
plot(1:size(Points2Armijo), f(Points2Armijo(:, 1), Points2Armijo(:, 2)))
xlabel('Iterations')
ylabel('f(xk,yk)')
title("Steepest Descent for gamma reduced by Armijo Rule" ,"Starting Point: (" + initialPoint2(1) +","+ initialPoint2(2) + ")")


%% Starting Point (1,1)
figure('Name', ['Steepest Descent Method with gamma reduced by Armijo Rule = ' num2str(gammaArmijo3) '. Starting point =(' num2str(initialPoint3(1)) ',' num2str(initialPoint3(2)) ')']) 
fsurf(f) 
hold on
plot3(Points3Armijo(:, 1), Points3Armijo(:, 2), f(Points3Armijo(:, 1),Points3Armijo(:, 2)), "r*")
hold on 
plot3(Points3Armijo(end,1),Points3Armijo(end, 2),f(Points3Armijo(end, 1), Points3Armijo(end, 2)),'g+','LineWidth',2,'MarkerSize', 10)
legend('f','steps','final solution')
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
zlabel('f(x, y)','FontWeight','bold')
title('Steepest Descent for gamma reduced by Armijo Rule.', 'Starting Point (1,1)')



figure('Name', ['Steepest Descent Method with gamma (Armijo Rule) = ' num2str(gammaArmijo3) '. Starting point =(' num2str(initialPoint3(1)) ',' num2str(initialPoint3(2)) ')'])
fcontour(f)
hold on
scatter(Points3Armijo(:, 1), Points3Armijo(:, 2),'+','r')
hold on 
scatter(Points3Armijo(end,1),Points3Armijo(end, 2),100,'filled','p','k','LineWidth',2)
legend("z","steps","final solution")
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
title("Steepest Descent for gamma reduced by Armijo Rule." ,"Starting Point: (" + initialPoint3(1) +","+ initialPoint3(2) + ")")


% Plot of the convergence of the objective function as to the number of repetitions
figure('Name', ['f Values for each iteration. Steepest Descent Method with gamma (Armijo Rule) = ' num2str(gammaArmijo3) '. Starting point =(' num2str(initialPoint3(1)) ',' num2str(initialPoint3(2)) ')'])
plot(1:size(Points3Armijo), f(Points3Armijo(:, 1), Points3Armijo(:, 2)))
xlabel('Iterations','FontWeight','bold')
ylabel('f(xk,yk)','FontWeight','bold')
title("Steepest Descent for gamma reduced by Armijo Rule." ,"Starting Point: (" + initialPoint3(1) +","+ initialPoint3(2) + ")")


%%
IterationsPoint1Task2ArmijoGamma = size(Points1Armijo,1) ;
IterationsPoint2Task2ArmijoGamma = size(Points2Armijo,1) ;
IterationsPoint3Task2ArmijoGamma = size(Points3Armijo,1) ;

close all ; 


