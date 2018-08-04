function [tcurr] = get_time_in_currseg(t, segi, tt)
	if segi == 1
		tcurr = t;
	else
		tcurr = t - tt(segi-1);
	end
end