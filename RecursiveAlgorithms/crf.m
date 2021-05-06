function v_fcross = crf(v)
     
% v_fcross   = [skew(v(1:3)), skew(v(4:6));
%              zeros(3,3),   skew(v(1:3))];

v_fcross   = -crm(v)';
end