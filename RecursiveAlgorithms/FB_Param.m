function  [J, dJ] = FB_Param( q, qd)

c4 = cos(q(4));  s4 = sin(q(4));
c5 = cos(q(5));  s5 = sin(q(5));
c6 = cos(q(6));  s6 = sin(q(6));

E = [  c5*c6,  c4*s6+s4*s5*c6,  s4*s6-c4*s5*c6;
      -c5*s6,  c4*c6-s4*s5*s6,  s4*c6+c4*s5*s6;
        s5,       -s4*c5,           c4*c5 ];

r   = q(1:3);
% rd  = qd(1:3);
% rdd = qdd(1:3);

R = [  0,    -r(3),  r(2);
       r(3),  0,    -r(1);
      -r(2),  r(1),  0 ];

% X = [ E, zeros(3); -E*R, E ];

S = [ 1  0    s5;
      0  c4  -s4*c5;
      0  s4   c4*c5];      %Floating Base Jacobian

  c4d = -s4*qd(4);  s4d = c4*qd(4);
  c5d = -s5*qd(5);  s5d = c5*qd(5);

Sd = [ 0  0     s5d;
	   0  c4d  -s4d*c5-s4*c5d;
	   0  s4d   c4d*c5+c4*c5d ];  %Floating Base Jacobian dervative

 omega  = S*qd(4:6);
 
  J = [zeros(3,3), S; eye(3,3), skew(r)*S];
 dJ = [zeros(3,3), skew(omega)*S; zeros(3,3), (skew(omega)*skew(r)*S)+(skew(r)*skew(omega)*S)];
 

% domega = S*qdd(4:6) + Sd*qd(4:6);

% v = [ omega; rd+skew(r)*omega];
% a = [S*qdd(4:6) + Sd*qd(4:6); rdd + skew(r)*S*qdd(4:6) + skew(r)*Sd*qd(4:6) + skew(omega)*skew(r)*omega];