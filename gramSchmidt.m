function gs = gramSchmidt()
%Specific for PS9

%Data Points
x =[1910;1920;1930;1940;1950;1960;1970;1980;1990;2000;2010];
y = [1;1;1;1;1;1;1;1;1;1;1];
b =[1750;1860;2070;2298;2557;3042;3712;4453;5291;6094;6868];

a1 = x; 
a2 = y; 

%Step One 
y1 = a1;
r11 = norm(y1);

q1 = a1/r11;
q1t = q1.';

%Step Two 
r12 = q1t*a2;
y2 = a2 - q1*(r12);

r22 = norm(y2);
q2 = y2/r22;

%Construct Matrices
Q = [q1 q2];
Qt = Q.';
R = [r11 r12; 0 r22];

%Check
A = Q*R;

% Solve for a, and b in y=ax+b 
    % Ax=b
    % QRx = b
    % QtQRx = Qtb
    % Rx = Qtb

Qtb = Qt * b;

sol = R\Qtb;
sol(2)

% a = x(1) -- slope and  b = x(2)-- intercept
% Graph Results
x1 = [1910:1:2010];
f = sol(1)*x1 + sol(2);

plot(x, b, 'ro',x1,f, 'k')

xlabel('Years');
ylabel('Population in Millions');
title('World Population 1910-2010');

set(gca,'fontsize',12);


end