function v_cross = crm(v)
     
v_cross   = [skew(v(1:3)), zeros(3,3);
             skew(v(4:6)),   skew(v(1:3))];     
end