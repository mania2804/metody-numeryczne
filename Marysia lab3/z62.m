%% Problem 6.2 - Nadokreślony układ równań - metoda QR
clear; clc;

A = [1 1;
     1 -1;
     2 1];
b = [2; 0; 3];

% Dekompozycja QR
[Q, R] = qr(A, 0);   % '0' => zwraca zredukowaną wersję (m×n, n×n)

% Oblicz r2 = Q' * b (czyli prawa strona wzoru 6.7)
r2 = Q' * b;

% R1 * x = r2  → rozwiązanie przez podstawienie wsteczne
x_qr = R \ r2

% Porównanie z wynikiem z 6.1 (metoda najmniejszych kwadratów)
x_backslash = A\b

% Błąd
error = norm(A*x_qr - b)

disp('Rozwiązanie metodą QR:');
disp(x_qr);
disp(['Błąd aproksymacji: ', num2str(error)]);
