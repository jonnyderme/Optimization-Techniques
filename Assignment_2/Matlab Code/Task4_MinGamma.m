%% Task 4 -- Levenberg-Marquardt minimization method -- Minimization of f(xk + gkdk)

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

%% Initial point (0, 0)
initialPoint1 = [0 0];
inPoint1 = [0 0];
Points1Min = zeros(1,2);
Points1Min(1, :) =inPoint1;
k1 = 1;

gradfValue1 = transpose(double(gradientF(inPoint1(1), inPoint1(2))));
[gammaMin1 , ~] = derivativeMethodGamma(inPoint1,gradfValue1) ;


while norm(gradfValue1) >= epsilon  % apply the Levenberg Marquardt algorithm
    mk1 = 0;
    while min( double(eig(h(inPoint1(1), inPoint1(2)) + mk1 * eye(2,2))) > 0 ) == 0
        mk1 = mk1 + 1;
    end

    dk1 = double(inv( h(inPoint1(1), inPoint1(2)) + mk1 * eye(2) )) ;
    inPoint1 = inPoint1 -  gammaMin1* transpose(( dk1 * transpose(gradfValue1)));   
    Points1Min(end + 1, :) = inPoint1;
    gradfValue1 = transpose(double(gradientF(inPoint1(1), inPoint1(2))));
    [gammaMin1,~] = derivativeMethodGamma(inPoint1,gradfValue1) ;
    k1 = k1 + 1;

end


%% Initial point (-1,-1)
initialPoint2 = [-1 -1] ;
inPoint2 = [-1 -1];
Points2Min = zeros(1,2);
Points2Min(1, :) =inPoint2;
k2 = 1;

gradfValue2 = transpose(double(gradientF(inPoint2(1), inPoint2(2))));
[gammaMin2 , ~] = derivativeMethodGamma(inPoint2,gradfValue2) ;


while norm(gradfValue2) >= epsilon   % apply the Levenberg Marquardt algorithm
    mk2 = 0;
    
    while min( double(eig(h(inPoint2(1), inPoint2(2)) + mk2 * eye(2,2))) > 0 ) == 0
        mk2 = mk2 + 1;
    end

    dk2 = double(inv( h(inPoint2(1), inPoint2(2)) + mk2 * eye(2) )) ;
    inPoint2 = inPoint2 -  gammaMin2* transpose(( dk2 * transpose(gradfValue2)));      
    Points2Min(end + 1, :) = inPoint2;
    gradfValue2 = transpose(double(gradientF(inPoint2(1), inPoint2(2))));
    [gammaMin2 , ~] = derivativeMethodGamma(inPoint2,gradfValue2) ;
    k2 = k2 + 1;
end



%% Initial point (1,1)
initialPoint3 = [1 1] ;
inPoint3 = [1 1];
Points3Min = zeros(1,2);
Points3Min(1, :) =inPoint3;
k3 = 1;

gradfValue3 = transpose(double(gradientF(inPoint3(1), inPoint3(2))));
[gammaMin3 , ~] = derivativeMethodGamma(inPoint3,gradfValue3) ;


while norm(gradfValue3) >= epsilon   % apply the Levenberg Marquardt algorithm
    mk3 = 0;
    
    while min( double(eig(h(inPoint3(1), inPoint3(2)) + mk3 * eye(2,2))) > 0 ) == 0  
        mk3 = mk3 + 1;
    end

    dk3 = double(inv( h(inPoint3(1), inPoint3(2)) + mk3 * eye(2) )) ;
    inPoint3 = inPoint3 -  gammaMin3* transpose(( dk3 * transpose(gradfValue3)));  
    Points3Min(end + 1, :) = inPoint3;
    gradfValue3 = transpose(double(gradientF(inPoint3(1), inPoint3(2))));
    [gammaMin3 , ~] = derivativeMethodGamma(inPoint3,gradfValue3) ;
    k3 = k3 + 1;
