
% Define the function
syms f(x, y);
f(x, y) = (1/3) * x^2 + 3 * y^2;
gradf = gradient(f);

% plot function
figure("Name", "Function plot");
fsurf(f);
xlabel("x");
ylabel("y");
zlabel("f(x, y)");
title(['Function Plot :' char(f)])

gradientF = gradient(f) ;


% epsilon termination constant
epsilon = 0.001;

%% Constant Step Gamma 1
gammaConst1 = 0.1;   
% Initial point (10, 10)
initialPoint = [10 10];
inPoint = initialPoint;
Points1Const = zeros(1,2);
Points1Const(1, :) =inPoint;
k = 1;

gradfValue = transpose(double(gradientF(inPoint(1), inPoint(2))));

while norm(gradfValue) >= epsilon       % apply Steepest Descent algorithm 
    inPoint = inPoint - gammaConst1 * gradfValue;
    Points1Const(end + 1, :) = inPoint;
    gradfValue = double(gradientF(inPoint(1), inPoint(2)))';
    k = k + 1;
end
iterations1 = k ;

%visualize the results
figure('Name', ['Steepest Descent Method with constant gamma = ' num2str(gammaConst1) '. Starting point =(' num2str(inPoint(1)) ',' num2str(inPoint(2)) ')']) 
fsurf(f) 
hold on
plot3(Points1Const(:, 1), Points1Const(:, 2), f(Points1Const(:, 1), Points1Const(:, 2)), "r*",'MarkerSize', 8)
hold on 
plot3(Points1Const(end,1),Points1Const(end, 2),f(Points1Const(end, 1), Points1Const(end, 2)),'g+','LineWidth',2,'MarkerSize', 20)
legend('f','steps','final solution')
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
zlabel('f(x, y)','FontWeight','bold')
title("Steepest Descent for constant gamma: " + gammaConst1 + "." ,"Starting Point: (" + initialPoint(1) +","+ initialPoint(2) + ")")


figure('Name', ['Steepest Descent Method with constant gamma = ' num2str(gammaConst1) '. Starting point =(' num2str(initialPoint(1)) ',' num2str(initialPoint(2)) ')'])
fcontour(f)
hold on
scatter(Points1Const(:, 1), Points1Const(:, 2),'+','r')
hold on 
scatter(Points1Const(end,1),Points1Const(end, 2),100,'filled','p','k','LineWidth',2)
legend("z","steps","final solution")
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
title("Steepest Descent for constant gamma: " + gammaConst1 + "." ,"Starting Point: (" + initialPoint(1) +","+ initialPoint(2) + ")")


% Plot of the convergence of the objective function as to the number of repetitions
figure('Name', ['f Values for each iteration. Steepest Descent Method with constant gamma = ' num2str(gammaConst1) '. Starting point =(' num2str(inPoint(1)) ',' num2str(inPoint(2)) ')'])
plot(1:size(Points1Const), f(Points1Const(:, 1), Points1Const(:, 2)))
xlabel('Iterations','FontWeight','bold')
ylabel('f(xk,yk)','FontWeight','bold')
title("Steepest Descent for constant gamma: " + gammaConst1 + "." ,"Starting Point: (" + initialPoint(1) +","+ initialPoint(2) + ")")



%% Constant Step Gamma 2
gammaConst2 = 0.3;   

% Initial point (10, 10)
initialPoint = [10 10];
inPoint = initialPoint;
Points2Const = zeros(1,2);
Points2Const(1, :) =inPoint;
k = 1;

gradfValue = transpose(double(gradientF(inPoint(1), inPoint(2))));

while norm(gradfValue) >= epsilon       % apply Steepest Descent algorithm 
    inPoint = inPoint - gammaConst2 * gradfValue;
    Points2Const(end + 1, :) = inPoint;
    gradfValue = double(gradientF(inPoint(1), inPoint(2)))';
    k = k + 1;
end
iterations2 = k ;


