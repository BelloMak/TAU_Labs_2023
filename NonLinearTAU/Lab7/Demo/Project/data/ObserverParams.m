DemoControllers.Observer.g = 9.81;

DemoControllers.Observer.J = DemoControllers.Pendulum.Stick.Mass*DemoControllers.Pendulum.Stick.Length^2/4 + DemoControllers.Pendulum.Load.Mass*DemoControllers.Pendulum.Stick.Length^2 + ...
    DemoControllers.Reductor.J + DemoControllers.DCMotor.J*DemoControllers.Reductor.i^2;

DemoControllers.Observer.A = [0,     1,      0;
    DemoControllers.Observer.g*DemoControllers.Pendulum.Stick.Length*(DemoControllers.Pendulum.Load.Mass + DemoControllers.Pendulum.Stick.Mass/2)/DemoControllers.Observer.J, ...
    0, DemoControllers.Reductor.i*DemoControllers.DCMotor.Km/DemoControllers.Observer.J;
    0, -DemoControllers.DCMotor.Kw*DemoControllers.Reductor.i/DemoControllers.DCMotor.L, -DemoControllers.DCMotor.R/DemoControllers.DCMotor.L];

DemoControllers.Observer.B = [0; 0; 1/DemoControllers.DCMotor.L];

DemoControllers.Observer.C = [1, 0, 0];

DemoControllers.Observer.D = [0, 0, 0];

DemoControllers.Observer.L = [100; 500; 10000];

%eig(DemoControllers.Observer.A - [DemoControllers.Observer.L, zeros(3, 2)]);