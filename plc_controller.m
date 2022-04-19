function  new_pwm = plc_controller(new_pwm, y, OldY)

%if(y<.1)%responds to intial conditions
%    new_pwm = new_pwm + 50;
%end

if (y > .7)%Outer Control ifs
    if(new_pwm>2500)
        new_pwm = new_pwm-1;
    end
elseif(y<.5)
    if(new_pwm<5000)    
        new_pwm = new_pwm+5;
    end
elseif(.5>y && y<.7)%Entrance to middle ifs
    if (y > .625)
        new_pwm = new_pwm-.2;
    elseif(y<.675)   
        new_pwm = new_pwm+2.5;
    end
elseif(.625>y && y<.675)%Entrance to inner ifs
        if (y > .6525)
            new_pwm = new_pwm-.02;
        elseif(y<.6575)   
        new_pwm = new_pwm+.5;
        elseif(y<.6525 && y<.6575)
            new_pwm = new_pwm;
        end
end
pause(.1);
disp (new_pwm)
disp (y)
%read speed and based off the speed set by how much pwm is adjusted
%need to store both present and last position
t = 0.25; %time between readings
vel = 0;

%vel = (y-OldY)/t;
%new_pwm = (vel/.95)*new_pwm;
%pause(.1)
end