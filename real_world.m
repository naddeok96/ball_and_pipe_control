% A MATLAB script to control Rowans Systems & Control Floating Ball 
% Apparatus designed by Mario Leone, Karl Dyer and Michelle Frolio. 
% The current control system is a PID controller.
%
% Created by Kyle Naddeo, Mon Jan 3 11:19:49 EST 
% Modified by YOUR NAME AND DATE

%% Start fresh
close all; clc; 

%% Connect to device
clear device;
device = serialport('COM5', 19200);

%% Parameters
target      = 0.5;   % Desired height of the ball [m]
sample_rate = 0.25;  % Amount of time between controll actions [s]

%% Give an initial burst to lift ball and keep in air
set_pwm(device, 5000)
pause(5)
[ir,~,~,~] = read_data(device);
%waitbar(5)
set_pwm(device, 5000); % Initial burst to pick up ball
pause(0.1) % Wait 0.1 seconds
% set_pwm(add_proper_args); % Set to lesser value to level out somewhere in
% the pipe

%% Initialize variables
action = 2000; % Same value of last set_pwm   
error       = 0;
error_sum   = 0;

%% Feedback loop
while true
    %% Read current height
    [ir,~,~,~] = read_data(device);
    y = ir2y(ir); % Convert from IR reading to distance from bottom [m]
    
    %% Calculate errors for PID controller
    error_prev = error;             % D
    error      = target - y;        % P
    error_sum  = error + error_sum; % I
    
    %% Control
    prev_action = action;
    action = pid_controller; % Come up with a scheme no answer is right but do something
    set_pwm(device, action); % Implement action
        
    % Wait for next sample
    pause(sample_rate)
end

