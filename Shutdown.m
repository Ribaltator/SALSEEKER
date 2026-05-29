%% Project Shutdown Script

try
    defaultConfig = Simulink.fileGenControl('getDefaultConfig');
    Simulink.fileGenControl('setConfig', 'config', defaultConfig);
    disp('    [OK] Paths reset successfully.');
catch ME
    warning('Failed to reset file generation control: %s', ME.message);
end

evalin('base', 'clear variables');
disp('Project successfully shut down!');
