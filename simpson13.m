function y = simpson13()
    % Approximating Integrals with Simpsons 1/3 
    function simpson = s(x, fx, x1, x2, h)
        n = numel(x);
        % Check evenly spaced
        space = x(2) - x(1);
        % Compare with tolerance b/c f.p. values
        for i=3:n
            if abs((x(i)-x(i-1)) - space) >= 1e-15 
                disp('Data not evenly spaced');
                return;
            end
        end
        % Is h step size multiple of "space"
        if (abs(mod(h,space)) <= 1e-17)
            disp(num2str(abs(mod(h,space))));
            disp('h not a multiple of sample interval.');
        end
        % Check bounds are in table
        x1Index = find(x==x1);
        x2Index = find(x==x2);
        if isempty(x1Index | x2Index)
            disp('Illegal Bounds');
        end
        % Check num elements we are working 
        % with, will work with simpson 1/3
        m = ((x(x2Index)-x(x1Index))/h) + 1;
        check = m-3;
        if(mod(check,2)~=0)
            disp('Incorrect Number of Data Points')
            return;
        end
        % Approximate Using Composite Simpson's 1/3 
        current = x1Index;
        integral = 0;
        for i=1:m
            if (i == 1 | i == m)
                integral = integral + fx(current);
            end 
            if mod(i, 2) == 0
                integral = integral + (4 * fx(current));
            end  
            if mod(i, 2) ~= 0 & i~= 1 & i ~= m
                integral = integral + (2 * fx(current));
            end 
            next = x(current) + h;
            nextIndex = find(abs(x-next) < 0.00001);
            current = nextIndex;
        end
        integral = (h/3)*integral;
        disp(integral); 
    end
% Stored in Arrays for easy access to data
x = [0.9000, 0.9500, 1.0000, 1.0500, 1.1000, 1.1500, 1.2000, 1.2500, 1.3000, 1.3500, 1.4000, 1.4500, 1.5000, 1.5500, 1.6000, 1.6500, 1.7000, 1.7500, 1.8000, 1.8500, 1.9000];
fx =[2.9596, 3.0857, 3.2183, 3.3577, 3.5042, 3.6582, 3.8201, 3.9903, 4.1693, 4.3547, 4.5552, 4.7631, 4.9817, 5.2115, 5.4530, 5.7070, 5.9739, 6.2546, 6.5496, 6.8598, 7.1859];
x1 = 1.0;
x2 = 1.8;
h = 0.05;
s(x, fx, x1, x2, h);
end