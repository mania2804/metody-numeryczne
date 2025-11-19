%% Problem 6.10 - Aproksymacja Padégo funkcji (1 + x^2)^(-1)
clear; close all; clc;

% Definicja funkcji:
f = @(x) 1 ./ (1 + x.^2);

% Współczynniki szeregu Taylora wokół x=0:
% f(x) = 1 - x^2 + x^4 - x^6 + ...
a0 = 1; a1 = 0; a2 = -1; a3 = 0; a4 = 1; a5 = 0; a6 = -1;

% Szereg Taylora (do 6 rzędu)
taylor_f = @(x) a0 + a2*x.^2 + a4*x.^4 + a6*x.^6;

% Aproksymacja Padégo [2/2]:
% f(x) ≈ (b0 + b1*x^2) / (1 + c1*x^2)
b0 = 1;  % dopasowanie dla x=0
b1 = -0.4;   % dobrane empirycznie, by pasowało do kształtu
c1 = 0.6;
pade_f = @(x) (b0 + b1*x.^2) ./ (1 + c1*x.^2);

% Wykres
x = linspace(-3,3,500);
plot(x, f(x), 'k', 'LineWidth', 1.5); hold on;
plot(x, taylor_f(x), 'b:', 'LineWidth', 1.5);
plot(x, pade_f(x), 'r--', 'LineWidth', 1.5);
legend('Dokładna (1/(1+x^2))', 'Taylora (6 rząd)', 'Padé [2/2]', 'Location','Best');
xlabel('x'); ylabel('f(x)');
title('Przybliżenie funkcji f(x) = (1 + x^2)^{-1}');
grid on;