end


%% Visualise results----Plots
%%  Gamma (step) that minimizes f(xk+gammak*dk)


%% Starting Point (0,0)
figure('Name', ['Levenberg-Marquardt Method with gamma that minimizes f(xk+gammak*dk) = ' num2str(gammaMin1) '. Starting point =(' num2str(inPoint1(1)) ',' num2str(inPoint1(2)) ')']) 
fsurf(f) 
hold on
plot3(Points1Min(:, 1), Points1Min(:, 2), f(Points1Min(:, 1), Points1Min(:, 2)), "r*")
hold on 
plot3(Points1Min(end,1),Points1Min(end, 2),f(Points1Min(end, 1) , Points1Min(end, 2)),'g+','LineWidth',2,'MarkerSize', 10)
legend('f','steps','final solution')
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
zlabel('f(x, y)','FontWeight','bold')
title('Levenberg-Marquardt Method for gamma that minimizes f(xk+gammak*dk)', ['Starting Point (' num2str(initialPoint1(1)) ',' num2str(initialPoint1(2)) ')'])


figure('Name', ['Levenberg-Marquardt Method with gamma that minimizes f(xk+gammak*dk)= ' num2str(gammaMin1) '. Starting point =(' num2str(initialPoint1(1)) ',' num2str(initialPoint1(2)) ')'])
fcontour(f)
hold on
scatter(Points1Min(:, 1), Points1Min(:, 2),'+','r')
hold on 
scatter(Points1Min(end,1),Points1Min(end, 2),100,'filled','p','k','LineWidth',2)
legend("z","steps","final solution")
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
title('Levenberg-Marquardt Method for gamma that minimizes f(xk+gammak*dk)', ['Starting Point (' num2str(initialPoint1(1)) ',' num2str(initialPoint1(2)) ')'])


% Plot of the convergence of the objective function as to the number of repetitions
figure('Name', ['f Values for each iteration. Levenberg-Marquardt Method with gamma that minimizes f(xk+gammak*dk)= ' num2str(gammaMin1) '. Starting point =(' num2str(initialPoint1(1)) ',' num2str(initialPoint1(2)) ')'])
plot(1:size(Points1Min), f(Points1Min(:, 1), Points1Min(:, 2)))
xlabel('Iterations','FontWeight','bold')
ylabel('f(xk,yk)','FontWeight','bold')
title('Levenberg-Marquardt Method for gamma that minimizes f(xk+gammak*dk)', ['Starting Point (' num2str(initialPoint1(1)) ',' num2str(initialPoint1(2)) ')'])



%% Starting Point (-1,-1)
figure('Name', ['Levenberg-Marquardt Method with gamma that minimizes f(xk+gammak*dk)= ' num2str(gammaMin2) '. Starting point =(' num2str(initialPoint2(1)) ',' num2str(initialPoint2(2)) ')']) 
fsurf(f) 
hold on
plot3(Points2Min(:, 1), Points2Min(:, 2), f(Points2Min(:, 1),Points2Min(:, 2)), "r*")
hold on 
plot3(Points2Min(end,1),Points2Min(end, 2),f(Points2Min(end, 1), Points2Min(end, 2)),'g+','LineWidth',2,'MarkerSize', 10)
legend('f','steps','final solution')
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
zlabel('f(x, y)','FontWeight','bold')
title('Levenberg-Marquardt Method for gamma that minimizes f(xk+gammak*dk)', ['Starting Point (' num2str(initialPoint2(1)) ',' num2str(initialPoint2(2)) ')'])



