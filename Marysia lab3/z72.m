clear all; close all;

% Punkty
x1 = 0;
x2 = pi/4;
x3 = pi/2;

h = x2 - x1;

% Funkcja: sin(x)
y1 = sin(x1);
y2 = sin(x2);
y3 = sin(x3);

% Aproksymacje pochodnych
fp1 = (-3*y1 + 4*y2 - y3) / (2*h);
fp2 = (y3 - y1) / (2*h);
fp3 = (y1 - 4*y2 + 3*y3) / (2*h);

% Dokładne pochodne
f1_exact = cos(x1);
f2_exact = cos(x2);
f3_exact = cos(x3);

% Błędy
err1 = abs(fp1 - f1_exact);
err2 = abs(fp2 - f2_exact);
err3 = abs(fp3 - f3_exact);

% Wyniki
disp('Pochodne dla y = sin(x):');
fprintf('x = 0:      approx = %.6f, exact = %.6f, error = %.6f\n', fp1, f1_exact, err1);
fprintf('x = pi/4:   approx = %.6f, exact = %.6f, error = %.6f\n', fp2, f2_exact, err2);
fprintf('x = pi/2:   approx = %.6f, exact = %.6f, error = %.6f\n', fp3, f3_exact, err3);


%% Dodatkowa część: wielomian 0.5 + x + 2x^2

function y = fpoly(x)
    y = 0.5 + x + 2*x.^2;
end

y1p = fpoly(1);
y2p = fpoly(2);
y3p = fpoly(3);

h2 = 2 - 1;

fp1p = (-3*y1p + 4*y2p - y3p) / (2*h2);
fp2p = (y3p - y1p) / (2*h2);
fp3p = (y1p - 4*y2p + 3*y3p) / (2*h2);

% Dokładne pochodne: f'(x) = 1 + 4x
disp(' ');
disp('Pochodne dla y = 0.5 + x + 2x^2 (powinny być dokładne):');
fprintf('x = 1: approx = %.6f, exact = %.6f\n', fp1p, 1 + 4*1);
fprintf('x = 2: approx = %.6f, exact = %.6f\n', fp2p, 1 + 4*2);
fprintf('x = 3: approx = %.6f, exact = %.6f\n', fp3p, 1 + 4*3);


%% Wielomian 0.5 + x + 2x^2 + 3x^3

function y1 = fpoly3(x)
y1= 0.5 + x + 2*x.^2 + 3*x.^3;
end
z1 = fpoly3(1);
z2 = fpoly3(2);
z3 = fpoly3(3);

g1 = (-3*z1 + 4*z2 - z3) / (2*h2);
g2 = (z3 - z1) / (2*h2);
g3 = (z1 - 4*z2 + 3*z3) / (2*h2);

% Dokładne pochodne: f'(x) = 1 + 4x + 9x^2
disp(' ');
disp('Pochodne dla y = 0.5 + x + 2x^2 + 3x^3:');
fprintf('x = 1: approx = %.6f, exact = %.6f\n', g1, 1 + 4*1 + 9*1^2);
fprintf('x = 2: approx = %.6f, exact = %.6f\n', g2, 1 + 4*2 + 9*2^2);
fprintf('x = 3: approx = %.6f, exact = %.6f\n', g3, 1 + 4*3 + 9*3^2);
    