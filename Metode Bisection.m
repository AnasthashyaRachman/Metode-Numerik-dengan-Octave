clc
%Nama   : Anasthashya Rachman
%NIM    : 121450013
%Kelas  : RB

%Algotitma Bisection

f = @(x) 3.0*(x+1)*(x-0.5)*(x-1) ; %Fungsi yang tertera pada soal
n = 15 ; %Menginputkan iterasi
a = -2 ; %Batas bawah yang tertera pada soal
b = 1.5 ;%Batas atas yang tertera pada soal
eps = 1e-6 %Nilai toleransi

while (f(a)*f(b)>0)
  disp ('Initial gueses are not correct');
    a = input ('Enter initial gueses a = ');
    b = input ('Enter initial gueses b = ');
end
fprintf ('\n Itr. No.\t a\t\t b \t\t xr')

for i = 1:n
    xr = (a+b)/2;
    if (f(xr)*f(b)<0)
           a = xr;
    else
           b = xr;
    end
    fprintf ('\n %d \t\t %f\t &f \t &f' , i,a,b,xr);
end
fprintf ('\n\tRoot of equation is = %f', xr);


