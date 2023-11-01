clc
clear all
close all
Rwheel = 0.05; % m
Tr = 0.1; % m
Jsum = 0.4; % kg*m^2
R = 10; % Om
L = 650e-6; % H
Km = 0.17;
Komega = 0.17;

A = [0, 0, 1, 0;
     0, 0, 0, 1;
    -Km*Komega/(L*Jsum), 0, -R/L, 0;
    0, -Km*Komega/(L*Jsum), 0, -R/L];

B = [0, 0;
     0, 0;
    Rwheel*Km/(L*Jsum), 0;
    0, Rwheel*Km/(L*Jsum)];

C = [1/2, 1/2, 0, 0;
    -1/Tr, 1/Tr, 0, 0];

D = [0, 0;
     0, 0];

% Поиск матрица управляемости и наблюдаемости вручную
Q_y = [B, A*B, A^2*B, A^3*B]
Q_n = [C; C*A; C*A^2; C*A^3]
rank(Q_y)
rank(Q_n)

% Методами матлаба
Q_y_2 = ctrb(A,B)
Q_n_2 = obsv(A,C)
rank(Q_y)
rank(Q_n)

%% Запуск модели из матлаба
out = sim("StateSpaceModelDemo",15); % подробные настройки для sim можно найти на сайте mathworks

% Построим график х(t) и y(t)
plot(out.logsout{3});

% Построение траектории
figure
plot(out.x_out, out.y_out);
axis equal
