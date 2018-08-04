function [pos] = get_trap_pos(subseg, tcurr, startpos, endpos, vel, acc, ta, ts)
	% same arguments as get_trap_vel()
	% returns position
	switch subseg
		case 0
			pos = startpos;
		case 1
			pos = startpos + (acc * tcurr ^ 2) / 2.0;
		case 2
			pos = startpos + (acc * ta ^ 2) / 2.0 + (tcurr - ta) * vel;
		case 3
			pos = startpos + (acc * ta ^ 2) / 2.0 + ts * acc * ta ...
			- (acc / 2.0) * ((tcurr - ts) ^ 2 - 4 * ta * (tcurr - ts) + 3 * ta ^ 2);
		otherwise
			pos = endpos;
	end 
end 
