function [value, isterminal, direction] = outOfBounds(t, z, xymax) 
% функция детекции выхода за пределы сетки

value = (abs(z(1,1)) > xymax) || (abs(z(2,1)) > xymax); % --- условие
isterminal = 1; % --- остановить симуляцию
% direction --- параметр, отвечающий за направление перескока через
direction = 0; % --- параметр, который нам не интересен, но необходим
end