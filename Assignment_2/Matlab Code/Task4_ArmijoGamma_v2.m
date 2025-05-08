%% Task 4 -- Levenberg-Marquardt minimization method -- Reduced by Armijo Rule

% Define function 
syms x y;
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

% Create a numerical function (double) from the symbolic function
f_d = matlabFunction(f);

gradientF = gradient(f) ;
hessianM = hessian(f,[x,y]) ;   % hessian matrix of f 


% epsilon termination constant
epsilon = 0.001;

s=1;    %initial step
a=0.001; % alpha usually at [10^-5,0.1]
b=0.2;  %  beta usually at [0.1,0.5]


%% Initial point (0, 0)

initialPoint1 = [0 0];
inPoint1 = [0 0];
Points1Armijo = zeros(1,2);
Points1Armijo(1, :) =inPoint1;
k1 = 1;
gammaArmijo1 = 1 ;

h =double( vpa(subs(hessianM,[x,y],[inPoint1(1),inPoint1(2)])));
gradfValue1 = transpose(double(gradientF(inPoint1(1), inPoint1(2))));


while norm(gradfValue1) >= epsilon
    h = double(vpa(subs(hessianM,[x,y],[inPoint1(1),inPoint1(2)])));

    mk1 = 0;
    pM =h + mk1*eye(size(h)); %positive defined Matrix
   
    while  double(pM(1,1))<=0 || double(pM(1,1))*double(pM(2,2))-double(pM(1,2))*double(pM(2,1))<=0
        mk1 = mk1+1;
        pM = h+mk1*eye(size(h));
    end

    dk1 = -gradfValue1/pM;
    [inPoint1(1),inPoint1(2)] = armijo(inPoint1(1),inPoint1(2),dk1);
    Points1Armijo(end + 1, :) = inPoint1;
    gradfValue1 = transpose(double(gradientF(inPoint1(1), inPoint1(2))));
    k1 = k1+1;

end


%% Initial point (-1, -1)

initialPoint2 = [-1 -1];
inPoint2 = [-1 -1];
Points2Armijo = zeros(1,2);
Points2Armijo(1, :) =inPoint2;
k2 = 1;
gammaArmijo2 = 1 ;

h =double( vpa(subs(hessianM,[x,y],[inPoint2(1),inPoint2(2)])));
gradfValue2 = transpose(double(gradientF(inPoint2(1), inPoint2(2))));


while norm(gradfValue2) >= epsilon
    h = double(vpa(subs(hessianM,[x,y],[inPoint2(1),inPoint2(2)])));

    mk2 = 0;
    pM =h + mk2*eye(size(h)); %positive defined Matrix
   
    while  double(pM(1,1))<=0 || double(pM(1,1))*double(pM(2,2))-double(pM(1,2))*double(pM(2,1))<=0
        mk2 = mk2+1;
        pM = h+mk2*eye(size(h));
    end

    dk2 = -gradfValue2/pM;
    [inPoint2(1),inPoint2(2)] = armijo(inPoint2(1),inPoint2(2),dk2);
    Points2Armijo(end + 1, :) = inPoint2;
    gradfValue2 = transpose(double(gradientF(inPoint2(1), inPoint2(2))));
    k2 = k2+1;

end


%% Initial point (1, 1)

initialPoint3 = [1 1];
inPoint3 = [1 1];
Points3Armijo = zeros(1,2);
Points3Armijo(1, :) =inPoint3;
k3 = 1;
gammaArmijo3 = 1 ;

h =double( vpa(subs(hessianM,[x,y],[inPoint3(1),inPoint3(2)])));
gradfValue3 = transpose(double(gradientF(inPoint3(1), inPoint3(2))));


