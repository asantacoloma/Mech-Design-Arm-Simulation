function [ta, ts, tf, vusex, ausex, signx, vusey, ausey, signy, vuseg, auseg, signg, domaxis] = ...
	coordinated_move_init_one(xo, xf, yo, yf, go, gf, vmaxx, amaxx, vmaxy, amaxy, vmaxg, amaxg)
	
	[tax, tsx, tfx, vusex, ausex] = get_trap_init(xo, xf, vmaxx, amaxx);
	[tay, tsy, tfy, vusey, ausey] = get_trap_init(yo, yf, vmaxy, amaxy);
	[tag, tsg, tfg, vuseg, auseg] = get_trap_init(go, gf, vmaxg, amaxg);
	
	if xf >= xo
		signx = 1;
	else
		signx = -1;
	end

	if yf >= yo
		signy = 1;
	else
		signy = -1;
	end
	
	if gf >= go
		signg = 1;
	else
		signg = -1;
	end
		
	if tfx > tfy && tfx > tfg
		domaxis = 1;
		ta = tax;
		ts = tsx;
		tf = tfx;
		[vusey, ausey] = get_trap_init_s(yo, yf, ta, ts);
		[vuseg, auseg] = get_trap_init_s(go, gf, ta, ts);
	elseif tfy > tfx && tfy > tfg
		domaxis = 2;
		ta = tay;
		ts = tsy;
		tf = tfy;
		[vusex, ausex] = get_trap_init_s(xo, xf, ta, ts);
		[vuseg, auseg] = get_trap_init_s(go, gf, ta, ts);
	else
		domaxis = 3;
		ta = tag;
		ts = tsg;
		tf = tfg;
		[vusex, ausex] = get_trap_init_s(xo, xf, ta, ts);
		[vusey, ausey] = get_trap_init_s(yo, yf, ta, ts);
	end	
end
