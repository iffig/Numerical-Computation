%Newton's Method for Finding Roots 
function y= netwtons(a, tol)
    % Function for which we find the root
    function retn_val = f(x)
        retn_val = 2*x^2 + x -6;
        %2*x^3 + 5*x^2 - 4*x -12
    end
    % Derivative function to help find root
    function retn_val = fprime(x)
        retn_val = 4*x + 1;
        %6*x^2 + 10*x -4
    end

iterationArray = [];
guessArray = [];
errorArray = [];
    
iteration = 1;

% Initial guess and error value
guess = a - (f(a)/fprime(a));
err = abs(f(guess));

iterationArray = [iterationArray, iteration];
guessArray = [guessArray, guess];
errorArray = [errorArray, err];
display([iteration, guess, err]);

while err > tol
    % Update guess
    a = guess;
     
    % Make a new guess and
    % establish the new error
    guess = a - (f(a)/fprime(a));
    err = abs(f(guess));
    iteration = iteration+1;
    % for data keeping
    iterationArray = [iterationArray, iteration];
    guessArray = [guessArray, guess];
    errorArray = [errorArray, err];
     display([iteration, guess, err]);
    
end
display(guess);

% Making Plots
x = iterationArray;
y = errorArray;
plot(x,y);
xlabel('Number of Iterations','FontSize',15);
ylabel('Error','FontSize',15);
title('Newtons Method Error','FontSize',15);
end