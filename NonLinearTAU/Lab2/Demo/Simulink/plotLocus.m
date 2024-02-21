function plotLocus(xmax, xstep, sysname, subsysname)
% функция построения фазового портрета

load_system(sysname + ".slx"); 
f = waitbar(0,"Plotting locus for " + subsysname + ". Please wait...", ...
    'Name', 'Plotting Locus', ...
    'WindowStyle', 'modal'); % инициализация шкалы прогресса
total_steps = size(-xmax: xstep: xmax, 2).^2 - 1;
current_step = 0;
pl_fig = figure(Name="Phase Space", Visible="off", NumberTitle='off');
hold on;
for i = -xmax: xstep: xmax              % x0
    for j = -xmax: xstep: xmax          % x0_dot
        set_param(sysname + "/x0", Value="[" + string(i) + ", " + ...
            string(j) + "]");
        simout = sim(sysname + ".slx");

        current_step = current_step + 1;
        waitbar(current_step/total_steps,f);
        
        plot(simout.x, simout.x_dot, 'c'); % строим найденное решение
    end
end
set(pl_fig, 'visible', 'on');
delete(f);
save_system(sysname + ".slx");
close_system(sysname + ".slx");

hold off
end