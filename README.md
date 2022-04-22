# Ball and Pipe Control System
MATLAB codes to open serial communication with a ball and pipe system. The system is made of a vertical cylinder with a ping pong ball controlled by a fan on the bottom and height measured by a time of flight sensor on top. The objective is to balance the ball at a target altitude. 

.gitignore

README.md
This file has a brief description of every file in this project. After reading this file, the reader will have a basic understanding of what actions the specific files are performing.

SCFBA Specification Sheet.pdf
In this file, the ball and pipe instruction manual is shown. All the foundational information needed to complete this project can be found in this manual.

ir2y.m
The file was originally provided to the group by Kyle Naddeo, but adjustments had to be made according to the PLC control system. This file takes the reading from the sensor and converts that value to meters, so the position th eball is at cna be more easily understood. The parameters section had to be filled out by the group and was found through multiple tests.

plc_controller.m
This file contains the groups PLC controller that was used in the project to control the position of the ball and pipe system. The position of the ball is controlled by the fan speed, which is adjusted according to where the ball is located in the pipe and changes to the pwm based on this position. Right now, the code is set up to where the ball will end up at a very specified position and stay there. The position all the way at the top of the pipe is equivalent to 1, so according to this code, the ball will rest between .6 and .8 meters up the pipe.

read_data.m
The file was originally provided to the group by Kyle Naddeo, but adjustments had to be made according to the PLC control system. In this file, data is taken from the sensor and turned into a string. This string is then translated into a double, with a specific data value assigned to it.

real_world.m
The file was originally provided to the group by Kyle Naddeo, but adjustments had to be made according to the PLC control system. Real world performs that actions that it implies. This file controls the fan on he bottom of the pipe. An initial purst is put into this file so that the readings will start when the ball is already in the air. From the inital urst, the height is read continuously. The files read_data.m, plc_controller.m, ir2y.m, and set_pwm.m are all called in real_world.m, so this file could also be called main.m.

set_pwm.m
The file was originally provided to the group by Kyle Naddeo, but adjustments had to be made according to the PLC control system. Since the PWM value come sometimes be invalid, bounds are created to prevent this from happening. The value of PWM that is sent to the fan can be sent because of this file.
