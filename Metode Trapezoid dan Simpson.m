clc
% Nama  : Anasthashya Rachman
% NIM   : 121450013
% Kelas : RB

% COMPOSITE TRAPEZOID

% Algoritma :
% INPUT : endpoints a, b; even positive integer n.
% OUTPUT : approximation I.
% Step 1 : Set h = (b-a)/n
% Step 2 : Set x = a:h:b
% Step 3 : Set I = (h/2) * (f(a) + 2*sum(f(x(2:end-1))) + f(b)).
% Step 4 : OUTPUT (I);
  % STOP.

f = @(x) x.*log(x); % definisi fungsi f(x)
a = 1; % batas bawah integral
b = 2; % batas bawah integral
n = 4; % jumlah subinterval


function [I] = composite_trapezoid(f, a, b, n)
  h = (b-a)/n;
  x = a:h:b;
  I = (h/2)*(f(a) + 2*sum(f(x(2:end-1))) + f(b));
endfunction

result = composite_trapezoid(f, a, b, n);
str = sprintf("Hasil Integral Composite Trapezoid: %.9f", result);
disp(str);

% COMPOSITE SIMPSON'S
% Algoritma :
% INPUT : endpoints a, b; even positive integer n.
% OUTPUT : approximation XI to I.
% Step 1 : Set h = (b − a)/n.
% Step 2 : Set XI0 = f (a) + f (b);
           % XI1 = 0; (Summation of f (x2i−1).)
           % XI2 = 0. (Summation of f (x2i).)
% Step : 3 For i = 1, ... , n − 1 do Steps 4 and 5.
      % Step 4 : Set X = a + ih.
      % Step 5 : If i is even then set XI2 = XI2 + f (X)
           % else set XI1 = XI1 + f (X).
% Step 6 : Set XI = h(XI0 + 2 · XI2 + 4 · XI1)/3.
% Step 7 : OUTPUT (XI);
  % STOP.

f = @(x) x*log(x); % definisi fungsi f(x)
a = 1; % batas bawah integral
b = 2; % batas atas integral
n = 4; % jumlah subinterval


function XI = composite_simpson_rule(f, a, b, n)
% Step 1
h = (b - a)/n;

% Step 2
XI0 = f(a) + f(b);
XI1 = 0;
XI2 = 0;

% Step 3
for i = 1:n-1
  % Step 4
  X = a + i*h;

  % Step 5
  if mod(i, 2) == 0
    XI2 = XI2 + f(X);
  else
    XI1 = XI1 + f(X);
  end
end

% Step 6
XI = h*(XI0 + 2*XI2 + 4*XI1)/3;

end

result = composite_simpson_rule(f, a, b, n);
str = sprintf("Hasil Integral Composite Simpson's: %.8f", result);
disp(str);

% Integral Romberg
% Define the integrand function
f = @(x) x.^2 .* log(x);

% Define the limits of integration
a = 1;
b = 1.5;

% Define the number of iterations for Romberg integration
n = 3;

% Initialize the Romberg integration table
R = zeros(n, n);

% Compute the first column of the table (trapezoidal rule)
h = b - a;
R(1, 1) = (f(a) + f(b)) * h / 2;

for i = 2:n
    h = h / 2;

    % Compute the composite trapezoidal rule
    sum_f = 0;
    for j = 1:2^(i-2)
        x = a + (2 * j - 1) * h;
        sum_f = sum_f + f(x);
    end

    R(i, 1) = 0.5 * R(i-1, 1) + sum_f * h;
end

% Compute the remaining columns of the table (Richardson extrapolation)
for j = 2:n
    for i = j:n
        R(i, j) = R(i, j-1) + (R(i, j-1) - R(i-1, j-1)) / ((4^(j-1)) - 1);
    end
end

% Display the Romberg integration table
result = R(n, n);
str = sprintf("Hasil Integral dengan Integral Romberg: %.8f", result);
disp(str);

% No. 7
% Values of x
x = [1, 2, 3, 4, 5];

% Values of f(x)
f = [2.4142, 2.6734, 2.8974, 3.0976, 3.2804];

% Lower limit of integration
a = 1;
b = 5;

% Number of data points
n = length(x);

% Step size
h = (b - a) / (n - 1);
h = (5 - 1) / (n - 1);

% Initialize the sum with the first and last terms
integral_approx = (f(1) + f(n)) / 2;

for i = 2:(n-1)
    % Add the intermediate terms
    integral_approx = integral_approx + f(i);
end

% Multiply by the step size
integral_approx = integral_approx * h;

disp("Hasil integral no. 7 adalah:" );

disp(integral_approx);
