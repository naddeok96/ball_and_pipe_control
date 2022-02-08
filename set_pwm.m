function action = set_pwm(device, pwm_value)
%% Sets the PWM of the fan
% Inputs:
%  ~ device: serialport object controlling the real world system
%  ~ pwm_value: A value from 0 to 4095 to set the pulse width modulation of
%  the actuator
% Outputs:
%  ~ action: the control action to change the PWM
%
% Created by:  Kyle Naddeo 1/3/2022
% Modified by: Patrick O'Rourke 2/1/2022

%% Force PWM value to be valid
pwm_value ;
x= max(min(pwm_value,4095),0);
pwm=string(x);


%% Send Command
action = write(pwm);
% string value of pwm_value
% use the serialport() command options to change the PWM value to action

end