%visualize the results
figure('Name', ['Steepest Descent Method with constant gamma = ' num2str(gammaConst2) '. Starting point =(' num2str(inPoint(1)) ',' num2str(inPoint(2)) ')']) 
fsurf(f) 
hold on
plot3(Points2Const(:, 1), Points2Const(:, 2), f(Points2Const(:, 1), Points2Const(:, 2)), "r*")
hold on 
plot3(Points2Const(end,1),Points2Const(end, 2),f(Points2Const(end, 1), Points2Const(end, 2)),'g+','LineWidth',2,'MarkerSize', 20)
legend('f','steps','final solution')
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
zlabel('f(x, y)','FontWeight','bold')
title("Steepest Descent for constant gamma: " + gammaConst2 + "." ,"Starting Point: (" + initialPoint(1) +","+ initialPoint(2) + ")")


figure('Name', ['Steepest Descent Method with constant gamma = ' num2str(gammaConst2) '. Starting point =(' num2str(initialPoint(1)) ',' num2str(initialPoint(2)) ')'])
fcontour(f)
hold on
scatter(Points2Const(:, 1), Points2Const(:, 2),'+','r')
hold on 
scatter(Points2Const(end,1),Points2Const(end, 2),100,'filled','p','k','LineWidth',2)
legend("z","steps","final solution")
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
title("Steepest Descent for constant gamma: " + gammaConst2 + "." ,"Starting Point: (" + initialPoint(1) +","+ initialPoint(2) + ")")


% Plot of the convergence of the objective function as to the number of repetitions
figure('Name', ['f Values for each iteration. Steepest Descent Method with constant gamma = ' num2str(gammaConst2) '. Starting point =(' num2str(inPoint(1)) ',' num2str(inPoint(2)) ')'])
plot(1:size(Points2Const), f(Points2Const(:, 1), Points2Const(:, 2)))
xlabel('Iterations','FontWeight','bold')
ylabel('f(xk,yk)','FontWeight','bold')
title("Steepest Descent for constant gamma: " + gammaConst2 + "." ,"Starting Point: (" + initialPoint(1) +","+ initialPoint(2) + ")")




%% Constant Step Gamma 3
gammaConst3 = 3;   

% Initial point (10, 10)
initialPoint = [10 10];
inPoint = initialPoint;
Points3Const = zeros(1,2);
Points3Const(1, :) =inPoint;
k = 1;

gradfValue = transpose(double(gradientF(inPoint(1), inPoint(2))));

while (norm(gradfValue) >= epsilon) && (k<=150)     % apply Steepest Descent algorithm 
    inPoint = inPoint - gammaConst3 * gradfValue;
    Points3Const(end + 1, :) = inPoint;
    gradfValue = double(gradientF(inPoint(1), inPoint(2)))';
    k = k + 1;
end
iterations3 = k ;


%visualize the results
figure('Name', ['Steepest Descent Method with constant gamma = ' num2str(gammaConst3) '. Starting point =(' num2str(inPoint(1)) ',' num2str(inPoint(2)) ')']) 
fsurf(f) 
hold on
plot3(Points3Const(:, 1), Points3Const(:, 2), f(Points3Const(:, 1), Points3Const(:, 2)), "r*",'MarkerSize', 8)
hold on 
plot3(Points3Const(end,1),Points3Const(end, 2),f(Points3Const(end, 1), Points3Const(end, 2)),'g+','LineWidth',2,'MarkerSize', 20)
legend('f','steps','final solution')
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
zlabel('f(x, y)','FontWeight','bold')
title("Steepest Descent for constant gamma: " + gammaConst3 + "." ,"Starting Point: (" + initialPoint(1) +","+ initialPoint(2) + ")")


