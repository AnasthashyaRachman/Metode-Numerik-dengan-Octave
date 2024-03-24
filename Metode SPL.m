%NAMA: ANASTHASHYA RACHMAN
%NIM: 121450013
%KELAS: RB

%Soal 6.2 No 3C

% matriks equation
A = [2 -3 2 5;
     -4 2 -6 14;
     2 2 4 8];

n = length(A)-1;
disp(A)
disp("\n")
for i=1:n
  NROW(i) = i;
endfor

for i=1:n-1
  p = 0;
  j = 1;
  for z=2:n
    if abs(A(NROW(j),i)) < abs(A(NROW(z),i))
      j = z;
    endif
  endfor
  while p <= n
    if i <= p && p <= n && abs(A(NROW(p),i)) == abs(A(NROW(j),i))
      break
    elseif
      p = p+1;
    endif
  endwhile
  if A(NROW(p),i) == 0
    fprintf("no unique solution\n")
    return
  endif
  if NROW(i) != NROW(p)
    for tr=1:n+1
      zn = A(NROW(p),tr);
      A(NROW(p),tr) = A(NROW(i),tr);
      A(NROW(i),tr) = zn;
    endfor
  endif
  disp(A)
  disp("\n")
  for j=i+1:n
    m(NROW(j),i) = A(NROW(j),i)/A(NROW(i),i);
    for k=1:n+1
      A(NROW(j),k) = A(NROW(j),k)-(A(NROW(i),k)*m(NROW(j),i));
    endfor
  endfor
  disp(A)
  disp("\n")
endfor
if A(NROW(n),n) == 0
  fprintf("no unique solution\n")
  return
endif

x(n) = A(NROW(n),n+1)/A(NROW(n),n);
for i=n-1:-1:1
  ax = 0;
  for j=i+1:n
    ax = ax + (A(NROW(i),j)*x(j));
  endfor
  x(i) = (A(NROW(i),n+1)-ax)/A(NROW(i),i);
endfor
disp("Solution\n")
for i=1:n
  fprintf("\tx%d = ", i)
  disp(x(i))
endfor



