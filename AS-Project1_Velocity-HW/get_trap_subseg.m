function [subseg] = get_trap_subseg(tcurr, ta, ts)
	% tcurr is time into current trapezoidal move
	% ta is accel/decel time
	% ts is slew time
	% function normally returns 1 for accel, 2 for slew
	% 3 for decel. 
	% abnormal cases also handled when tcurr is negative
	% a zero subseg is returned.  And if t > tf, then
	% a 4 is returned.	
	if (tcurr < 0) 
		subseg = 0;
	elseif (tcurr <= ta) 
		subseg = 1;
	elseif (tcurr <= ta + ts) 
		subseg = 2;
	elseif (tcurr <= 2 * ta + ts) 
		subseg = 3;
	else
		subseg = 4;
	end 
end 