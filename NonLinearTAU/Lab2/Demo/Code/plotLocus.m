function plotLocus(x1, x2, dx, event_fnc, tmax)
% функция построения фазовых траекторий
figure;
hold on;
tspan = [0, tmax]; % отрезок времени, на котором моделируем

for i = x1(1, :)
    for j = transpose(x2(:, 1))
        x0 = [i; j];  
        [~, z, ~, ~, ~] = ode23t(dx, tspan, x0, odeset('RelTol',1e-3,...
            'Events', event_fnc)); % задаем параметры солвера
        plot(z(:, 1), z(:, 2), 'c'); % строим найденное решение
    end
end
hold off
end