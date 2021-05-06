function I = spat_I(Ic,m,l)

I(1:3,1:3) = Ic+m*skew(l)*(skew(l)');
I(1:3,4:6) =  m*skew(l);
I(4:6,1:3) =  m*skew(l)';
I(4:6,4:6) =  m*eye(3,3);

end