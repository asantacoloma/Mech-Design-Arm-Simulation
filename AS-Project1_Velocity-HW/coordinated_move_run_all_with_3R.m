function [t, seg, tcurr, subseg, xvt, yvt, gvt, xpt, ypt, gpt, t1dt, t2dt, t3dt, ...
												t1dotdt, t2dotdt, t3dotdt, ckpost, ckvelt] = ...
	... % lots of outputs!
	coordinated_move_run_all_with_3R(delt, m, x, y, g, ta, ts, tt, vusex, ausex, signx, ...
												vusey, ausey, signy, vuseg, auseg, signg, ... 
												L1, L2, L3, xs, ys)
	% lots of inputs!
	%
	% create arrays here
	%
	t=0:delt:ceil(tt(length(tt)));
	seg=zeros(1,length(t));
	tcurr=zeros(1,length(t));
	subseg=zeros(1,length(t));
	xvt=zeros(1,length(t));
	yvt=zeros(1,length(t));
	gvt=zeros(1,length(t));
	xpt=zeros(1,length(t));
	ypt=zeros(1,length(t));
	gpt=zeros(1,length(t));
	t1dt=zeros(1,length(t));
	t2dt=zeros(1,length(t));
	t3dt=zeros(1,length(t));
	t1dotdt=zeros(1,length(t));
	t2dotdt=zeros(1,length(t));
	t3dotdt=zeros(1,length(t));
	ckpost=zeros(1,length(t));
	ckvelt=zeros(1,length(t));
	
	for i=1:length(t)
		[seg(i), tcurr(i), subseg(i), xvt(i), yvt(i), gvt(i), xpt(i), ypt(i), gpt(i), ...
			t1dt(i), t2dt(i), t3dt(i), t1dotdt(i), t2dotdt(i), t3dotdt(i), ckpost(i), ckvelt(i)] = ...
		... % all one very, very long line.
		coordinated_move_run_one_with_3R(t(i), m, x, y, g, ta, ts, tt, vusex, ausex, signx, ...
													vusey, ausey, signy, vuseg, auseg, signg, L1, L2, L3, xs, ys);
	end	
end

	