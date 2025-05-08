% Define function using symbolic toolbox
syms f(x, y);
f(x, y) = (x^3) * exp(- x^2 - y^4);


% Plot the function
figure("Name", "Function plot");
fsurf(f);
xlabel("x");
ylabel("y");
zlabel("f(x, y)");
title(['Function Plot :' char(f)])

figure("Name", "Function plot Contour");
fcontour(f);
xlabel("x");
ylabel("y");
zlabel("f(x, y)");
title(['Function Plot :' char(f)])

fun = matlabFunction(f); % Convert the symbolic function to a MATLAB function handle
initialGuess = [1, 1]; % Initial guess for x and y
minPoint = fminsearch(@(vars) fun(vars(1), vars(2)), initialGuess);

% Calculate the minimum value of the function at the minimum point
minValue = fun(minPoint(1), minPoint(2));