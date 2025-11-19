%z712

%% Gauss-Legendre 2-punktowy: calka cos(t) na [-pi/2, pi/2]

a = -pi/2;
b =  pi/2;

% Wezly i wagi 2-punktowe na [-1,1]
xg = [-1/sqrt(3), 1/sqrt(3)];
wg = [1, 1];

% Skalowanie wedlug t = (a+b)/2 + (b-a)/2 * x
t = (a+b)/2 + (b-a)/2 * xg;

% Obliczenie calki:  I ≈ (b-a)/2 * sum( w_i * f(t_i) )
I2 = (b-a)/2 * sum( wg .* cos(t) );

fprintf("Calkowanie 2-punktowe: cos(t) na [-pi/2,pi/2]\n");
fprintf("Wynik = %.10f, blad = %.3e\n\n", I2, abs(I2 - 2));

%% Gauss-Legendre 3-punktowy: calka cos(t) na [-pi/2, pi/2]

a = -pi/2;
b =  pi/2;

% Wezly i wagi 3-punktowe na [-1,1]
xg = [0,  sqrt(3/5), -sqrt(3/5)];
wg = [8/9, 5/9, 5/9];

% Skalowanie
t = (a+b)/2 + (b-a)/2 * xg;

% Calkowanie
I3 = (b-a)/2 * sum( wg .* cos(t) );

fprintf("Calkowanie 3-punktowe: cos(t) na [-pi/2,pi/2]\n");
fprintf("Wynik = %.10f, blad = %.3e\n\n", I3, abs(I3 - 2));


%% Gauss-Legendre 2-punktowy: calka sin(t) na [0, pi]

a = 0;
b = pi;

% Wezly i wagi
xg = [-1/sqrt(3), 1/sqrt(3)];
wg = [1, 1];

% Skalowanie do [0, pi]
t = (a+b)/2 + (b-a)/2 * xg;

% Calkowanie
I2 = (b-a)/2 * sum( wg .* sin(t) );

fprintf("Calkowanie 2-punktowe: sin(t) na [0,pi]\n");
fprintf("Wynik = %.10f, blad = %.3e\n\n", I2, abs(I2 - 2));



%% Gauss-Legendre 3-punktowy: calka sin(t) na [0, pi]

a = 0;
b = pi;

% Wezly i wagi 3-punktowe
xg = [0,  sqrt(3/5), -sqrt(3/5)];
wg = [8/9, 5/9, 5/9];

% Skalowanie do [0, pi]
t = (a+b)/2 + (b-a)/2 * xg;

% Calkowanie
I3 = (b-a)/2 * sum( wg .* sin(t) );

fprintf("Calkowanie 3-punktowe: sin(t) na [0,pi]\n");
fprintf("Wynik = %.10f, blad = %.3e\n\n", I3, abs(I3 - 2));
