function [checkpi] = robot_3R_check_pos(L1, L2, L3, t1i_d, t2i_d, t3i_d, xp, yp, g_d)

	t1i_r = t1i_d*pi/180.0;
	t2i_r = t2i_d*pi/180.0;
	t3i_r = t3i_d*pi/180.0;
	
	gck_d = fix_ang_d(t1i_d + t2i_d + t3i_d);
	xpck = L1*cos(t1i_r) + L2*cos(t1i_r + t2i_r) + L3*cos(gck_d*pi/180.0);
	ypck = L1*sin(t1i_r) + L2*sin(t1i_r + t2i_r) + L3*sin(gck_d*pi/180.0);

	checkpi = sqrt((xpck - xp)^2 + (ypck - yp)^2) < 0.0001 && abs(g_d - gck_d) < 0.01;
end