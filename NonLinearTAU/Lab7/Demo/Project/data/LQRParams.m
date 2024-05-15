DemoControllers.LQRParams.g = 9.81;
DemoControllers.LQRParams.J = DemoControllers.Pendulum.Stick.Mass*DemoControllers.Pendulum.Stick.Length^2/4 + DemoControllers.Pendulum.Load.Mass*DemoControllers.Pendulum.Stick.Length^2 + ...
    DemoControllers.Reductor.J + DemoControllers.DCMotor.J*DemoControllers.Reductor.i^2;
DemoControllers.LQRParams.A = [0,     1,      0;
    DemoControllers.LQRParams.g*DemoControllers.Pendulum.Stick.Length*(DemoControllers.Pendulum.Load.Mass + DemoControllers.Pendulum.Stick.Mass/2)/DemoControllers.LQRParams.J, ...
    0, DemoControllers.Reductor.i*DemoControllers.DCMotor.Km/DemoControllers.LQRParams.J;
    0, -DemoControllers.DCMotor.Kw*DemoControllers.Reductor.i/DemoControllers.DCMotor.L, -DemoControllers.DCMotor.R/DemoControllers.DCMotor.L];
DemoControllers.LQRParams.B = [0; 0; 1/DemoControllers.DCMotor.L];
DemoControllers.LQRParams.C = [1, 0, 0];
DemoControllers.LQRParams.D = [0, 0, 0];

DemoControllers.LQRParams.Q = 25*DemoControllers.LQRParams.C'*DemoControllers.LQRParams.C;
DemoControllers.LQRParams.R = 1;

[DemoControllers.LQRParams.K,DemoControllers.LQRParams.S,DemoControllers.LQRParams.P] = lqr(DemoControllers.LQRParams.A,DemoControllers.LQRParams.B,DemoControllers.LQRParams.Q,DemoControllers.LQRParams.R);