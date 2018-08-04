function [fixed_d] = fix_ang_d(ang_d)
	
	fixed_d = ang_d;
	
	while(fixed_d < -180.0)
		fixed_d = fixed_d + 360.0;
	end
	
	while(fixed_d > +180.0)
		fixed_d = fixed_d - 360.0;
	end
end