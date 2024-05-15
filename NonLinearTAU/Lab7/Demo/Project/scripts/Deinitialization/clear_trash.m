% Remove all trash from folder

clearTrash();

function clearTrash()
    all_models = ls('./models/*.slx');
    warning ('off','all');

    for i = 1:size(all_models, 1)
       model_name = strip(all_models(i,:));
       model_name = model_name(1:length(model_name)-4);

       delete(strcat(model_name, '.elf'));
       delete(strcat(model_name, '.slxc'));
       delete(strcat(model_name, '.zip'));

       if isfolder('./slprj')
           rmdir('./slprj', 's');
       end
    end

end