while norm(gradfValue3) >= epsilon
    h = double(vpa(subs(hessianM,[x,y],[inPoint3(1),inPoint3(2)])));

    mk3 = 0;
    pM =h + mk3*eye(size(h)); %positive defined Matrix
   
    while  double(pM(1,1))<=0 || double(pM(1,1))*double(pM(2,2))-double(pM(1,2))*double(pM(2,1))<=0
        mk3 = mk3+1;
        pM = h+mk3*eye(size(h));
    end

    dk3 = -gradfValue3/pM;
    [inPoint3(1),inPoint3(2)] = armijo(inPoint3(1),inPoint3(2),dk3);
    Points3Armijo(end + 1, :) = inPoint3;
    gradfValue3 = transpose(double(gradientF(inPoint3(1), inPoint3(2))));
    k3 = k3+1;

end


%% Visualise results----Plots
%%  Gamma (step) reduced by Armijo rule


%% Starting Point (0,0)
figure('Name', ['Levenberg-Marquardt Method with gamma (Armijo Rule) = ' num2str(gammaArmijo1) '. Starting point =(' num2str(initialPoint1(1)) ',' num2str(initialPoint1(2)) ')']) 
fsurf(f) 
hold on
plot3(Points1Armijo(:, 1), Points1Armijo(:, 2), f(Points1Armijo(:, 1), Points1Armijo(:, 2)), "r*")
hold on 
plot3(Points1Armijo(end,1),Points1Armijo(end, 2),f(Points1Armijo(end, 1), Points1Armijo(end, 2)),'g+','LineWidth',2,'MarkerSize', 10)
legend('f','steps','final solution')
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
zlabel('f(x, y)','FontWeight','bold')
title('Levenberg-Marquardt Method for gamma reduced by Armijo rule' , 'Starting Point (0,0)')



figure('Name', ['Levenberg-Marquardt Method with gamma (Armijo Rule) = ' num2str(gammaArmijo1) '. Starting point =(' num2str(initialPoint1(1)) ',' num2str(initialPoint1(2)) ')'])
fcontour(f)
hold on
scatter(Points1Armijo(:, 1), Points1Armijo(:, 2),'+','r')
hold on 
scatter(Points1Armijo(end,1),Points1Armijo(end, 2),100,'filled','p','k','LineWidth',2)
legend("z","steps","final solution")
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
title('Levenberg-Marquardt Method for gamma reduced by Armijo rule' , 'Starting Point (0,0)')



% Plot of the convergence of the objective function as to the number of repetitions
figure('Name', ['f Values for each iteration. Levenberg-Marquardt Method with gamma (Armijo Rule) = ' num2str(gammaArmijo1) '. Starting point =(' num2str(initialPoint1(1)) ',' num2str(initialPoint1(2)) ')'])
plot(1:size(Points1Armijo), f(Points1Armijo(:, 1), Points1Armijo(:, 2)))
xlabel('Iterations')
ylabel('f(xk,yk)')
title('Levenberg-Marquardt Method for gamma reduced by Armijo rule' , 'Starting Point (0,0)')




%% Starting Point (-1,-1)
figure('Name', ['Levenberg-Marquardt Method with gamma reduced by Armijo Rule = ' num2str(gammaArmijo2) '. Starting point =(' num2str(initialPoint2(1)) ',' num2str(initialPoint2(2)) ')']) 
fsurf(f) 
hold on
plot3(Points2Armijo(:, 1), Points2Armijo(:, 2), f(Points2Armijo(:, 1),Points2Armijo(:, 2)), "r*")
hold on 
plot3(Points2Armijo(end,1),Points2Armijo(end, 2),f(Points2Armijo(end, 1), Points2Armijo(end, 2)),'g+','LineWidth',2,'MarkerSize', 10)
legend('f','steps','final solution')
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
zlabel('f(x, y)','FontWeight','bold')
title('Levenberg-Marquardt for gamma reduced by Armijo Rule', 'Starting Point (-1,-1)')



