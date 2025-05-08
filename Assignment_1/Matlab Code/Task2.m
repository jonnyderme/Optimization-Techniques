%% Task 2 

% Symbolic representation of the functions
syms f1(x);
syms f2(x);
syms f3(x);
f1(x) = (x-1)^3 + ((x-4)^2)*cos(x);
f2(x) = exp(-2*x) + (x-2)^2;
f3(x) = (x^2)*log(0.5*x) + sin(0.2*x);


% Low and Upper Limit
lowLimit= 0 ; 
UpperLimit = 3 ; 

%% Change l (final search margin) 

%% Function 1
indexF = 1 ;

lStart = 0.005 ;  
lEnd = 0.1 ; 
lNum = 100 ;
lMatf1 = linspace(lStart,lEnd,lNum) ;
kIterationsf1l = zeros(lNum,1) ;

for iL = 1 : lNum
    [kf1, ~] = goldenRatioMethod(indexF,lowLimit,UpperLimit,lMatf1(iL));   % for every lamda get k 
    kIterationsf1l(iL) = kf1;
end

% plot results for f1
figure("Name", "Number of iterations, variable l")
plot(lMatf1, kIterationsf1l );
xlabel("l");
ylabel("iterations");
title(['f1(x)=' char(f1)])

% two calculations of the cost function per iteration, except 
% from the last iteration
figure("Name", "Number of calculations, variable l")
plot(lMatf1,(kIterationsf1l+1)) ;
xlabel("l");
ylabel("calculations");
title(['Calculations for f1(x)=' char(f1)])


%% Function 2
indexF = 2 ;
lMatf2 = linspace(lStart,lEnd,lNum) ;
kIterationsf2l = zeros(lNum,1) ;

for iL = 1 : lNum
    [k, ~] = goldenRatioMethod(indexF,lowLimit,UpperLimit,lMatf2(iL));   % for every lamda get k 
    kIterationsf2l(iL) = k;
end

% plot results for f2
figure("Name", "Number of iterations, e = 0.01, variable l")
plot(lMatf2, kIterationsf2l );
xlabel("l");
ylabel("iterations");
title(['f2(x)=' char(f2)])

% two calculations of the cost function per iteration, except 
% from the last iteration
figure("Name", "Number of calculations, e = 0.001, variable l")
plot(lMatf2,(kIterationsf2l+1)) ;
xlabel("l");
ylabel("calculations");
title(['Calculations for f2(x)=' char(f2)])


%% Function 3
indexF = 3 ;
lMatf3 = linspace(lStart,lEnd,lNum) ;
kIterationsf3l = zeros(lNum,1) ;

for iL = 1 : lNum
    [k, ~] = goldenRatioMethod(indexF,lowLimit,UpperLimit,lMatf3(iL));   % for every lamda get k 
    kIterationsf3l(iL) = k;
end

% plot results for f3
figure("Name", "Number of iterations, e = 0.01, variable l")
plot(lMatf3, kIterationsf3l );
xlabel("l");
ylabel("iterations");
title(['f3(x)=' char(f3)])

% two calculations of the cost function per iteration, except 
% from the last iteration
figure("Name", "Number of calculations, e = 0.001, variable l")
plot(lMatf3,(kIterationsf3l+1)*2) ;
xlabel("l");
ylabel("calculations");
title(['Calculations for f3(x)=' char(f3)])


%% Plots for the limits a_k and b_k for different values of l parameter 


%% Function 1
indexF = 1 ;
eConst = 0.001 ;
lValues = [ 0.0021 0.008 0.02 0.05 0.08 0.1]  ;
legendTextLow1 = cell(1, length(lValues)); % Preallocate a cell array for legend text
legendTextUp1 = cell(1, length(lValues)); % Preallocate a cell array for legend text

figure('Name','Boundaries [a,b] that contain the minimum value of f1')
for iV = 1 : length(lValues)
    [~ , limits] = goldenRatioMethod(indexF,lowLimit,UpperLimit,lValues(iV)) ;
    
    x=linspace(1,size(limits,2),size(limits,2)) ;
    % Format the legend text for the current iteration
    legendTextLow1{1,iV} = sprintf('Low limit %.0f : %.4f', iV ,lValues(iV));
    legendTextUp1{1,iV} = sprintf('Upper limit %.0f : %.4f', iV ,lValues(iV));
    
    % figure('Name','Boundaries [a,b] that contain the minimum value of f1') 
    plot(limits(1,:))
    hold on 
    plot(limits(2,:))
    hold on 

end
hold off
xlabel('Number of iterations (k)') 
ylabel('[ak,bk]')
legend([legendTextLow1 , legendTextUp1])
title('Boundaries [a,b] that contain the minimum value of f1')

%% Function 2
indexF = 2 ; 
eConst = 0.001 ;
lValues = [ 0.0021 0.008 0.02 0.05 0.08 0.1]  ;
legendTextLow2 = cell(1, length(lValues)); % Preallocate a cell array for legend text
legendTextUp2 = cell(1, length(lValues)); % Preallocate a cell array for legend text

figure('Name','Boundaries [a,b] that contain the minimum value of f2') 
for iV = 1 : length(lValues)
    [~ , limits] = goldenRatioMethod(indexF,lowLimit,UpperLimit,lValues(iV)) ;
    
    x=linspace(1,size(limits,2),size(limits,2)) ;
    % Format the legend text for the current iteration
    legendTextLow2{1,iV} = sprintf('Low limit %.0f : %.4f', iV ,lValues(iV));
    legendTextUp2{1,iV} = sprintf('Upper limit %.0f : %.4f', iV ,lValues(iV));
    
    % figure('Name','Boundaries [a,b] that contain the minimum value of f2') 
    plot(limits(1,:))
    hold on 
    plot(limits(2,:))
    hold on 

end
xlabel('Number of iterations (k)') 
ylabel('[ak,bk]')
legend([legendTextLow2 , legendTextUp2])
title('Boundaries [a,b] that contain the minimum value of f2')


%% Function 3
indexF = 3 ; 
eConst = 0.001 ;
lValues = [ 0.0021 0.008 0.02 0.05 0.08 0.1]  ;
legendTextLow3 = cell(1, length(lValues)); % Preallocate a cell array for legend text
legendTextUp3 = cell(1, length(lValues)); % Preallocate a cell array for legend text

figure('Name','Boundaries [a,b] that contain the minimum value of f3') 
for iV = 1 : length(lValues)
    [~ , limits] = goldenRatioMethod(indexF,lowLimit,UpperLimit,lValues(iV)) ;
    
    x=linspace(1,size(limits,2),size(limits,2)) ;
    % Format the legend text for the current iteration
    legendTextLow3{1,iV} = sprintf('Low limit %.0f : %.4f', iV ,lValues(iV));
    legendTextUp3{1,iV} = sprintf('Upper limit %.0f : %.4f', iV ,lValues(iV));
    
    % figure('Name','Boundaries [a,b] that contain the minimum value of f3') 
    plot(limits(1,:))
    hold on 
    plot(limits(2,:))
    hold on 

end
xlabel('Number of iterations (k)') 
ylabel('[ak,bk]')
legend([legendTextLow3 , legendTextUp3])
title('Boundaries [a,b] that contain the minimum value of f3')

close all ;
