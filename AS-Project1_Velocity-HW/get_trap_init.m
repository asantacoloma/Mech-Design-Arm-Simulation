function [ta, ts, tf, vuse, ause] = get_trap_init(startpos, endpos, vmax, amax)
	% initializes trapezoidal move as though this were a dominant axis.	
	% vmax, amax should each be positive, but sanity abs() called anyway.
	% handles either positive or negative moves
	% but vuse, ause always returned as positive values
	% returns accel time (ta), slew time (ts), total final time (tf)
	% handles special case move case

	vuse = abs(vmax);
	ause = abs(amax);
	ta = vuse/ause;
	ts = abs(endpos-startpos)/vuse - ta;
	
	if ts < 0
	    ta = sqrt(abs(endpos-startpos)/ause);
	    ts = 0;
	    vuse = ause*ta;
	end
	
	tf = 2*ta+ts;
end

    
