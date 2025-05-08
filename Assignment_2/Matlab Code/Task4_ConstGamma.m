%% Task 4 -- Levenberg-Marquardt minimization method

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

%% Constant Step Gamma
gammaConst = 0.005;  

%% Initial point (0, 0)
initialPoint1 = [0 0];
inPoint1 = [0 0];
Points1Const = zeros(1,2);
Points1Const(1, :) =inPoint1;
k1 = 1;

gradfValue1 = transpose(double(gradientF(inPoint1(1), inPoint1(2))));

while norm(gradfValue1) >= epsilon  % apply the Levenberg Marquardt algorithm
    mk1 = 0;
    
    while min( double(eig(h(inPoint1(1), inPoint1(2)) + mk1 * eye(2,2))) > 0 ) == 0
        mk1 = mk1 + 1;
    end

    dk1 = double(inv( h(inPoint1(1), inPoint1(2)) + mk1 * eye(2) )) ;
    inPoint1 = inPoint1 -  gammaConst* transpose(( dk1 * transpose(gradfValue1)));   
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

while norm(gradfValue2) >= epsilon   % apply the Levenberg Marquardt algorithm
    mk2 = 0;
    
    while min( double(eig(h(inPoint2(1), inPoint2(2)) + mk2 * eye(2,2))) > 0 ) == 0
        mk2 = mk2 + 1;
    end

    dk2 = double(inv( h(inPoint2(1), inPoint2(2)) + mk2 * eye(2) )) ;
    inPoint2 = inPoint2 -  gammaConst* transpose(( dk2 * transpose(gradfValue2)));      
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

while norm(gradfValue3) >= epsilon   % apply the Levenberg Marquardt algorithm
    mk3 = 0;
    
    while min( double(eig(h(inPoint3(1), inPoint3(2)) + mk3 * eye(2,2))) > 0 ) == 0  
        mk3 = mk3 + 1;
    end

    dk3 = double(inv( h(inPoint3(1), inPoint3(2)) + mk3 * eye(2) )) ;
    inPoint3 = inPoint3 -  gammaConst* transpose(( dk3 * transpose(gradfValue3)));  
    Points3Const(end + 1, :) = inPoint3;
    gradfValue3 = double(gradientF(inPoint3(1), inPoint3(2)))';
    k3 = k3 + 1;
end



%% Visualize the results 
%% Starting Point (0,0)
figure('Name', ['Levenberg Marquardt Method with constant gamma = ' num2str(gammaConst) '. Starting point =(' num2str(inPoint1(1)) ',' num2str(inPoint1(2)) ')']) 
fsurf(f) 
hold on
plot3(Points1Const(:, 1), Points1Const(:, 2), f(Points1Const(:, 1), Points1Const(:, 2)), "r*")
hold on 
plot3(Points1Const(end,1),Points1Const(end, 2),f(Points1Const(:, 1), Points1Const(:, 2)),'g+','LineWidth',2,'MarkerSize', 10)
legend('f','steps','final solution')
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
zlabel('f(x, y)','FontWeight','bold')
title('Levenberg Marquardt Method for constant gamma: 0.005. Starting Point (0,0)')


figure('Name', ['Levenberg Marquardt Method with constant gamma = ' num2str(gammaConst) '. Starting point =(' num2str(initialPoint1(1)) ',' num2str(initialPoint1(2)) ')'])
fcontour(f)
hold on
scatter(Points1Const(:, 1), Points1Const(:, 2),'+','r')
hold on 
scatter(Points1Const(end,1),Points1Const(end, 2),100,'filled','p','k','LineWidth',2)
legend("z","steps","final solution")
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
title("Levenberg Marquardt Method for constant gamma: " + gammaConst + "." ,"Starting Point: (" + initialPoint1(1) +","+ initialPoint1(2) + ")")

% plot of the convergence of the objective function as to the number of repetitions
figure('Name', ['f Values for each iteration. Levenberg Marquardt Method with constant gamma = ' num2str(gammaConst) '. Starting point =(' num2str(inPoint1(1)) ',' num2str(inPoint1(2)) ')'])
plot(1:size(Points1Const), f(Points1Const(:, 1), Points1Const(:, 2)))
xlabel('Iterations','FontWeight','bold')
ylabel('f(xk,yk)','FontWeight','bold')
title("Levenberg Marquardt Method for constant gamma: " + gammaConst + "." ,"Starting Point: (" + initialPoint1(1) +","+ initialPoint1(2) + ")")


