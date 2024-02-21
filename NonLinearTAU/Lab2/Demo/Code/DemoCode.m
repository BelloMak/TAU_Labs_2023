clc;
clear all;
close all;

tic;                        % запуск секундомера

XMAX = 5;                   % размер сетки рисования
STEP = 0.5;                 % шаг сетки
TMAX = 10;                  % время моделирования
BETA = 0.3;                 % коэффициент вязкого трения

[x1, x2] = meshgrid(-XMAX: STEP: XMAX);

dx = @(t, x) pendulumGrad(t, x, BETA);
event_out_of_bounds = @(t, z) outOfBounds(t, z, XMAX+0.01);

plotLocus(x1, x2, dx, event_out_of_bounds, TMAX); % строим фазовые траектории
plotQuiver(x1, x2, dx); % строим стрелочки

toc; tic; % остановка  и запуск секундомера

plotLocus(x1, x2, @vanderpolGrad, event_out_of_bounds, TMAX); % строим фазовые траектории
plotQuiver(x1, x2, @vanderpolGrad); % строим стрелочки

toc;  % остановка секундомера

%% определение пользовательских функций

function dxdt = pendulumGrad(t,x,BETA)
% функция, возвращающая градиент 
% в ней необходимо задать уравнения системы

dxdt(1, :) = x(2, :);
dxdt(2, :) = -sin(x(1, :)) - BETA * x(2, :);
end

function dxdt = vanderpolGrad(t, x)
% функция, возвращающая градиент
% в ней необходимо задать уравнения системы
dxdt(1, :) = x(2, :);
dxdt(2, :) = -x(1, :) + 0.5 * (1 - x(1, :) .^ 2) .*x(2, :);
end



