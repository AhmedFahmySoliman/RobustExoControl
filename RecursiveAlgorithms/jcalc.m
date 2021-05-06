function [XJ, s] = jcalc(pitch, q)
if pitch == 0
    XJ  = rotz(q);
    s   = [0;0;1;0;0;0];
elseif pitch == inf
    XJ  = xlt(0,0,q);
    s   = [0;0;0;0;0;1];
else
    XJ  = rotz(q)*xlt(0,0,q*pitch);
    s   = [0;0;1;0;0;pitch];
end    
end