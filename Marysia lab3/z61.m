%% Problem 6.1 - Nadokreślony układ równań
clear; clc;

A = [1 1;  % współczynniki równań
     1 -1;
     2 1];

b = [2; 0; 3];   % prawa strona równań

% Rozwiązanie intuicyjno-definicyjne (wg wzoru 6.1):
x_ls = inv(A'*A) * A' * b

% Porównanie z funkcją backslash (operator MATLAB-a):
x_backslash = A\b

% Oblicz błąd przybliżenia:
error = norm(A*x_ls - b)

disp('Rozwiązanie w sensie najmniejszych kwadratów:');
disp(x_ls);
disp(['Błąd aproksymacji: ', num2str(error)]);
