%% Task 2-- Steepest Descent Method constant step gamma 

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


% epsilon termination constant
epsilon = 0.01;

%% Constant Step Gamma
gammaConst = 0.005;   

%% Initial point (0, 0)
initialPoint1 = [0 0];
inPoint1 = [0 0];
Points1Const = zeros(1,2);
Points1Const(1, :) =inPoint1;
k1 = 1;

gradfValue1 = transpose(double(gradientF(inPoint1(1), inPoint1(2))));

while norm(gradfValue1) >= epsilon       % apply Steepest Descent algorithm 
    inPoint1 = inPoint1 - gammaConst * gradfValue1;
    Points1Const(end + 1, :) = inPoint1;
    gradfValue1 = double(gradientF(inPoint1(1), inPoint1(2)))';
    k1 = k1 + 1;
end

%% Initial point (-1,-1)
initialPoint2 = [-1 -1] ;
inPoint2 = [-1 -1];
Points2Const = zeros(1,2);
Points2Const(1, :) =inPoint2;
k2 = 1;

gradfValue2 = transpose(double(gradientF(inPoint2(1), inPoint2(2))));

while norm(gradfValue2) >= epsilon    % apply Steepest Descent algorithm 
    inPoint2 = inPoint2 - gammaConst * gradfValue2;
    Points2Const(end + 1, :) = inPoint2;
    gradfValue2 = double(gradientF(inPoint2(1), inPoint2(2)))';
    k2 = k2 + 1;
end

%% Initial point (1,1)
initialPoint3 = [1 1] ;
inPoint3 = [1 1];
Points3Const = zeros(1,2);
Points3Const(1, :) =inPoint3;
k3 = 1;

gradfValue3 = transpose(double(gradientF(inPoint3(1), inPoint3(2))));

while norm(gradfValue3) >= epsilon    % apply Steepest Descent algorithm 
    inPoint3 = inPoint3 - gammaConst * gradfValue3;
    Points3Const(end + 1, :) = inPoint3;
    gradfValue3 = double(gradientF(inPoint3(1), inPoint3(2)))';
    k3 = k3 + 1;
end


%% Visualise results----Plots
%% Constant step Gamma


%% Starting Point (0,0)
figure('Name', ['Steepest Descent Method with constant gamma = ' num2str(gammaConst) '. Starting point =(' num2str(inPoint1(1)) ',' num2str(inPoint1(2)) ')']) 
fsurf(f) 
hold on
plot3(Points1Const(:, 1), Points1Const(:, 2), f(Points1Const(:, 1), Points1Const(:, 2)), "r*")
hold on 
plot3(Points1Const(end,1),Points1Const(end, 2),f(Points1Const(:, 1), Points1Const(:, 2)),'k+','LineWidth',2,'MarkerSize', 20)
legend('f','steps','final solution')
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
zlabel('f(x, y)','FontWeight','bold')
title(['Steepest Descent for constant gamma: ' num2str(gammaConst)], 'Starting Point (0,0)')


figure('Name', ['Steepest Descent Method with constant gamma = ' num2str(gammaConst) '. Starting point =(' num2str(initialPoint1(1)) ',' num2str(initialPoint1(2)) ')'])
fcontour(f)
hold on
scatter(Points1Const(:, 1), Points1Const(:, 2),'+','r')
hold on 
scatter(Points1Const(end,1),Points1Const(end, 2),100,'filled','p','k','LineWidth',2)
legend("z","steps","final solution")
xlabel("x")
ylabel("y")
title(['Steepest Descent for constant gamma: ' num2str(gammaConst)], 'Starting Point (0,0)')


% Plot of the convergence of the objective function as to the number of repetitions
figure('Name', ['f Values for each iteration. Steepest Descent Method with constant gamma = ' num2str(gammaConst) '. Starting point =(' num2str(inPoint1(1)) ',' num2str(inPoint1(2)) ')'])
plot(1:size(Points1Const), f(Points1Const(:, 1), Points1Const(:, 2)))
xlabel('Iterations')
ylabel('f(xk,yk)')
title("Steepest Descent for constant gamma: " + gammaConst + "." ,"Starting Point: (" + initialPoint1(1) +","+ initialPoint1(2) + ")")




