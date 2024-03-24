% Nama  : Anasthashya Rachman
% NIM   : 121450013
% Kelas : RB

%langrange polynoms

xdata = [8.1; 8.3; 8.6; 8.7];
ydata = [16.94410; 17.56492; 18.50515; 18.82091];
X = 8.4;
l = zeros(size(xdata));

for i = 1:size(xdata,1)
  prod1 = 1;
  prod2 = 1;
  for j = 1:size(xdata,1)
    if j ~= i
      prod1 = prod1 * (X - xdata(j));
      prod2 = prod2 * (xdata(i) - xdata(j));
    end
  end
  l(i) = prod1 / prod2;
  display(prod1)
  display(prod2)
  display(l(i))
end
Y = sum(l .* ydata);

printf("Nilai Y saat X=%f adalah %f\n", X, Y);

printf("\n----------------------------------------------------------------\n")

%newton divide
x = [-0.1; 0.0; 0.2; 0.3];
y = [5.3; 2; 3.19; 1];
n = size(x,1);
ST = zeros(n,n);
ST(:,1) = y';

for j = 2:n
  for i = 1:(n-j+1)
    pembilang = ST(i+1,j-1) - ST(i,j-1);
    penyebut= x(i+j-1) - x(i);
    ST(i,j) = pembilang/ penyebut;
  end
end

disp("Tabel Beda Terbagi:")
disp("  x_i        y_i      ST-1        ST-2       ST-3")
for i = 1:n
  row = [x(i) ST(i,:)];
  disp(sprintf("%5.2f   %8.5f  %8.5f    %8.5f    %8.5f", row))
end
