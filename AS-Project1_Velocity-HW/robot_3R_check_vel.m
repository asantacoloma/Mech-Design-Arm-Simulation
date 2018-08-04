function [checkvi] = robot_3R_check_vel(L1, L2, L3, t1i_d, t2i_d, t3i_d, t1doti_d, t2doti_d, t3doti_d, xpdot, ypdot, gdot_d)

	J = [-L1*sin((t1i_d)*pi/180.0)-L2*sin((t1i_d+t2i_d)*pi/180.0)-L3*sin((t1i_d+t2i_d+t3i_d)*pi/180.0),-L2*sin((t1i_d+t2i_d)*pi/180.0)-L3*sin((t1i_d+t2i_d+t3i_d)*pi/180.0),-L3*sin((t1i_d+t2i_d+t3i_d)*pi/180.0);...
			L1*cos((t1i_d)*pi/180.0)+L2*cos((t1i_d+t2i_d)*pi/180.0)+L3*cos((t1i_d+t2i_d+t3i_d)*pi/180.0),L2*cos((t1i_d+t2i_d)*pi/180.0)+L3*cos((t1i_d+t2i_d+t3i_d)*pi/180.0),L3*cos((t1i_d+t2i_d+t3i_d)*pi/180.0); 1, 1, 1];
			
			
	thds = [t1doti_d*pi/180.0; t2doti_d*pi/180.0; t3doti_d*pi/180.0];
	DD = [xpdot; ypdot; gdot_d*pi/180.0];
	
	vec = DD - J*thds;
	vec = vec';
	
	checkvi = dot(vec,vec) < 0.0001;

end
