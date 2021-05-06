function S = skew(X)
x = X(1); y = X(2); z = X(3);
S = [ 0, -z,  y;
      z,  0, -x;
     -y,  x,  0];


end