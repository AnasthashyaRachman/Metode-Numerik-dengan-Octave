# Nama  : Anasthashya Rachman
# NIM   : 121450013
# Kelas : RB


% Function
f = @(x) x*exp(x);

x0 = 2.0;
h = 0.2;

% Initialized richardson order 2 table
R = zeros(30,2);
R(1,1) = (f(x0+h) - f(x0-h))/(2*h);

% Iteration to calculate the Richardson Extrapolation from order 2 to order 30
for i = 2:30
  % h value for order i
  h_i = h/i;

  % Derivative calculation
  R(i,1) = (f(x0+h_i) - f(x0-h_i))/(2*h_i);

  % Richardson extrapolation of order i-1
  R(i,2) = (4^i*R(i-1,1) - R(i-1,2))/(4^i-1);
end

% Displays results from order 2 to order 30
disp('Derivative approximation using Richardson Extrapolation:');
disp(R(:,2));

% Displays an approximation of order 30
disp('Derivative approximation of order O(h^30):');
disp(R(30,2));








