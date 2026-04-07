% shutdown.m - Limpieza del entorno al cerrar el proyecto
disp('Cerrando el proyecto y limpiando el entorno...');

% 1. Restaurar la configuración de caché de Simulink por defecto
% Esto es crucial para no ensuciar otros proyectos que abras después
try
    Simulink.fileGenControl('reset');
    disp('- Caché de Simulink restaurada a sus valores por defecto.');
catch ME
    warning('No se pudo restaurar la configuración de Simulink: %s', ME.message);
end

% 2. Eliminar las rutas del proyecto del Path de MATLAB
% Obtenemos la ruta donde está este script (la raíz del proyecto)
projectRoot = fileparts(mfilename('fullpath'));

% Quitamos todo el proyecto del path
rmpath(genpath(projectRoot));
disp('- Rutas del proyecto eliminadas del Path de MATLAB.');

% 3. Limpiar variables del Workspace base (opcional, pero recomendado)
evalin('base', 'clear all');
disp('- Workspace limpiado.');

disp('¡Proyecto cerrado correctamente!');