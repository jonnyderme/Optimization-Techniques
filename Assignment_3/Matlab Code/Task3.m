%% Task 3

% Define the function
syms f(x, y);
f(x, y) = (1/3) * x^2 + 3 * y^2;
gradientF = gradient(f) ;


% epsilon termination constant
epsilon = 0.01;

%Constraints
x1Limits = [-10 5];
x2Limits = [-8 12];

sk = 15 ; 
gammak = 0.1 ;
maxIterations = 200 ; 

% Initial point (-5 , 10)
initialPoint = [-5 10];

inPoint = initialPoint;
PointsSDProj = zeros(1,2);
PointsSDProj(1, :) =inPoint;
k = 1;

gradfValue = transpose(double(gradientF(inPoint(1), inPoint(2))));

while (norm(gradfValue) >= epsilon)  %&& (k<=maxIterations)     % apply Steepest Descent algorithm 
    xkBar = inPoint - sk * gradfValue;
    [x1kbar , x2kbar] = SteepestDescentProjection(xkBar , x1Limits, x2Limits) ;
    inPoint = inPoint + gammak * ([x1kbar , x2kbar] - inPoint) ;
    PointsSDProj(end + 1, :) = inPoint;
    gradfValue = double(gradientF(inPoint(1), inPoint(2)))';
    k = k + 1;
end
iterations = k ;


%visualize the results
figure('Name', ['Steepest Descent Method with with projection. Starting point =(' num2str(initialPoint(1)) ',' num2str(initialPoint(2)) ')'])
fsurf(f) 
hold on
plot3(PointsSDProj(:, 1), PointsSDProj(:, 2), f(PointsSDProj(:, 1), PointsSDProj(:, 2)), "r*")
hold on 
plot3(PointsSDProj(end,1),PointsSDProj(end, 2),f(PointsSDProj(end, 1), PointsSDProj(end, 2)),'g+','LineWidth',2,'MarkerSize', 20)
legend('f','steps','final solution')
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
zlabel('f(x, y)','FontWeight','bold')
title("Steepest Descent with projection , gammak= " + gammak + " and sk = "+ sk +"." ,"Starting Point: (" + initialPoint(1) +","+ initialPoint(2) + ")")


figure('Name', ['Steepest Descent Method with projection. Starting point =(' num2str(initialPoint(1)) ',' num2str(initialPoint(2)) ')'])
fcontour(f)
hold on
scatter(PointsSDProj(:, 1), PointsSDProj(:, 2),'+','r')
hold on 
scatter(PointsSDProj(end,1),PointsSDProj(end, 2),100,'filled','p','k','LineWidth',2)
legend("z","steps","final solution")
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
title("Steepest Descent with projection , gammak= " + gammak + " and sk = "+ sk +"." ,"Starting Point: (" + initialPoint(1) +","+ initialPoint(2) + ")")


% Plot of the convergence of the objective function as to the number of repetitions
figure('Name', ['f Values for each iteration. Steepest Descent Method with with projection. Starting point =(' num2str(initialPoint(1)) ',' num2str(initialPoint(2)) ')'])
plot(1:size(PointsSDProj), f(PointsSDProj(:, 1), PointsSDProj(:, 2)))
xlabel('Iterations','FontWeight','bold')
ylabel('f(xk,yk)','FontWeight','bold')
title("Steepest Descent with projection , gammak= " + gammak + " and sk = "+ sk +"." ,"Starting Point: (" + initialPoint(1) +","+ initialPoint(2) + ")")


