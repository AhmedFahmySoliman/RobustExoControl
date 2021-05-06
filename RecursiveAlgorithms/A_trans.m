%%%%%% Transformation Matrix Function %%%%%%


function A = A_trans(a,al,d,q)

      A = [cos(q), -sin(q)*cosd(al),  sin(q)*sind(al), a*cos(q);
           sin(q),  cos(q)*cosd(al), -cos(q)*sind(al), a*sin(q);
             0   ,      sind(al),         cosd(al),            d;
             0   ,        0    ,            0   ,           1];

end