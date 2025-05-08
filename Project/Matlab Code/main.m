mutationChance = 10;
maxGen = 2000 ;
gaussians = 15;
genesSize = gaussians*5;

%% Run Genetic Algorithm 

[bestCand,bestError] = GeneticAlgorithm(gaussians,maxGen,mutationChance,[0.3 0.1 0.6]);

%% Plot of original f 
sizef = 100 ; 
u1 = linspace(-1, 2, sizef) ; 
u2 = linspace(-2, 1, sizef) ; 

fValues = zeros(sizef,sizef);
u1CountF = 1;
    for i = u1
        u2CountF = 1;
        for j = u2
            fValues(u1CountF,u2CountF) = f(i,j);
            u2CountF = u2CountF + 1;
        end
        u1CountF = u1CountF + 1;
    end
figure('Name','Plot of original f f')
surf(u1,u2,fValues) ;
xlabel('x','FontWeight','bold') ;
ylabel('y','FontWeight','bold') ;
zlabel('f(x, y)','FontWeight','bold')
title('3D Plot of f(x,y):','$\sin(x + y)*sin(x^2)$','Interpreter','latex','FontWeight','bold') ; 



%% Approximation plot of f  
sizeA = 100 ;
%u1 = linspace(-1, 2, sizeA) ; 
%u2 = linspace(-2, 1, sizeA) ; 

fApproximation = zeros(sizeA,sizeA) ;

u1Count = 1 ;
for i = u1
    u2Count = 1;
    for j = u2
        fApproximation(u1Count,u2Count) = fBar(i,j,bestCand,genesSize);
        u2Count = u2Count + 1 ;
    end
    u1Count = u1Count + 1 ;
end
figure('Name','Approximation plot of f') ; 
surf(u1,u2,fApproximation) ;
xlabel('x','FontWeight','bold') ; 
ylabel('y','FontWeight','bold') ; 
zlabel('Approximation f(x, y)','FontWeight','bold') ; 
title('f Αpproximation plot','FontWeight','bold') ;



%% Error Plots 
figure('Name','Error between approximated f and original f')
plot(bestError) ; 
xlabel('x','FontWeight','bold') ; 
ylabel('Error','FontWeight','bold') ; 
title('Error between approximated f and original f');


errorValues = fValues - fApproximation;

figure('Name','Error between approximated f and original f in 3D plot')
surf(u1,u2,errorValues) ;
xlabel('x','FontWeight','bold') ; 
ylabel('y','FontWeight','bold') ; 
zlabel('Error','FontWeight','bold') ; 
title('Error 3D between approximated f and original f') ;



%% Table of all Gaussians calculated
gaussianNames = {'1st Gaussian';'2nd Gaussian';'3rd Gaussian';'4th Gaussian';...
    '5th Gaussian';'6th Gaussian';'7th Gaussian';'8th Gaussian';'9th Gaussian';...
    '10th Gaussian';'11th Gaussian';'12th Gaussian';'13th Gaussian';...
    '14th Gaussian';'15th Gaussian'};
A = bestCand(1:5:end)';
center1 = bestCand(2:5:end)'; 
center2 = bestCand(3:5:end)';
sigma1 = bestCand(4:5:end)'; 
sigma2 = bestCand(5:5:end)'; 
gaussiansTable = table(gaussianNames,A,center1,center2,sigma1,sigma2);
disp(gaussiansTable)