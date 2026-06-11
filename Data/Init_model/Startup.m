%% Project Startup Script
disp('Setting up project environment...');

proj = matlab.project.rootProject;
if isempty(proj)
    warning('This script must be run within an active Simulink Project.');
    return;
end
projectRoot = proj.RootFolder;

cacheFolder = fullfile(projectRoot, 'Cache');
if ~isfolder(cacheFolder) 
    mkdir(cacheFolder);
end

Simulink.fileGenControl('set', ...
    'CacheFolder', cacheFolder, ...
    'CodeGenFolder', cacheFolder, ...
    'createDir', true);


slddFiles = dir(fullfile(projectRoot, '**', '*.sldd'));
if isempty(slddFiles)
    disp(' Warning: .sldd files not found in specified folder');
else
    for i = 1:length(slddFiles)
        dictName = slddFiles(i).name;
        dictFolder = slddFiles(i).folder;
        fullFilePath = fullfile(dictFolder, dictName);
        try
            Simulink.data.dictionary.open(dictName);
        catch ME
            warning('Could not verify dictionary: %s: %s', dictName, ME.message);
        end
    end
end


Param_route = fullfile(projectRoot, 'Data', 'Init_model', 'init_params.m');
if isfile(Param_route)
    run(Param_route);
    disp('Startup completed')
else
    disp('Warning: init_params.m not found');
end