figure('Name', ['Levenberg-Marquardt Method with gamma reduced by Armijo Rule = ' num2str(gammaArmijo2) '. Starting point =(' num2str(initialPoint2(1)) ',' num2str(initialPoint2(2)) ')'])
fcontour(f)
hold on
scatter(Points2Armijo(:, 1), Points2Armijo(:, 2),'+','r')
hold on 
scatter(Points2Armijo(end,1),Points2Armijo(end, 2),100,'filled','p','k','LineWidth',2)
legend("z","steps","final solution")
xlabel("x",'FontWeight','bold')
ylabel("y",'FontWeight','bold')
title("Levenberg-Marquardt method for gamma reduced by Armijo Rule" ,"Starting Point: (" + initialPoint2(1) +","+ initialPoint2(2) + ")")



% Plot of the convergence of the objective function as to the number of repetitions
figure('Name', ['f Values for each iteration. Levenberg-Marquardt Method with gamma (Armijo Rule) = ' num2str(gammaArmijo2) '. Starting point =(' num2str(initialPoint2(1)) ',' num2str(initialPoint2(2)) ')'])
plot(1:size(Points2Armijo), f(Points2Armijo(:, 1), Points2Armijo(:, 2)))
xlabel('Iterations','FontWeight','bold')
ylabel('f(xk,yk)','FontWeight','bold')
title("Levenberg-Marquardt Method for gamma reduced by Armijo Rule" ,"Starting Point: (" + initialPoint2(1) +","+ initialPoint2(2) + ")")



%% Starting Point (1,1)
figure('Name', ['Levenberg-Marquardt Method with gamma reduced by Armijo Rule = ' num2str(gammaArmijo3) '. Starting point =(' num2str(initialPoint3(1)) ',' num2str(initialPoint3(2)) ')']) 
fsurf(f) 
hold on
plot3(Points3Armijo(:, 1), Points3Armijo(:, 2), f(Points3Armijo(:, 1),Points3Armijo(:, 2)), "r*")
hold on 
plot3(Points3Armijo(end,1),Points3Armijo(end, 2),f(Points3Armijo(end, 1), Points3Armijo(end, 2)),'g+','LineWidth',2,'MarkerSize', 10)
legend('f','steps','final solution')
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
zlabel('f(x, y)','FontWeight','bold')
title('Levenberg-Marquardt Method for gamma reduced by Armijo rule' , 'Starting Point (1,1)')



figure('Name', ['Levenberg-Marquardt Method with gamma (Armijo Rule) = ' num2str(gammaArmijo3) '. Starting point =(' num2str(initialPoint3(1)) ',' num2str(initialPoint3(2)) ')'])
fcontour(f)
hold on
scatter(Points3Armijo(:, 1), Points3Armijo(:, 2),'+','r')
hold on 
scatter(Points3Armijo(end,1),Points3Armijo(end, 2),100,'filled','p','k','LineWidth',2)
legend("z","steps","final solution")
xlabel('x','FontWeight','bold')
ylabel('y','FontWeight','bold')
title('Levenberg-Marquardt Method for gamma reduced by Armijo rule' , 'Starting Point (1,1)')


% Plot of the convergence of the objective function as to the number of repetitions
figure('Name', ['f Values for each iteration. Levenberg-Marquardt Method with gamma (Armijo Rule) = ' num2str(gammaArmijo3) '. Starting point =(' num2str(initialPoint3(1)) ',' num2str(initialPoint3(2)) ')'])
plot(1:size(Points3Armijo), f(Points3Armijo(:, 1), Points3Armijo(:, 2)))
xlabel('Iterations','FontWeight','bold')
ylabel('f(xk,yk)','FontWeight','bold')
title("Levenberg-Marquardt Method for gamma reduced by Armijo Rule." ,"Starting Point: (" + initialPoint3(1) +","+ initialPoint3(2) + ")")


%%
IterationsPoint1Task3ArmijoGamma = size(Points1Armijo,1) ;
IterationsPoint2Task3ArmijoGamma = size(Points2Armijo,1) ;
IterationsPoint3Task3ArmijoGamma = size(Points3Armijo,1) ;

%close all ; 

