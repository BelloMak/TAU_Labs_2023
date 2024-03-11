clear all;
close all;
clc;

params.g = 9.81;
params.R = 1;
params.m = 1;
x0 = [params.R; 0; 0; 1 * sqrt(params.g / params.R *(2 + sqrt(3)))];

dxdt = @(t, x) get_grad(x, params);

[t, x] = ode23t(dxdt, [0, 5], x0, odeset('MaxStep', 1e-5));

x_coord =  x(:, 1) .* sin(x(:, 2));
y_coord = -x(:, 1) .* cos(x(:, 2));
V_x = x(:, 3) .* sin(x(:, 2)) + x(:, 1) .* cos(x(:, 2)) .* x(:, 4);
V_y = -x(:, 3) .* cos(x(:, 2)) + x(:, 1) .* sin(x(:, 2)) .* x(:, 4);
F = get_react(x', params);

figure("Name", "Trajectory");
grid on;
plot(x_coord, y_coord, 'LineWidth',2, 'Color','r');
circle(0, 0, params.R);

figure("Name", "Coordinates");
hold on;
legend;
plot(t, x_coord, 'DisplayName','x(t)');
plot(t, y_coord, 'DisplayName','y(t)');
plot(t, x(:, 1), 'DisplayName', 'r(t)');
hold off;

figure("Name", "Velocities");
hold on;
legend;
plot(t, V_x, 'DisplayName', 'Vx(t)');
plot(t, V_y, 'DisplayName', 'Vy(t)');
hold off;

function dxdt = get_grad(x, params)
EPS = 1e-6;
dxdt = zeros(4, 1);
dxdt(1) = x(3);
dxdt(2) = x(4);
dxdt(3) = x(1) .* x(4).^2 + params.g * cos(x(2)) - ...
    get_react(x, params) ./ params.m;
dxdt(4) = (-2 * x(3) .* x(4) - params.g .* sin(x(2))) ./ (x(1) + EPS);
end

function F = get_react(x, params)
% Calculate the reaction force
% F = mR x_4^2 + mg cos(x_2)
F = params.m .* (params.R .* x(4,:).^2 + params.g .* cos(x(2,:)));
F(F < 0 | x(1,:) < params.R) = 0;
end

function h = circle(x,y,r)
hold on
th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
h = plot(xunit, yunit, 'Color', 'b', 'LineStyle','-.');
hold off
end