function [ta, ts, tf, tt, vusex, ausex, signx, vusey, ausey, signy, vuseg, auseg, signg, domaxis] = ...
	coordinated_move_init_all(m, x, y, g, vmaxx, amaxx, vmaxy, amaxy, vmaxg, amaxg)
	
	ta = zeros(1,m);
	ts = zeros(1,m);
	tf = zeros(1,m);
	tt = zeros(1,m);
	vusex = zeros(1,m);
	ausex = zeros(1,m);
	signx = zeros(1,m);
	vusey = zeros(1,m);
	ausey = zeros(1,m);
	signy = zeros(1,m);
	vuseg = zeros(1,m);
	auseg = zeros(1,m);
	signg = zeros(1,m);
	domaxis = zeros(1,m);

	for i = 1:m
		[ta(i), ts(i), tf(i), vusex(i), ausex(i), signx(i), vusey(i), ausey(i), signy(i), vuseg(i), auseg(i), signg(i), domaxis(i)] = ...
		coordinated_move_init_one(x(i), x(i+1), y(i), y(i+1), g(i), g(i+1), vmaxx, amaxx, vmaxy, amaxy, vmaxg, amaxg);
		
		if(i > 1) 
			tt(i) = tt(i-1) + tf(i);
		else
			tt(i) = tf(i);
		end		
	
	end
end
