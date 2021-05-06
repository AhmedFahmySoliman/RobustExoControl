function Z = rotz(q)
E     = [cos(q), sin(q),    0;
         -sin(q), cos(q),    0;
              0,      0,    1];  % Normal rotation transposed
     
Z     = [E, zeros(3,3);
         zeros(3,3), E];     
end