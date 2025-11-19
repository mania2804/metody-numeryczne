% integ_2D_prob.m
% Całkowanie 2D - prawdopodobieństwo w przedziale [-sigma, sigma]

clear all; close all;

sigma = 1; % parametr rozkładu

% --- Siatka punktów w przedziale [-sigma, sigma] ---
dx = 0.05; % krok siatki
x = -sigma:dx:sigma;
y = -sigma:dx:sigma;
[X, Y] = meshgrid(x, y);

% --- Funkcja gęstości 2D (niezależne zmienne, sigma w obu wymiarach) ---
p = 1/(2*pi*sigma^2) * exp(-0.5*(X.^2 + Y.^2)/sigma^2);

% --- Rysunek powierzchni ---
figure;
surf(X, Y, p);
xlabel('x'); ylabel('y'); zlabel('p(x,y)');
title('Funkcja gęstości p(x,y)');

% --- Waga trapezów ---
w = dx/2 * [1 2*ones(1,length(x)-2) 1];

% --- Całka 2D metodą trapezów ---
P = w * p * w'; % macierz wag i wartości funkcji
fprintf('Prawdopodobieństwo w przedziale [-sigma, sigma]: %.6f\n', P);
%7.14