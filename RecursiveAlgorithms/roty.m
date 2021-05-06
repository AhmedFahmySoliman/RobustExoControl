function Y = roty(q)
E     = [cos(q),      0,    -sin(q);
              0,      1,         0;
         sin(q),      0,    cos(q)]; % Normal rotation transposed
     
Y     = [E, zeros(3,3);
         zeros(3,3), E];     
end