function simInitSet(tmax, sysname, subsysname)
% функция инициализации параметров моделирования

arguments
    tmax (1,1) double;
    sysname (1,1) string;
    subsysname (1,1) string = "None";
end

load_system(sysname + ".slx");
configSet = getActiveConfigSet(sysname);
set_param(configSet, 'StopTime', string(tmax));
if subsysname ~= "None"
    set_param(sysname + "/TestSubject","ReferencedSubsystem", subsysname);
end
save_system(sysname + ".slx");
end