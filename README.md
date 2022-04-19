# Ball and Pipe Control System
MATLAB codes to open serial communication with a ball and pipe system. The system is made of a vertical cylinder with a ping pong ball controlled by a fan on the bottom and height measured by a time of flight sensor on top. The objective is to balance the ball at a target altitude. 

.gitignore

README.md

SCFBA Specification Sheet.pdf

ir2y.m
The file was originally provided to the group by Kyle Naddeo, but adjustments had to be made according to the PLC control system.

plc_controller.m
This file contains the groups PLC controller that was used in the project to control the position of the ball and pipe system. The position of the ball is controlled by the fan speed, which is adjusted according to where the ball is located in the pipe and changes to the pwm based on this position. Right now, the code is set up to where the ball will end up at a very specified position and stay there. The position all the way at the top of the pipe is equivalent to 1, so according to this code, the ball will rest between .6 and .8 up the pipe.

read_data.m
The file was originally provided to the group by Kyle Naddeo, but adjustments had to be made according to the PLC control system.

real_world.m
The file was originally provided to the group by Kyle Naddeo, but adjustments had to be made according to the PLC control system.

set_pwm.m
The file was originally provided to the group by Kyle Naddeo, but adjustments had to be made according to the PLC control system.

set_pwm.m.orig
