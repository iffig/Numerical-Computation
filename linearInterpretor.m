function linInt = linearInterpretor()
%Input point values 
x1 = 8.71; 
y1 = 84.07; 

x2 = 33.44; 
y2 = 87.93; 

%Build line from points: 
m = (y1-y2)/(x1-x2);
b = y1 - m*x1;

%Extrapolate/Interpolate at a value x to get y
x = 10; 
y = m*x +b

end