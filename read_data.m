function [distance,manual_pwm,target,deadpan] = read_data(device)
%% Reads data sent back from Ball and Pipe system
% Inputs:
%  ~ device: serialport object controlling the real world system
% Outputs:
%  ~ distance: the IR reading from the time of flight sensor
%  ~ pwm: the PWM from the manual knob of the system (NOT THE SAME AS THE
%  PWM YOU MAY SET THROUGH SERIAL COMMUNICATION)
%  ~ target: the desired height of the ball set by the manual knob of the
%  system
%  ~ deadpan: the time delay after an action set by the manual knob of the
%  system
%
% Created by:  Kyle Naddeo 1/3/2022
% Modified by: Patrick ORourke, Thomas Stanek, Daniel Millar and 4/19/2022

%% Ask nicely for data
write(device,"H","string")
write(device,"S","string")


%% Read data
% use the serialport() command options to read the response
data = read(device,20,"string");

%% Translate
% translate the response to 4 doubles using str2double() and
% extractBetween() (Hint: the response is in the spec sheet)
distance1   = extractBetween(data, 2, 5);
distance    = str2double(distance1);
manual_pwm1 = extractBetween(data, 7, 10);
manual_pwm  = str2double(manual_pwm1);
target1     =  extractBetween(data, 12, 15);
target      = str2double(target1);
deadpan1    =  extractBetween(data, 17, 20);
deadpan     = str2double(deadpan1);

end
