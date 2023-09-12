% plot_bounces.m --- plots ball simulation variables
% :t --- time, s
% :z --- state variables

function [] = plot_bounces(t, z)

% Учимся работать с figure командами

%Создает figure с именем "XY Plot" и делает его активным
figure('Name','XY plot');
% Построить график z(2,:) == y от z(1,:) == x, дать название получившейся
% линии y(x)
plot(z(:,1), z(:,2),"DisplayName","y(x)"); 
% Задать подписи осей
xlabel("x, m");
ylabel("y, m");
% Задать название графика
title("Trajectory");
% Отобразить легенду
legend;
% Включить сетку
grid on;


% Учимся рисовать несколько графиков в одной figure на разных осях
figure('Name','Coordinates and velocities');
% Разбить figure на сетку размером 2х1 и выбрать активными оси с номером 1
subplot(2,1,1);
% Далее все настройки касаются только активных осей
hold on;

% Строим график x(t) штрихпунктирной линией
plot(t, z(:,1),"DisplayName","x(t)","LineStyle","-.");

% Строим график y(t) сплошной линией
plot(t, z(:,2),"DisplayName","y(t)");

xlabel("time, s");
ylabel("meters");
title("Coordinates");
grid on;
legend;

% Делаем активными оси figure с номером 2
subplot(2,1,2);
hold on;
% Строим график Vx(t) черной линией
plot(t, z(:,3),"DisplayName","Vx(t)","Color","black");
% Строим график Vy(t) линией цвета RGB == 101 (purple)
plot(t, z(:,4),"DisplayName","Vy(t)","Color",[1 0 1]);
xlabel("time, s");
ylabel("m/s");
title("Velocities");
grid on;
legend;

hold off;

% Ссылка на полную документацию на plot()
% https://www.mathworks.com/help/matlab/ref/plot.html?searchHighlight=plotting%20style&s_tid=srchtitle_support_results_1_plotting%20style#btzitot_sep_mw_3a76f056-2882-44d7-8e73-c695c0c54ca8
end