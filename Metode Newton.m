%Nama   : Anasthashya Rachman
%NIM    : 121450013
%Kelas  : RB

clc
f=@(x) x^3 - 2*x^2 - 5;
z=@(x) 3*x^2 - 4*x;
xi = input("Masukkan nilai xi: ");
toleransi = input("Masukkan nilai toleransi : ");
iterasi = input("Masukkan nilai iterasi : ");
#Metode Newton's Rhapson
function nr(f,z,xi, iterasi, toleransi)
  i-1;
  while i <= iterasi
    p=xi-f(xi)/z(xi)
    if abs(p-xi)<=toleransi
      p
      break;
    endif
    fprintf(" xi =%d", xi)
    fprintf("    ")
    fprintf(" p = %d",p)
    fprintf("    ")
    fprintf(" f(xi) = %d",f(xi))
    fprintf("    ")
    fprintf(" z(xi) = %d",z(xi))
    xi=p
    i=i+1
  end
  fprintf("The method failed after %d", iterasi)
endfunction
fprintf("Metode Newton Rhapson \n")
nr(f,z,xi, iterasi, toleransi)
