DemoControllers.DCMotor.R = 8.5;        % Omh, Сопротивление якоря ДПТ
DemoControllers.DCMotor.L = 300e-6;     % H, индуктивность обмоток ДПТ
DemoControllers.DCMotor.Km = 0.027;     % N*m/A, коэффициент передачи по моменту
DemoControllers.DCMotor.Kw = 0.0027;    % V/(rad/s), коэффициент передачи по скорости
DemoControllers.DCMotor.J = 500e-9;     % kg*m^2, момент инерции двигателя

DemoControllers.Reductor.J = 750e-9;    % kg*m^2, момент инерции первого редуктора
DemoControllers.Reductor.i = 220;       % kg*m^2, передаточное отношение первого редуктора

DemoControllers.Pendulum.Stick.Length = 60;     % cm, длина стержня маятника
DemoControllers.Pendulum.Stick.Mass = 0.1;        % kg, масса стержня маятника
DemoControllers.Pendulum.Load.Mass = 1;         % kg, масса груза



