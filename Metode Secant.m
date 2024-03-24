%Nama   : Anasthashya Rachman
%NIM    : 121450013
%Kelas  : RB

clc
f=@(x) x^3 - 2*x^2 - 5;
z=@(x) 3*x^2 - 2*x;
a = input("Enter a value for a: ");
b = input("Enter a value for b: ");
toleransi = input("Enter a value for tol : ");
iterasi = input("Enter a value for iteration : ");
#Metode Secant
function s(f,a,b, iterasi, toleransi)
  i=1;
  q0=f(a)
  q1=f(b)
  while i <= iterasi
    p=b-q1*(b-a)/(q1-q0);
    if abs(p-b) <= toleransi
      p
      break;
    endif
    fprintf(" p = %d",p)
    fprintf("    ")
    fprintf(" a = %d",a)
    fprintf("    ")
    fprintf(" b = %d",b)
    fprintf("    ")
    fprintf(" q0 = %d",q0)
    fprintf("    ")
    fprintf(" q1 = %d",q1)
    a=b
    q0=q1
    b=p
    q1=f(p)
    i=i+1
   end
  fprintf("The method failed after N0 iterations, N0 = %d",iterasi)
endfunction
fprintf("Metode Secant \n")
s(f,a,b, iterasi, toleransi)
