function [i] = get_seg(t, m, tt)
	for i=1:m
		if tt(i) > t
			break
		end
	end
end