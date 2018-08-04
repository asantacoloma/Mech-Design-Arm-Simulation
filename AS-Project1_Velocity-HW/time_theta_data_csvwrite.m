function time_theta_data_csvwrite(filename, t, seg, tcurr, subseg, xvt, yvt, gvt, xpt, ypt, gpt,...
	t1_d, t2_d, t3_d, t1dot_d, t2dot_d, t3dot_d, ckp, ckv)
	% output raw arrays to CSV file named "filename"
	mat=[t; seg; tcurr; subseg; xvt; yvt; gvt; xpt; ypt; gpt; t1_d; t2_d; t3_d; t1dot_d; t2dot_d; t3dot_d; ckp; ckv];
	mat=mat';
	csvwrite(filename, mat);
end