%% Starting Point (-1,-1)
figure('Name', ['Levenberg Marquardt Method with constant gamma = ' num2str(gammaConst) '. Starting point =(' num2str(inPoint2(1)) ',' num2str(inPoint2(2)) ')']) 
fsurf(f) 
hold on
plot3(Points2Const(:, 1), Points2Const(:, 2), f(Points2Const(:, 1),Points2Const(:, 2)), "r*")
hold on 
plot3(Points2Const(end,1),Points2Const(end, 2),f(Points2Const(end, 1), Points2Const(end, 2)),'g+','LineWidth',2,'MarkerSize', 10)
legend('f','steps','final solution')
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
zlabel('f(x, y)','FontWeight','bold')
title('Levenberg Marquardt Method for constant gamma: 0.005. Starting Point (-1,-1)')


figure('Name', ['Levenberg Marquardt Method with constant gamma = ' num2str(gammaConst) '. Starting point =(' num2str(inPoint2(1)) ',' num2str(inPoint2(2)) ')'])
fcontour(f)
hold on
scatter(Points2Const(:, 1), Points2Const(:, 2),'+','r')
hold on 
scatter(Points2Const(end,1),Points2Const(end, 2),100,'filled','p','k','LineWidth',2)
legend("z","steps","final solution")
xlabel("x",'FontWeight','bold')
ylabel("y",'FontWeight','bold')
title("Levenberg Marquardt Method for constant gamma: " + gammaConst + "." ,"Starting Point: (" + initialPoint2(1) +","+ initialPoint2(2) + ")")

%plot of the convergence of the objective function as to the number of repetitions
figure('Name', ['f Values for each iteration. Levenberg Marquardt Method with constant gamma = ' num2str(gammaConst) '. Starting point =(' num2str(inPoint2(1)) ',' num2str(inPoint2(2)) ')'])
plot(1:size(Points2Const), f(Points2Const(:, 1), Points2Const(:, 2)))
xlabel('Iterations','FontWeight','bold')
ylabel('f(xk,yk)','FontWeight','bold')
title("Levenberg Marquardt Method for constant gamma: " + gammaConst + "." ,"Starting Point: (" + initialPoint2(1) +","+ initialPoint2(2) + ")")


%% Starting Point (1,1)
figure('Name', ['Levenberg Marquardt Method with constant gamma = ' num2str(gammaConst) '. Starting point =(' num2str(inPoint3(1)) ',' num2str(inPoint3(2)) ')']) 
fsurf(f) 
hold on
plot3(Points3Const(:, 1), Points3Const(:, 2), f(Points3Const(:, 1),Points3Const(:, 2)), "r*")
hold on 
plot3(Points3Const(end,1),Points3Const(end, 2),f(Points3Const(end, 1), Points3Const(end, 2)),'g+','LineWidth',2,'MarkerSize', 10)
legend('f','steps','final solution')
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
zlabel('f(x, y)','FontWeight','bold')
title('Levenberg Marquardt Method for constant gamma: 0.005. Starting Point (1,1)')

figure('Name', ['Levenberg Marquardt Method with constant gamma = ' num2str(gammaConst) '. Starting point =(' num2str(initialPoint3(1)) ',' num2str(initialPoint3(2)) ')'])
fcontour(f)
hold on
scatter(Points3Const(:, 1), Points3Const(:, 2),'+','r')
hold on 
scatter(Points3Const(end,1),Points3Const(end, 2),100,'filled','p','k','LineWidth',2)
legend("z","steps","final solution")
xlabel("x",'FontWeight','bold')
ylabel("y",'FontWeight','bold')
title("Levenberg Marquardt Method for constant gamma: " + gammaConst + "." ,"Starting Point: (" + initialPoint3(1) +","+ initialPoint3(2) + ")")

%plot of the convergence of the objective function as to the number of repetitions
figure('Name', ['f Values for each iteration. Newton Method with constant gamma = ' num2str(gammaConst) '. Starting point =(' num2str(inPoint3(1)) ',' num2str(inPoint3(2)) ')'])
plot(1:size(Points3Const), f(Points3Const(:, 1), Points3Const(:, 2)))
xlabel('Iterations','FontWeight','bold')
ylabel('f(xk,yk)','FontWeight','bold')
title("Levenberg Marquardt Method for constant gamma: " + gammaConst + "." ,"Starting Point: (" + initialPoint3(1) +","+ initialPoint3(2) + ")")

%%
IterationsPoint1Task4ConstGamma = size(Points1Const,1) ;
IterationsPoint2Task4ConstGamma = size(Points2Const,1) ;
IterationsPoint3Task4ConstGamma = size(Points3Const,1) ;

% close all ; 





