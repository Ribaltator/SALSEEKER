clear all
%% Environment

dictObj     = Simulink.data.dictionary.open('Environment_data.sldd');
dSection    = getSection(dictObj, 'Design Data');

e_vel_wind      = 0;
e_theta_wind    = 0;

assignin(dSection, 'e_vel_wind', e_vel_wind);
assignin(dSection, 'e_theta_wind', e_theta_wind);
saveChanges(dictObj);

%% Aerodynamics

dictObj     = Simulink.data.dictionary.open('Aerodynamic_data.sldd');
dSection    = getSection(dictObj, 'Design Data');

a_coef_drag     = 0.4;
a_surface_ref   = 0.00385;

assignin(dSection, 'a_coef_drag', a_coef_drag);
assignin(dSection, 'a_surface_ref', a_surface_ref);
saveChanges(dictObj);

%% Missile

dictObj     = Simulink.data.dictionary.open('Main_data.sldd');
dSection    = getSection(dictObj, 'Design Data');

m_mass          = 15.8;
m_pos_init      = [0; 0; 0];%  Up is -Z
m_vel_init      = 250;
m_angle_init    = [0; pi/6; 0];

assignin(dSection, 'm_mass', m_mass);
assignin(dSection, 'm_pos_init', m_pos_init);
assignin(dSection, 'm_vel_init', m_vel_init);
assignin(dSection, 'm_angle_init', m_angle_init);
saveChanges(dictObj);

%% Control

dictObj=Simulink.data.dictionary.open('Control_data.sldd');
dSection=getSection(dictObj, 'Design Data');

Control_phasing_power_threshold     = 22e-4;
Phasing_switch                      = 0;% 0 for deactivated; 1 for activated.
Control_switch                      = 1;% 0 for No control; 1 for Pure Pursuit; 2 for Proportional Guidance.
Pure_Pursuit_Z_Gain                 = 4000;% Only for Pure Pursuit.
Pure_Pursuit_Y_Gain                 = 0;% Only for Pure Pursuit.
Pure_Pursuit_Centered_angle_Z       = 0.087;% Only for Pure Pursuit.
Ref_speed                           = 250;% Only for Proportional Guidance.
Nav_constant                        = 3;% Only for Proportional Guidance without Dynamic Navigation constant.
Dynamic_Navigation_constant         = 0;% Only for Proportional Guidance: 0 for deactivated; 1 for activated.
Dynamic_Nav_Gain                    = 0.40;% Only for Proportional Guidance with Dynamic Navigation constant.
Control_saturation_power_threshold  = 0.2;
Control_Force_Limit                 = 2000;

assignin(dSection, 'Control_phasing_power_threshold', Control_phasing_power_threshold);
assignin(dSection, 'Phasing_switch', Phasing_switch);
assignin(dSection, 'Control_switch', Control_switch);
assignin(dSection, 'Pure_Pursuit_Z_Gain', Pure_Pursuit_Z_Gain);
assignin(dSection, 'Pure_Pursuit_Y_Gain', Pure_Pursuit_Y_Gain);
assignin(dSection, 'Pure_Pursuit_Centered_angle_Z', Pure_Pursuit_Centered_angle_Z);
assignin(dSection, 'Ref_speed', Ref_speed);
assignin(dSection, 'Nav_constant', Nav_constant);
assignin(dSection, 'Dynamic_Navigation_constant', Dynamic_Navigation_constant);
assignin(dSection, 'Dynamic_Nav_Gain', Dynamic_Nav_Gain);
assignin(dSection, 'Control_saturation_power_threshold', Control_saturation_power_threshold);
assignin(dSection, 'Control_Force_Limit', Control_Force_Limit);

saveChanges(dictObj);

%% Seeker

dictObj=Simulink.data.dictionary.open('Seeker_detect_data.sldd');
dSection=getSection(dictObj, 'Design Data');

s_fov                        = 0.2618;
s_aperture_diameter          = 0.05;
s_efficiency                 = 0.85;
s_energy_threshold           = 2.5e-4;
s_focal_distance             = 0.05;
s_defocus                    = 0.005;

assignin(dSection, 's_fov', s_fov);
assignin(dSection, 's_aperture_diameter', s_aperture_diameter);
assignin(dSection, 's_efficiency', s_efficiency);
assignin(dSection, 's_energy_threshold', s_energy_threshold);
assignin(dSection, 's_focal_distance', s_focal_distance);
assignin(dSection, 's_defocus', s_defocus);

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

t_geo        = [4200;0;1.15];
t_rotation   = 0;
t_velocity   = [20;0;0];
t_size       = [2.3,6.4,2.3];
t_reflect    = [0.4 0.4 0.4 0.4 0.4 0.4];

assignin(dSection, 't_geo', t_geo);
assignin(dSection, 't_rotation', t_rotation);
assignin(dSection, 't_velocity', t_velocity);
assignin(dSection, 't_size', t_size);
assignin(dSection, 't_reflect', t_reflect);
saveChanges(dictObj);

%% Designator

dictObj     = Simulink.data.dictionary.open('Designator_Sim_data.sldd');
dSection    = getSection(dictObj, 'Design Data');

d_geo                = [0; 0; 1.15];
d_raycount           = 10000;
d_divergence         = 0.0003;
d_pulse_energy       = 80e-3;
d_pulse_frequency    = 10;
d_pulse_duration     = 15e-9;
d_efficiency         = 0.95;
d_h_error            = 0;
d_v_error            = 0;
sal_atmos_coef       = 0.0000581;

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


