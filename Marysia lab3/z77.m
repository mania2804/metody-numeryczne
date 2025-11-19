clear all; close all;


K = 20;                         % liczba podprzedziałów (zmień dowolnie)
x = (0:K) * (pi/2) / K;         % K+1 równych węzłów
y = sin(x);
h = (pi/2) / K;

%% (7.31) Metoda trapezów
I_trap = h * ( 0.5*y(1) + sum(y(2:K)) + 0.5*y(K+1) );

%% (7.32) Metoda Simpsona (K musi być parzyste)
if mod(K,2)==0
    I_simp = h/3 * ( y(1) + y(K+1) + ...
                     4*sum(y(2:2:K)) + ...
                     2*sum(y(3:2:K-1)) );
else
    I_simp = NaN;
end

%% (7.33) Metoda 3/8 (K podzielne przez 3)
if mod(K,3)==0
    I_38 = 3*h/8 * ( y(1) + y(K+1) ...
                   + 3*sum(y(2:3:K-1)) ...
                   + 3*sum(y(3:3:K-2)) ...
                   + 2*sum(y(4:3:K-3)) );
else
    I_38 = NaN;
end

%% (7.34) Reguła Boole'a (K podzielne przez 4)
if mod(K,4)==0
    I_boole = 2*h/45 * ( 7*(y(1) + y(K+1)) ...
                      + 32*sum(y(2:4:K)) ...
                      + 12*sum(y(3:4:K-1)) ...
                      + 14*sum(y(5:4:K-3)) );
else
    I_boole = NaN;
end

%% Wynik dokładny
I_exact = 1;

%% Wyświetlanie
fprintf("Wynik dokładny: 1.000000\n");
fprintf("Trapezy : %.10f   błąd = %.3e\n", I_trap, abs(I_trap-I_exact));
fprintf("Simpson : %.10f   błąd = %.3e\n", I_simp, abs(I_simp-I_exact));
fprintf("3/8     : %.10f   błąd = %.3e\n", I_38, abs(I_38-I_exact));
fprintf("Boole   : %.10f   błąd = %.3e\n", I_boole, abs(I_boole-I_exact));
