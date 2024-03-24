%NAMA: ANASTHASHYA RACHMAN
%NIM: 121450013
%KELAS: RB

clc;

function algorithm_7_1()

  A = [10, -1, 0, 9;
      -1, 10, -2, 7;
      0, -2, 10, 6];
  n = length(A)-1;
  for i=1:n
    b(i) = A(i,length(A));
    X0(i) = 0;
  endfor

  N = 1000;

  toleransi = 1e-6;

  disp("\n\tMatrix equation\n")
  disp(A)

  fprintf("\n\titerasi\t ")
  for j=1:n
    fprintf("x%d\t\t ", j)
  endfor
  fprintf("\n")

  k = 1;
  while k <= N
    for i=1:n
      metnum = 0;
      for j=1:n
        if j != i
          metnum = metnum + (A(i,j) * X0(j));
        endif
      endfor
      x(i) = (1/A(i,i))*(-metnum+ b(i));
    endfor
    fprintf("\t%d\t ", k)
    for i=1:n
      fprintf("%f\t ", x(i))
    endfor
    fprintf("\n")
    if norm(x-X0) < toleransi
      return
    endif
    k = k+1;
    for i=1:n
      X0(i) = x(i);
    endfor
  endwhile
endfunction


function algorithm_7_2()

  A = [10, -1, 0, 9;
      -1, 10, -2, 7;
      0, -2, 10, 6];
  n = length(A)-1;
  for i=1:n
    b(i) = A(i,length(A));
    X0(i) = 0;
  endfor

  N = 1000;

  toleransi = 1e-6;

  disp("\n\tMatrix equation\n")
  disp(A)

  fprintf("\n\titerasi\t ")
  for j=1:n
    fprintf("x%d\t\t ", j)
  endfor
  fprintf("\n")

  k = 1;
  while k <= N
    for i=1:n
      metnum = 0;
      for j=1:i-1
        metnum = metnum + (A(i,j)*x(j));
      endfor
      sd = 0;
      for j=i+1:n
        sd = sd + (A(i,j)*X0(j));
      endfor
      x(i) = (1/A(i,i))*(-metnum-sd+b(i));
    endfor
    fprintf("\t%d\t ", k)
    for i=1:n
      fprintf("%f\t ", x(i))
    endfor
    fprintf("\n")
    if norm(x-X0) < toleransi
      return
    endif
    k = k+1;
    for i=1:n
      X0(i) = x(i);
    endfor
  endwhile
endfunction

fprintf("1. Algoritma 7.1 (Jacobi) \n2. Algoritma 7.2 (Gauss-Seidel)\n")
p = input("\nAlgoritma (1 or 2): ");
if p == 1
  algorithm_7_1()
elseif p == 2
  algorithm_7_2()
endif


