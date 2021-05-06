function x_out = rep_outlier(x_in)

S = isoutlier(x_in);
M = mean(x_in);
I = find(S);

x_out    = x_in;
x_out(I) = M; 

end