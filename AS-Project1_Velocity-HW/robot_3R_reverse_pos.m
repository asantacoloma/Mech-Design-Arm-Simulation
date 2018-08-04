function [t1i_d, t2i_d, t3i_d] = robot_3R_reverse_pos(L1, L2, L3, xp, yp, g_d)



% xpstar = (xp)-L3*cosd(g_d);
% ypstar = (yp)-L3*sind(g_d);
g_r = g_d*pi/180;
xpstar = (xp)-(L3*cos(g_r));
ypstar = (yp)-(L3*sin(g_r));

g2 = (xpstar^2)+(ypstar^2);
c2 = (g2-(L1^2)-(L2^2))/(2*L1*L2);

%s2A = sind(acosd(c2));% elbow up
%s2B = sind(-acosd(c2)); % elbow down

if (abs(c2)>1)
    t1i_d = 0;
    t2i_d = 0;
    t3i_d = 0;
    return
end

%one of the parameters of this project is that the 
%robot arm uses elbow up position therefore s2B is irrelevant and unused in this code
s2A = ((1-((c2)^2))^0.5); % only works for radians?
s2B = -1*((1-(c2)^2)^0.5);

matrix1 = [(L1+L2*c2), (-L2*s2A); (L2*s2A), (L1+L2*c2)];
inv1 = inv(matrix1);
starmat = [xpstar; ypstar];

ansmat = inv1*starmat; %ansmat (answer matrix stores cos and sin value of theta 1
c1 = ansmat(1,1);
s1 = ansmat(2,1);

%get final thetas
t1i_r = sign(s1)*acos(c1);
t2i_r = sign(s2A)*acos(c2);
t3i_r = g_r - t1i_r -t2i_r;

t1i_d = t1i_r * 180/pi;%convert radians to degrees
t2i_d = t2i_r * 180/pi;
t3i_d = t3i_r * 180/pi;
 
%theta 1 check
t1i_d = fix_ang_d(t1i_d);

%theta 2 check
t2i_d = fix_ang_d(t2i_d);

%theta 3 check
t3i_d = fix_ang_d(t3i_d);

end