figure('Name', ['Levenberg-Marquardt Method with gamma that minimizes f(xk+gammak*dk)= ' num2str(gammaMin2) '. Starting point =(' num2str(initialPoint2(1)) ',' num2str(initialPoint2(2)) ')'])
fcontour(f)
hold on
scatter(Points2Min(:, 1), Points2Min(:, 2),'+','r')
hold on 
scatter(Points2Min(end,1),Points2Min(end, 2),100,'filled','p','k','LineWidth',2)
legend("z","steps","final solution")
xlabel("x",'FontWeight','bold')
ylabel("y",'FontWeight','bold')
title('Levenberg-Marquardt Method for gamma that minimizes f(xk+gammak*dk)', ['Starting Point (' num2str(initialPoint2(1)) ',' num2str(initialPoint2(2)) ')'])



% Plot of the convergence of the objective function as to the number of repetitions
figure('Name', ['f Values for each iteration. Levenberg-Marquardt Method with constant gamma = ' num2str(gammaMin2) '. Starting point =(' num2str(initialPoint2(1)) ',' num2str(initialPoint2(2)) ')'])
plot(1:size(Points2Min), f(Points2Min(:, 1), Points2Min(:, 2)))
xlabel('Iterations','FontWeight','bold')
ylabel('f(xk,yk)','FontWeight','bold')
title('Levenberg-Marquardt Method for gamma that minimizes f(xk+gammak*dk)', ['Starting Point (' num2str(initialPoint2(1)) ',' num2str(initialPoint2(2)) ')'])




%% Starting Point (1,1)
figure('Name', ['Levenberg-Marquardt Method with gamma that minimizes f(xk+gammak*dk)= ' num2str(gammaMin3) '. Starting point =(' num2str(initialPoint3(1)) ',' num2str(initialPoint3(2)) ')']) 
fsurf(f) 
hold on
plot3(Points3Min(:, 1), Points3Min(:, 2), f(Points3Min(:, 1),Points3Min(:, 2)), "r*")
hold on 
plot3(Points3Min(end,1),Points3Min(end, 2),f(Points3Min(end, 1), Points3Min(end, 2)),'g+','LineWidth',2,'MarkerSize', 10)
legend('f','steps','final solution')
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
zlabel('f(x, y)','FontWeight','bold')
title('Levenberg-Marquardt Method for gamma that minimizes f(xk+gammak*dk)', ['Starting Point (' num2str(initialPoint3(1)) ',' num2str(initialPoint3(2)) ')'])



figure('Name', ['Levenberg-Marquardt Method with gamma that minimizes f(xk+gammak*dk)= ' num2str(gammaMin3) '. Starting point =(' num2str(inPoint3(1)) ',' num2str(initialPoint3(2)) ')'])
fcontour(f)
hold on
scatter(Points3Min(:, 1), Points3Min(:, 2),'+','r')
hold on 
scatter(Points3Min(end,1),Points3Min(end, 2),100,'filled','p','k','LineWidth',2)
legend("z","steps","final solution")
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
title('Levenberg-Marquardt Method for gamma that minimizes f(xk+gammak*dk)', ['Starting Point (' num2str(initialPoint3(1)) ',' num2str(initialPoint3(2)) ')'])


% Plot of the convergence of the objective function as to the number of repetitions
figure('Name', ['f Values for each iteration. Levenberg-Marquardt Method with gamma that minimizes f(xk+gammak*dk)= ' num2str(gammaMin3) '. Starting point =(' num2str(initialPoint3(1)) ',' num2str(initialPoint3(2)) ')'])
plot(1:size(Points3Min), f(Points3Min(:, 1), Points3Min(:, 2)))
xlabel('Iterations','FontWeight','bold')
ylabel('f(xk,yk)','FontWeight','bold')
title('Levenberg-Marquardt Method for gamma that minimizes f(xk+gammak*dk)', ['Starting Point (' num2str(initialPoint3(1)) ',' num2str(initialPoint3(2)) ')'])

%%
IterationsPoint1Task3MinGamma = size(Points1Min,1) ;
IterationsPoint2Task3MinGamma = size(Points2Min,1) ;
IterationsPoint3Task3MinGamma = size(Points3Min,1) ;

%close all 
