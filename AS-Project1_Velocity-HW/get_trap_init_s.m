function [vuse, ause] = get_trap_init_s(startpos, endpos, ta, ts)
	% subordinate axis trapezoidal move init function
	% ta and ts are set by the dominant axis
	% this function assumes vuse < vmax and ause < amax (doesn't check).
	% (special case of ts given as zero should be ok.)
	vuse = abs(endpos-startpos)/(ta + ts);
	ause = vuse/ta;
end
