function [bounded]= set_pwm(device, pwm_value)
%% Sets the PWM of the fan
% Inputs:
%device= "COM5"; %serialport object controlling the real world system
%pwm_value= 0; % A value from 0 to 4095 to set the pulse width modulation of
%  the actuator
% Outputs:
%  ~ action: the control action to change the PWM


% Created by:  Kyle Naddeo 1/3/2022
% Modified by: Patrick O'Rourke 2/1/2022
=======
% Created by:  Kyle Naddeo 2/4/2022
% Modified by: Patrick ORourke, Thomas Stanek, Daniel Millar and 4/19/2022



%% Force PWM value to be valid
bounded= max(min(pwm_value,4095),0);
action = strcat("P", sprintf("%04.f",bounded));

%% Send Command
write(device,action ,"string");

end
