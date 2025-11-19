%% Problem 6.9 - Sprawdzenie transformacji biliniowej
clear; close all; clc;

T = 1;                  % okres próbkowania (dla prostoty T=1)
w = linspace(0, pi, 500);   % częstotliwość cyfrowa [rad]

% Zależność dokładna (definicyjna, 6.41):
Omega_exact = (2/T) * tan(w/2);

% Zależność przybliżona (6.40):
Omega_approx = w / T;

figure;
plot(w, Omega_exact, 'b', 'LineWidth', 1.5); hold on;
plot(w, Omega_approx, 'r--', 'LineWidth', 1.5);
xlabel('\omega [rad]');
ylabel('\Omega [analogowa]');
legend('Dokładna (6.41)', 'Przybliżona (6.40)', 'Location','NorthWest');
title('Porównanie transformacji biliniowej');
grid on;
