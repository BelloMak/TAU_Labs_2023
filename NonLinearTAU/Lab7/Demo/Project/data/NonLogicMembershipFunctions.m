% Создание нечёткой системы управления
inverted_pendulum = mamfis('Name', 'Inverted Pendulum');

% Добавление входных и выходных переменных к системе
inverted_pendulum = addInput(inverted_pendulum, [-10 10], 'Name', 'PositionError');
inverted_pendulum = addOutput(inverted_pendulum, [-12 12], 'Name', 'ControlVoltage');

% Функции принадлежности для ошибки по положению
inverted_pendulum = addMF(inverted_pendulum, 'PositionError', 'trapmf', [-10 -10 -pi -0.5*pi], 'Name', 'BigNegativeError');
inverted_pendulum = addMF(inverted_pendulum, 'PositionError', 'trimf', [-pi -0.1*pi 0], 'Name', 'NegativeError');
inverted_pendulum = addMF(inverted_pendulum, 'PositionError', 'trimf', [-0.25*pi 0 0.25*pi], 'Name', 'Zero');
inverted_pendulum = addMF(inverted_pendulum, 'PositionError', 'trimf', [0 0.1*pi pi], 'Name', 'PositiveError');
inverted_pendulum = addMF(inverted_pendulum, 'PositionError', 'trapmf', [0.5*pi pi 10 10], 'Name', 'BigPositiveError');

% Функции принадлежности для выходного напряжения
inverted_pendulum = addMF(inverted_pendulum, 'ControlVoltage', 'trimf', [-12 -12 -9], 'Name', 'HighNegativeVoltage');
inverted_pendulum = addMF(inverted_pendulum, 'ControlVoltage', 'trimf', [-9 -8 -5], 'Name', 'NegativeVoltage');
inverted_pendulum = addMF(inverted_pendulum, 'ControlVoltage', 'trimf', [-3.3 0 3.3], 'Name', 'Zero');
inverted_pendulum = addMF(inverted_pendulum, 'ControlVoltage', 'trimf', [5 8 9], 'Name', 'PositiveVoltage');
inverted_pendulum = addMF(inverted_pendulum, 'ControlVoltage', 'trimf', [9 12 12], 'Name', 'HighPositiveVoltage');

% Создание правил управления и добавление их к системе 
inverted_pendulum = addRule(inverted_pendulum, ["If (PositionError is BigNegativeError) then (ControlVoltage is HighPositiveVoltage)", ...
    "If (PositionError is NegativeError) then (ControlVoltage is PositiveVoltage)", ...
    "If (PositionError is Zero) then (ControlVoltage is Zero)", ...
    "If (PositionError is PositiveError) then (ControlVoltage is NegativeVoltage)", ...
    "If (PositionError is BigPositiveError) then (ControlVoltage is HighNegativeVoltage)"]);
