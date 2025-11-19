close all; clear all; clc;

%  CZĘŚĆ 2D: OBRÓT KWADRATU 

P_in_2D = [0 1 1 0 0;
0 0 1 1 0]; 


angle_2D = 135;
theta = angle_2D * pi / 180; % radiany


A_2D = [cos(theta), -sin(theta);
sin(theta), cos(theta)];


P_out_2D = A_2D * P_in_2D;

% 4. Wizualizacja obiektu 2D
figure;
plot(P_in_2D(1,:), P_in_2D(2,:), 'b-o', 'LineWidth', 2); 
hold on;
plot(P_out_2D(1,:), P_out_2D(2,:), 'r-o', 'LineWidth', 2); 
hold off;
axis equal; grid on;
title(['Obrót Kwadratu w 2D o ', num2str(angle_2D), ' stopni']);
legend('Przed obrotem', 'Po obrocie');
xlabel('X'); ylabel('Y');



% CZĘŚĆ 3D: OBRÓT BABIEJ GÓRY 



babiaGora = load('babia_gora.dat');

figure;
plot3(babiaGora(:,1), babiaGora(:,2), babiaGora(:,3), 'b.');
grid on; axis equal; view(3);
title('Babia Góra - dane oryginalne');
xlabel('X'); ylabel('Y'); zlabel('Z');
pause; % Zatrzymanie dla analizy pierwszego wykresu 3D


ax = 90; 
ay = 90; 
az = 180; 

% === Zamiana na radiany ===
ax = ax * pi / 180;
ay = ay * pi / 180;
az = az * pi / 180;

% === Macierze rotacji wokół osi X, Y, Z ===
Rx = [ 1, 0, 0;
0, cos(ax), -sin(ax);
0, sin(ax), cos(ax) ];
Ry = [ cos(ay), 0, sin(ay);
0, 1, 0;
-sin(ay), 0, cos(ay) ];
Rz = [ cos(az), -sin(az), 0;
sin(az), cos(az), 0;
0, 0, 1 ];


R = Rz * Ry * Rx; 


Xrot = (R * babiaGora')'; 


figure;
plot3(Xrot(:,1), Xrot(:,2), Xrot(:,3), 'r.');
grid on; axis equal; view(3);
title('Babia Góra po obrocie: Rz * Ry * Rx');
xlabel('X'); ylabel('Y'); zlabel('Z');