% matrix_splot_modified.m
% Zadanie 3.4 - Odzyskiwanie danych wejściowych z wyjścia układów liniowych
% opisywanych funkcją splotu

clear all; close all; clc;

%% === Parametry układu ===
M = 4; % liczba wag systemu (kanału)
w = [0.3 0.7 0.5 0.2]; % ustalone (zdeterminowane) wagi układu
N = M + (M - 1); % długość sygnału pilota

%% === Sygnał pilota ===
% zamiast losowego rand() - sygnał deterministyczny np. sekwencja binarna
p = [1 -1 1 -1 1 -1 1]; % sygnał testowy / identyfikujący

% odpowiedź układu (splot pilota z wagami)
y = conv(p, w);

%% === Estymacja wag układu ===
for m = 0:M-1
P(1+m, 1:M) = p(M+m:-1:1+m);
end
y_trim = y(M:M+M-1); % fragment sygnału wyjściowego potrzebny do estymacji
west = inv(P) * y_trim'; % estymowane wagi

%% === Wyświetlenie wyników estymacji ===
disp('--- Estymacja wag układu ---');
disp(['Prawdziwe wagi: ', num2str(w)]);
disp(['Estymowane wagi: ', num2str(west')]);
disp(['Błąd estymacji: ', num2str(w - west')]);

%% === Odzyskiwanie danych wejściowych ===
x = [1 0 1 1]; % dane wejściowe do przesłania (deterministyczne)
y2 = conv(x, w); % wyjście układu (znane)

W = zeros(M, M); % inicjalizacja macierzy
for m = 0:M-1
W(1+m, 1:M-m) = w(1:M-m);
end
y2_trim = y2(1:M); % przycinamy do długości M

xest = inv(W) * y2_trim'; % odzyskane dane wejściowe
xerr = x' - xest; % błąd rekonstrukcji

%% === Wyniki odzyskiwania danych ===
disp(' ');
disp('--- Odzyskiwanie danych wejściowych ---');
disp(['Dane oryginalne: ', num2str(x)]);
disp(['Dane odzyskane: ', num2str(xest')]);
disp(['Błąd rekonstrukcji: ', num2str(xerr')]);