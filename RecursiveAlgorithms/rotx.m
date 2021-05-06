function X = rotx(q)
E     = [1,      0,     0;
         0, cos(q),sin(q);
         0, -sin(q),cos(q)]; % Normal rotation transposed
     
X     = [E, zeros(3,3);
         zeros(3,3), E];     
end