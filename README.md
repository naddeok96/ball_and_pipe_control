# Ball and Pipe Control System
MATLAB codes to open serial communication with a ball and pipe system. The system is made of a vertical cylinder with a ping pong ball controlled by a fan on the bottom and height measured by a time of flight sensor on top. The objective is to balance the ball at a target altitude. To acomplish this objective, the group chose a PLC controller, which will be explained more in depth. All files besides README.m, SCFBA Specification Sheet.pdf, and plc_controller.m were provided by Kyle Naddeo, but the group adjusted them according to our PLC design.

PLC is a type of machine learning in which the outputs are changed continously through the measurements of inputs and code that controls the interaction between inputs and outputs. For this project, the input comes from the measurement of the height sensor, the program is plc_controller.m file, and the output is the fan strength, which is controlled by PWM. The plc_controller.m file code can be changed, based on where the user wants the ball to hover. A range is given in this code where the ball will stop, though it might increase and decrease slightly to adjust itself.

.gitignore

README.md
This file has a brief description of every file in this project. After reading this file, the reader will have a basic understanding of what actions the specific files are performing.

SCFBA Specification Sheet.pdf
In this file, the ball and pipe instruction manual is shown. All the foundational information needed to complete this project can be found in this manual.

ir2y.m
This file takes the reading from the sensor and converts that value to meters, so the position the ball is at can be more easily understood. The parameters section had to be filled out by the group and was found through multiple tests.

plc_controller.m
This file contains the groups PLC controller that was used in the project to control the position of the ball and pipe system. The position of the ball is controlled by the fan speed, which is adjusted according to where the ball is located in the pipe and changes to the pwm(fan speed) based on this position. Right now, the code is set up to where the ball will end up at a very specified position and stay there. The position all the way at the top of the pipe is equivalent to 1, so according to this code, the ball will rest between .6 and .8 meters up the pipe.

read_data.m
In this file, data is taken from the sensor and turned into a string. This string is then translated into a double, with a specific data value assigned to it.

real_world.m
This is the file that should be run to make the entire project perform. Real world performs the actions that it implies. This file controls the fan on he bottom of the pipe. An initial burst is put into this file so that the readings will start when the ball is already in the air. From the inital burst, the height is read continuously. The files read_data.m, plc_controller.m, ir2y.m, and set_pwm.m are all called in real_world.m, so this file could also be called main.m.

set_pwm.m
Since the PWM value come sometimes be invalid, bounds are created to prevent this from happening. The value of PWM that is sent to the fan can be sent because of this file.
