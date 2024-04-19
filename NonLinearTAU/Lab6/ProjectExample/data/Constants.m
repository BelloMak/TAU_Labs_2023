%% DC Motor
% ДБУ 20-3.7-9-24 ГИ
ProjectExample.DCMotor.L_mot = 350e-6;
ProjectExample.DCMotor.R_mot = 10;
ProjectExample.DCMotor.Km_mot = 0.016;
ProjectExample.DCMotor.Kw_mot = 0.016;
ProjectExample.DCMotor.b_mot = 0.001;
ProjectExample.DCMotor.J_mot = 500e-9;

%% Reductor

ProjectExample.Reductor.i_red = 100;
ProjectExample.Reductor.b_red = 0.001;
ProjectExample.Reductor.J_red = 2.4e-6;


%% Current Sensor

ProjectExample.CurrentSensor.Rs = 0.001;

%% Rack and Pinion

ProjectExample.RackAndPinion.i_rack = 20;
ProjectExample.RackAndPinion.J_rack_wheel = 1e-6;
ProjectExample.RackAndPinion.b_rack = 0.001;
ProjectExample.RackAndPinion.m_rack = 0.1;

%% Power Gain

ProjectExample.PowerGain.T_power = 1e-6;
ProjectExample.PowerGain.K_power = 24 / 3.3;

%% Hall sensor

ProjectExample.HallSensor.Hall_speed_coef = 1;
ProjectExample.HallSensor.Hall_angle_coef = 1;

%% HighLevel Regulator

ProjectExample.HighLevelRegulator.pidKi = 0.1;
ProjectExample.HighLevelRegulator.pidKp = 6000;
ProjectExample.HighLevelRegulator.pidKd = 0.001;
