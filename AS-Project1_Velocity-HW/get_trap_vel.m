function [trap_vel] = get_trap_vel(subseg, tcurr, startpos, endpos, vel, acc, ta, ts)
	% subseg is the value get_trap_subseg() returns
	% tcurr is the time into the current trapezoidal move
	% startpos is the pos at tcurr=0, endpos is the pos at tcurr=2*ta+ts=tf
	% (those positions are included as arguments but not actually used in the function)
	% vel, acc are velocity and acceleration for the move
	% ta accel/decel time, ts is slew time
	% return value is the velocity
	switch subseg
		case 0
			trap_vel = 0;
		case 1
			trap_vel = acc * tcurr;
		case 2
			trap_vel = acc * ta;
		case 3
			trap_vel = acc * ((2*ta + ts) - tcurr);
		otherwise
			trap_vel = 0;
	end
end