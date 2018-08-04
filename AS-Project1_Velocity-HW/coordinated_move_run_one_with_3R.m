function [segi, tcurri, subsegi, xvti, yvti, gvti, xpti, ypti, gpti, theta1i, theta2i, theta3i, ...
				theta1doti, theta2doti, theta3doti, checkpi, checkvi] = ...
	... % very long function definition!!!
	coordinated_move_run_one_with_3R(ti, m, x, y, g, ta, ts, tt, vusex, ausex, signx, ...
				vusey, ausey, signy, vuseg, auseg, signg, L1, L2, L3, xs, ys)
	%
	% inputs:
	%   ti (scalar) is any instant of time (greater than zero and going to ceil(tt(length(tt)))
	%   m (scalar) number of segments
	%   ta, ts, tt, vusex, ausex, signx, ... these are segment data (all arrays, length of each is m)
	% returns the following values (all scalars):
	%   segi is current segment going with ti
	%   tcurri is time into current segment
	%   subsegi is the accel'1' slew'2' decel'3' postmove'4'
	%   xpti, etc.  position of x
	%   xvti, etc.  velocity of x
	%   theta1i, theta2i, theta3i are the joint angles
	%   theta1doti, theta2doti, theta3doti are the joint speeds
	%   checkpi is 1 if the reverse position analysis was correct
	%   checkvi is 1 if the reverse velocity analysis was correct
	%
	segi = get_seg(ti, m, tt);
	tcurri = get_time_in_currseg(ti, segi, tt);
	subsegi = get_trap_subseg(tcurri, ta(segi), ts(segi));
	xpti = get_trap_pos(subsegi, tcurri, x(segi), x(segi+1), signx(segi)*vusex(segi), ...
								signx(segi)*ausex(segi), ta(segi), ts(segi));
	ypti = get_trap_pos(subsegi, tcurri, y(segi), y(segi+1), signy(segi)*vusey(segi), ...
								signy(segi)*ausey(segi), ta(segi), ts(segi));
	gpti = get_trap_pos(subsegi, tcurri, g(segi), g(segi+1), signg(segi)*vuseg(segi), ...
								signg(segi)*auseg(segi), ta(segi), ts(segi));
	xvti = get_trap_vel(subsegi, tcurri, x(segi), x(segi+1), signx(segi)*vusex(segi), ...
								signx(segi)*ausex(segi), ta(segi), ts(segi));
	yvti = get_trap_vel(subsegi, tcurri, y(segi), y(segi+1), signy(segi)*vusey(segi), ...
								signy(segi)*ausey(segi), ta(segi), ts(segi));
	gvti = get_trap_vel(subsegi, tcurri, g(segi), g(segi+1), signg(segi)*vuseg(segi), ...
								signg(segi)*auseg(segi), ta(segi), ts(segi));
	% new stuff!
	[theta1i, theta2i, theta3i] = robot_3R_reverse_pos(L1, L2, L3, xpti-xs, ypti-ys, gpti);	
	[theta1doti, theta2doti, theta3doti] = robot_3R_reverse_vel(L1, L2, L3, ...
																					theta1i, theta2i, theta3i, ...
																					xvti, yvti, gvti);
																					
	% sanity checks (totally optional for you, I do this when debugging code.)
	checkpi = robot_3R_check_pos(L1, L2, L3, theta1i, theta2i, theta3i, xpti-xs, ypti-ys, gpti); 	
	checkvi = robot_3R_check_vel(L1, L2, L3, theta1i, theta2i, theta3i, ...
											theta1doti, theta2doti, theta3doti, xvti, yvti, gvti); 	
end

	