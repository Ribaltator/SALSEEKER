clear all
%% Environment

dictObj     = Simulink.data.dictionary.open('Environment_data.sldd');
dSection    = getSection(dictObj, 'Design Data');

e_vel_wind      = 0;
e_theta_wind    = 90;

assignin(dSection, 'e_vel_wind', e_vel_wind);
assignin(dSection, 'e_theta_wind', e_theta_wind);
saveChanges(dictObj);

%% Aerodynamics

dictObj     = Simulink.data.dictionary.open('Aerodynamic_data.sldd');
dSection    = getSection(dictObj, 'Design Data');

a_coef_body     = [0.2 0 0 0 0 0];
a_cg            = [0 0 0];
a_cp            = [0 0 0];
a_surface_ref   = pi*0.1^2;
a_span_ref      = 0;
a_length_ref    = 0.5;

assignin(dSection, 'a_coef_body', a_coef_body);
assignin(dSection, 'a_cg', a_cg);
assignin(dSection, 'a_cp', a_cp);
assignin(dSection, 'a_surface_ref', a_surface_ref);
assignin(dSection, 'a_span_ref', a_span_ref);
assignin(dSection, 'a_length_ref', a_length_ref);
saveChanges(dictObj);

%% Missile

dictObj     = Simulink.data.dictionary.open('Main_data.sldd');
dSection    = getSection(dictObj, 'Design Data');

m_mass          = 8;
m_pos_init      = [0; 0; 0];
m_vel_init      = [300; 0; 0];
m_angle_init    = [0; pi/8; 0];

assignin(dSection, 'm_mass', m_mass);
assignin(dSection, 'm_pos_init', m_pos_init);
assignin(dSection, 'm_vel_init', m_vel_init);
assignin(dSection, 'm_angle_init', m_angle_init);
saveChanges(dictObj);

%% Control

dictObj=Simulink.data.dictionary.open('Control_data.sldd');
dSection=getSection(dictObj, 'Design Data');

impact_angle        = pi/4;
Control_switch      = 1;% 0 for Pure Pursuit; 1 for Proportional Guidance.
Navigation_constant = 3;% Only for Proportional Guidance.
Approach_velocity   = 250;% Only for Proportional Guidance.

assignin(dSection, 'impact_angle', impact_angle);
assignin(dSection, 'Control_switch', Control_switch);
assignin(dSection, 'Navigation_constant', Navigation_constant);
assignin(dSection, 'Approach_velocity', Approach_velocity);

saveChanges(dictObj);

%% Seeker

dictObj=Simulink.data.dictionary.open('Seeker_detect_data.sldd');
dSection=getSection(dictObj, 'Design Data');

s_geo                        = [0;0;100];
s_fov                        = pi/18;
s_aperture_diameter          = 0.06;
s_efficiency                 = 0.95;
s_energy_threshold           = 10e-5;
% s_background               = 0.01;
% s_signalnoise_threshold    = 7;

assignin(dSection, 's_geo', s_geo);
assignin(dSection, 's_fov', s_fov);
assignin(dSection, 's_aperture_diameter', s_aperture_diameter);
assignin(dSection, 's_efficiency', s_efficiency);
assignin(dSection, 's_energy_threshold', s_energy_threshold);

saveChanges(dictObj);

%% Gimbal

dictObj=Simulink.data.dictionary.open('Gimbal_data.sldd');
dSection=getSection(dictObj, 'Design Data');

s_gimbal_angles          = [0 0];

assignin(dSection, 's_gimbal_angles', s_gimbal_angles);
saveChanges(dictObj);

%% Target

dictObj     = Simulink.data.dictionary.open('Target_Sim_data.sldd');
dSection    = getSection(dictObj, 'Design Data');

t_geo        = [3000,0,0];
t_rotation   = 0;
t_size       = [4,2,2];
t_reflect    = [0.4 0.4 0.4 0.4 0.4 0.4];

assignin(dSection, 't_geo', t_geo);
assignin(dSection, 't_rotation', t_rotation);
assignin(dSection, 't_size', t_size);
assignin(dSection, 't_reflect', t_reflect);
saveChanges(dictObj);

%% Designator

dictObj     = Simulink.data.dictionary.open('Designator_Sim_data.sldd');
dSection    = getSection(dictObj, 'Design Data');

d_geo                = [0; 0; 0];
d_raycount           = 10000;
d_divergence         = 3e-4;
d_pulse_energy       = 80e-3;
d_pulse_frequency    = 10;
d_pulse_duration     = 15e-9;
d_efficiency         = 0.95;
d_h_error            = randn(1)*1e-4;
d_v_error            = randn(1)*1e-4;
sal_atmos_coef  = 0.0001;

assignin(dSection, 'd_geo', d_geo);
assignin(dSection, 'd_raycount', d_raycount);
assignin(dSection, 'd_divergence', d_divergence);
assignin(dSection, 'd_pulse_energy', d_pulse_energy);
assignin(dSection, 'd_pulse_frequency', d_pulse_frequency);
assignin(dSection, 'd_pulse_duration', d_pulse_duration);
assignin(dSection, 'd_efficiency', d_efficiency);
assignin(dSection, 'd_h_error', d_h_error);
assignin(dSection, 'd_v_error', d_v_error);
assignin(dSection, 'sal_atmos_coef', sal_atmos_coef);
saveChanges(dictObj);


% v=t_geo-s_geo;
% d=sqrt(v(1)^2+v(2)^2);
% az=atan2(v(2),v(1));
% el=atan2(v(3),d);
% ang_id=[az el];
% 
