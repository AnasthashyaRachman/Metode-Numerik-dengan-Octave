clc

% Nama: Anasthashya Rachman
% NIM: 121450013
% Kelas: RB


% METODE EULER NO. 2B
% Inisialisasi variabel
t0 = 1;        % Nilai awal t
y0 = 2;        % Nilai awal y
h = 0.5;       % Ukuran langkah

% Menghitung jumlah langkah
n = (2 - 1) / h;

% Fungsi untuk menghitung turunan y terhadap t
f = @(t, y) (1 + t) / (1 + y);

% Inisialisasi array
t = zeros(n+1, 1);
y = zeros(n+1, 1);

% Menetapkan nilai awal
t(1) = t0;
y(1) = y0;

% Iterasi menggunakan Metode Euler
for i = 1:n
    t(i+1) = t(i) + h;
    y(i+1) = y(i) + h * f(t(i), y(i));
end

% Menampilkan solusi perkiraan
disp('Solusi perkiraan menggunakan metode Euler:');
disp('   t        y');
disp([t y]);

% METODE MODIFIKASI EULER NO.1B
f = @(t, y) 1 + (t-y)^2;
a = 2;
b = 3;
n = 2;
alpha = 1;

function [t, w] = modified_euler(f, a, b, n, alpha)
    h = (b-a)/n;
    t = a:h:b;
    w = zeros(1, n+1);
    w(1) = alpha;
    for i=1:n
        k1 = h*f(t(i), w(i));
        k2 = h*f(t(i)+h, w(i)+k1);
        w(i+1) = w(i) + (k1+k2)/2;
    end
end

f = @(t, y) 1 + (t-y)^2;
a = 2;
b = 3;
n = 2;
alpha = 1;

[t, w] = modified_euler(f, a, b, n, alpha);
actual = t + 1./(1-t);

% Menampilkan solusi perkiraan
disp('Solusi perkiraan menggunakan metode Modified Euler:');
disp("    t       Modified Euler        y(t)")
disp("-----------------------------------------")
for i=1:n+1
    fprintf("%.7f      %.7f       %.7f\n", t(i), w(i), actual(i));
end

% METODE MINDPOINT NO.5
f = @(t, y) 1 + (t - y)^2;
a = 2;
b = 3;
n = 2;
alpha = 1;

function [t, w] = midpoint(f, a, b, n, alpha)
    h = (b-a)/n;
    t = a:h:b;
    w = zeros(1, n+1);
    w(1) = alpha;
    for i=1:n
        k1 = f(t(i), w(i));
        k2 = f(t(i)+h/2, w(i)+h/2*k1);
        w(i+1) = w(i) + h*k2;
    end
end

f = @(t, y) 1 + (t - y)^2;
a = 2;
b = 3;
n = 2;
alpha = 1;

[t, w] = midpoint(f, a, b, n, alpha);
actual = t + 1./(1-t);

% Menampilkan solusi perkiraan
disp('Solusi perkiraan menggunakan metode Mindpoint:');
disp("    t        Midpoint         y(t)")
disp("--------------------------------------")
for i=1:n+1
    fprintf("%.7f    %.7f      %.7f\n", t(i), w(i), actual(i));
end
