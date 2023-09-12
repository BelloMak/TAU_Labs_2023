clear all
close all

disp('Вывод каждого элемента')
for i = 1:6
    fprintf('%d ', i); % используем функцию fprintf для красивого вывода чисел
end

fprintf('\n%s\n',"Вывод каждого второго элемента") % обязательно писать "" - это строка
for i = 1:2:6                                      
    fprintf('%d ', i); 
end

fprintf('\n%s\n',"Вывод элементов, кратных 3")
for i = 1:30
    if mod(i,3) == 0
        fprintf('%d ', i); 
    end
end

fprintf('\n%s\n',"Вывод элементов, не кратных 3")
for i = 1:30
    if not(mod(i,3) == 0)
        fprintf('%d ', i); 
    end
end

fprintf('\n%s\n',"Вывод элементов, кратных 3 или 5")
for i = 1:30
    if or(mod(i,3) == 0, mod(i,5) == 0) % можно записать mod(i,3) == 0 | mod(i,5) == 0
        fprintf('%d ', i); 
    end
end

fprintf('\n%s\n',"Вывод элементов, кратных 3 и 4")
for i = 1:30
    if and(mod(i,3) == 0, mod(i,4) == 0) % можно записать mod(i,3) == 0 & mod(i,4) == 0
        fprintf('%d ', i); 
    end
end