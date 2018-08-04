clc;clear;
%Alejandro Santacoloma
%EML3005 Mechdesign 1

%My Max velocities and accelerations
vmaxx = 15;
vmaxy = 15;
omaxg = 27;
amaxx = 40;
amaxy = 40;
amaxg = 60;

%My robot arm lengths
L1 = 113;
L2 = 104;
L3 = 6;
%My shoulder lengths
xs = -11;
ys = 12;


%My waypoints
x0 = 16;
x1 = 8;
x2 = 58;
x3 = 58;
x4 = 88;
x5 = 140;
x6 = 140;
x7 = 76;

y0 = 24;
y1 = 2;
y2 = 2;
y3 = 8;
y4 = 86;
y5 = 64;
y6 = 60;
y7 = 60;


x=[x0,x1,x2,x3,x4,x5,x6,x7,x0];
y=[y0,y1,y2,y3,y4,y5,y6,y7,y0];
g=[90,0,0,10,10,0,0,0,90];
m=length(x)-1;

delt = 0.020;

[ta, ts, tf, tt, vusex, ausex, signx, vusey, ausey, signy, vuseg, auseg, signg, domaxis] = ...
	coordinated_move_init_all(m, x, y, g, vmaxx, amaxx, vmaxy, amaxy, omaxg, amaxg);

segment_data_csvwrite('waypoint-segment-data.csv', m, x, y, g, ...
				ta, ts, tf, tt, vusex, ausex, signx, vusey, ausey, signy, vuseg, auseg, signg, domaxis);	

[t, seg, tcurr, subseg, xvt, yvt, gvt, xpt, ypt, gpt, t1_d, t2_d, t3_d, t1dot_d, t2dot_d, t3dot_d, ckp, ckv] =...
	coordinated_move_run_all_with_3R(delt, m, x, y, g, ...
	ta, ts, tt, vusex, ausex, signx, vusey, ausey, signy, vuseg, auseg, signg, L1, L2, L3, xs, ys);	

time_theta_data_csvwrite('time-theta-data.csv', t, seg, tcurr, subseg, xvt, yvt, gvt, xpt, ypt, gpt, ...
	t1_d, t2_d, t3_d, t1dot_d, t2dot_d, t3dot_d, ckp, ckv);	

% tweak next two based on what you want to plot.
% mwg_plot adds vertical lines to show boundaries of trapezoidal segments.
% plotxy=0;
% plotv=0;
% mwg_plot(plotxy, plotv, m, domaxis, tt, t, xpt, ypt, gpt, xvt, yvt, gvt);


