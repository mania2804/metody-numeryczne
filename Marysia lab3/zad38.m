%Odsłanianie Kanarka ---
clear; close all; clc;

file1 = 'elephant.wav';
file2 = 'canary.wav';

try
[s1, Fs1] = audioread(file1);
[s2, Fs2] = audioread(file2);
catch
disp('Błąd wczytywania. Sprawdź nazwy plików.');
return;
end

if Fs1 ~= Fs2
Fs = min(Fs1, Fs2);
s1 = resample(s1, Fs, Fs1);
s2 = resample(s2, Fs, Fs2);
else
Fs = Fs1;
end

len = min(length(s1), length(s2));
s1 = s1(1:len);
s2 = s2(1:len);

x = s1 + s2;

disp('Odtwarzanie oryginalnej sumy...');
sound(x, Fs);
pause(len/Fs + 0.5);

% --- Krok 1: Analiza (y = A * x) ---
N = length(x);
y = fft(x);
f_axis = (0:N-1) * Fs/N;

figure(1);
subplot(2, 1, 1);
plot(f_axis(1:N/2), abs(y(1:N/2)));
title('Widmo Oryginalnej Mieszanki');
xlabel('Częstotliwość (Hz)');
ylabel('Amplituda');
grid on;

% --- Krok 2: Modyfikacja/Zerowanie (Usuwanie Słonia) ---
freq_cutoff = 1000;
k_cutoff = round(freq_cutoff * N / Fs);

y_mod = y;

y_mod(1 : k_cutoff) = 0;
y_mod(N - k_cutoff + 2 : N) = 0;

subplot(2, 1, 2);
plot(f_axis(1:N/2), abs(y_mod(1:N/2)));
title(['Widmo Po Usunięciu Niskich Częstotliwości (Poniżej ', num2str(freq_cutoff), ' Hz)']);
xlabel('Częstotliwość (Hz)');
ylabel('Amplituda');
grid on;

% --- Krok 3: Synteza (s_hat = A^(-1) * y) ---
s_hat = ifft(y_mod);
s_hat = real(s_hat);
s_hat = s_hat / max(abs(s_hat));

disp('Odtwarzanie odsłoniętego kanarka...');
sound(s_hat, Fs);