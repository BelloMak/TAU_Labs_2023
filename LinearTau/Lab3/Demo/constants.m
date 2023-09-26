close all;
clear all;

%%%%%%%%%%%%% Constants for bouncer %%%%%%%%%%%%%%
ALPHA = 75; % deg, taking off angle of the ball
V = 10; % m/s, taking off velocity 
BETA = 0.8; % velocity dissipation coefficient
GAMMA = 0.5; % 1/s, damping coefficient
N_BOUNCES = 10; % number of bounces to plot

%%%%%%%%%%%%% Constants for oscillator %%%%%%%%%%%%%%

m = 1; % кг
alpha = 0.1; % коэф-т вязкого трения кг/с
k = 10; % Н/м
F_max = 5; % максимальная сила сухого трения Н
v_0 = 20; % м/с
x_0 = 1; % м