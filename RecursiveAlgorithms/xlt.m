function X = xlt(x,y,z)
R     = [x,y,z];
H     = skew(R);
     
X     = [eye(3,3), zeros(3,3);
               -H,   eye(3,3)];     
end