%% Starting Point (-1,-1)
figure('Name', ['Steepest Descent Method with constant gamma = ' num2str(gammaConst) '. Starting point =(' num2str(inPoint2(1)) ',' num2str(inPoint2(2)) ')']) 
fsurf(f) 
hold on
plot3(Points2Const(:, 1), Points2Const(:, 2), f(Points2Const(:, 1),Points2Const(:, 2)), "r*")
hold on 
plot3(Points2Const(end,1),Points2Const(end, 2),f(Points2Const(end, 1), Points2Const(end, 2)),'g+','LineWidth',2,'MarkerSize', 10)
legend('f','steps','final solution')
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
zlabel('f(x, y)','FontWeight','bold')
title(['Steepest Descent for constant gamma: ' num2str(gammaConst)], 'Starting Point (-1,-1)')



figure('Name', ['Steepest Descent Method with constant gamma = ' num2str(gammaConst) '. Starting point =(' num2str(inPoint2(1)) ',' num2str(inPoint2(2)) ')'])
fcontour(f)
hold on
scatter(Points2Const(:, 1), Points2Const(:, 2),'+','r')
hold on 
scatter(Points2Const(end,1),Points2Const(end, 2),100,'filled','p','k','LineWidth',2)
legend("z","steps","final solution")
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
title(['Steepest Descent for constant gamma: ' num2str(gammaConst)], 'Starting Point (-1,-1)')


% Plot of the convergence of the objective function as to the number of repetitions
figure('Name', ['f Values for each iteration. Steepest Descent Method with constant gamma = ' num2str(gammaConst) '. Starting point =(' num2str(inPoint2(1)) ',' num2str(inPoint2(2)) ')'])
plot(1:size(Points2Const), f(Points2Const(:, 1), Points2Const(:, 2)))
xlabel('Iterations')
ylabel('f(xk,yk)')
title("Steepest Descent for constant gamma: " + gammaConst + "." ,"Starting Point: (" + inPoint2(1) +","+ inPoint2(2) + ")")


%% Starting Point (1,1)
figure('Name', ['Steepest Descent Method with constant gamma = ' num2str(gammaConst) '. Starting point =(' num2str(inPoint3(1)) ',' num2str(inPoint3(2)) ')']) 
fsurf(f) 
hold on
plot3(Points3Const(:, 1), Points3Const(:, 2), f(Points3Const(:, 1),Points3Const(:, 2)), "r*")
hold on 
plot3(Points3Const(end,1),Points3Const(end, 2),f(Points3Const(end, 1), Points3Const(end, 2)),'g+','LineWidth',2,'MarkerSize', 10)
legend('f','steps','final solution')
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
zlabel('f(x, y)','FontWeight','bold')
title(['Steepest Descent for constant gamma: ' num2str(gammaConst)], 'Starting Point (1,1)')


figure('Name', ['Steepest Descent Method with constant gamma = ' num2str(gammaConst) '. Starting point =(' num2str(inPoint3(1)) ',' num2str(inPoint3(2)) ')'])
fcontour(f)
hold on
scatter(Points3Const(:, 1), Points3Const(:, 2),'+','r')
hold on 
scatter(Points3Const(end,1),Points3Const(end, 2),100,'filled','p','k','LineWidth',2)
legend("z","steps","final solution")
xlabel("x")
ylabel("y")
title(['Steepest Descent for constant gamma: ' num2str(gammaConst)], 'Starting Point (1,1)')

% Plot of the convergence of the objective function as to the number of repetitions
figure('Name', ['f Values for each iteration. Steepest Descent Method with constant gamma = ' num2str(gammaConst) '. Starting point =(' num2str(inPoint3(1)) ',' num2str(inPoint3(2)) ')'])
plot(1:size(Points3Const), f(Points3Const(:, 1), Points3Const(:, 2)))
xlabel('Iterations')
ylabel('f(xk,yk)')
title("Steepest Descent for constant gamma: " + gammaConst + "." ,"Starting Point: (" + initialPoint3(1) +","+ initialPoint3(2) + ")")

%%
IterationsPoint1Task2ConstGamma = size(Points1Const,1) ;
IterationsPoint2Task2ConstGamma = size(Points2Const,1) ;
IterationsPoint3Task2ConstGamma = size(Points3Const,1) ;

close all ; 


