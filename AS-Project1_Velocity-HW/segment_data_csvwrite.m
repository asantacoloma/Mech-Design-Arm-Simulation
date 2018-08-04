function segment_data_csvwrite(filename, m, x, y, g, ...
	ta, ts, tf, tt, vusex, ausex, signx, vusey, ausey, signy, vuseg, auseg, signg, domaxis)
	% output raw seg data to CSV file with the name "filename"
	% the following lines include the waypoint data with the startpoint identified as row "0".
	% a column is prepended with the waypoint/segment number.
	mat=[ta; ts; tf; tt; vusex; ausex; signx; vusey; ausey; signy; vuseg; auseg; signg; domaxis];
	mat=mat';
	% add a row of zeros to prep for prepending the waypoint data
	mat=[zeros(1,14);mat];
	mat=mat';
	mat=[0:m; x; y; g; mat];
	mat=mat';
	csvwrite(filename, mat);
end




