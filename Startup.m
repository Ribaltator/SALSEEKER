% startup.m - Configuración del entorno del proyecto MATLAB/Simulink
disp('Iniciando entorno del proyecto...');

% 1. Definir la ruta raíz del proyecto (donde está este archivo)
projectRoot = fileparts(mfilename('fullpath'));
cd(projectRoot); % Asegurar que estamos en el directorio raíz

% 2. Configurar la carpeta "cache" para los archivos de Simulink
cacheFolder = fullfile(projectRoot, 'cache');

% Crear la carpeta si no existe
if ~exist(cacheFolder, 'dir')
    mkdir(cacheFolder);
end

% Redirigir todos los archivos temporales y de compilación de Simulink
Simulink.fileGenControl('set', ...
    'CacheFolder', cacheFolder, ...
    'CodeGenFolder', cacheFolder, ...
    'createDir', true);

disp('- Archivos temporales de Simulink redirigidos a /cache');

% 3. Añadir el proyecto al Path de MATLAB de forma inteligente
% genpath genera las rutas de todas las subcarpetas
p = genpath(projectRoot);

% Añadimos todo al path temporalmente
addpath(p);

% 4. Limpiar el Path (MUY IMPORTANTE)
% No queremos que MATLAB busque funciones dentro de la caché, ni en carpetas ocultas
carpetasIgnoradas = {'.git', 'cache', fullfile('data', 'raw')};

for i = 1:length(carpetasIgnoradas)
    rutaIgnorada = fullfile(projectRoot, carpetasIgnoradas{i});
    if exist(rutaIgnorada, 'dir')
        rmpath(genpath(rutaIgnorada)); % Elimina la carpeta y sus subcarpetas del path
    end
end

disp('- Rutas configuradas correctamente (ignorando /cache y datos crudos).');
disp('¡Entorno listo para trabajar!');