figure('Name', ['Steepest Descent Method with constant gamma = ' num2str(gammaConst3) '. Starting point =(' num2str(initialPoint(1)) ',' num2str(initialPoint(2)) ')'])
fcontour(f)
hold on
scatter(Points3Const(:, 1), Points3Const(:, 2),'+','r')
hold on 
scatter(Points3Const(end,1),Points3Const(end, 2),100,'filled','p','k','LineWidth',2)
legend("z","steps","final solution")
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
title("Steepest Descent for constant gamma: " + gammaConst3 + "." ,"Starting Point: (" + initialPoint(1) +","+ initialPoint(2) + ")")


% Plot of the convergence of the objective function as to the number of repetitions
figure('Name', ['f Values for each iteration. Steepest Descent Method with constant gamma = ' num2str(gammaConst3) '. Starting point =(' num2str(inPoint(1)) ',' num2str(inPoint(2)) ')'])
plot(1:size(Points3Const), f(Points3Const(:, 1), Points3Const(:, 2)))
xlabel('Iterations','FontWeight','bold')
ylabel('f(xk,yk)','FontWeight','bold')
title("Steepest Descent for constant gamma: " + gammaConst3 + "." ,"Starting Point: (" + initialPoint(1) +","+ initialPoint(2) + ")")


%% Constant Step Gamma 4
gammaConst4 = 5;   

% Initial point (10, 10)
initialPoint = [10 10];
inPoint = initialPoint;
Points4Const = zeros(1,2);
Points4Const(1, :) =inPoint;
k = 1;

gradfValue = transpose(double(gradientF(inPoint(1), inPoint(2))));

while norm(gradfValue) >= epsilon       % apply Steepest Descent algorithm 
    inPoint = inPoint - gammaConst4 * gradfValue;
    Points4Const(end + 1, :) = inPoint;
    gradfValue = double(gradientF(inPoint(1), inPoint(2)))';
    k = k + 1;
end
iterations4 = k ; 

%visualize the results
figure('Name', ['Steepest Descent Method with constant gamma = ' num2str(gammaConst4) '. Starting point =(' num2str(inPoint(1)) ',' num2str(inPoint(2)) ')']) 
fsurf(f) 
hold on
plot3(Points4Const(:, 1), Points4Const(:, 2), f(Points4Const(:, 1), Points4Const(:, 2)), "r*")
hold on 
plot3(Points4Const(end,1),Points4Const(end, 2),f(Points4Const(end, 1), Points4Const(end, 2)),'g+','LineWidth',2,'MarkerSize', 20)
legend('f','steps','final solution')
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
zlabel('f(x, y)','FontWeight','bold')
title("Steepest Descent for constant gamma: " + gammaConst4 + "." ,"Starting Point: (" + initialPoint(1) +","+ initialPoint(2) + ")")


figure('Name', ['Steepest Descent Method with constant gamma = ' num2str(gammaConst4) '. Starting point =(' num2str(initialPoint(1)) ',' num2str(initialPoint(2)) ')'])
fcontour(f)
hold on
scatter(Points4Const(:, 1), Points4Const(:, 2),'+','r')
hold on 
scatter(Points4Const(end,1),Points4Const(end, 2),100,'filled','p','k','LineWidth',2)
legend("z","steps","final solution")
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
title("Steepest Descent for constant gamma: " + gammaConst4 + "." ,"Starting Point: (" + initialPoint(1) +","+ initialPoint(2) + ")")


% Plot of the convergence of the objective function as to the number of repetitions
figure('Name', ['f Values for each iteration. Steepest Descent Method with constant gamma = ' num2str(gammaConst4) '. Starting point =(' num2str(inPoint(1)) ',' num2str(inPoint(2)) ')'])
plot(1:size(Points4Const), f(Points4Const(:, 1), Points4Const(:, 2)))
xlabel('Iterations','FontWeight','bold')
ylabel('f(xk,yk)','FontWeight','bold')
title("Steepest Descent for constant gamma: " + gammaConst4 + "." ,"Starting Point: (" + initialPoint(1) +","+ initialPoint(2) + ")")