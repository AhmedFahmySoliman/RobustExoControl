function y = PP_avg_fun(x,L)

h = floor(2*length(x)/L)-1; %Incomplete last step
yi = zeros(1,h);

for i = 1:h
    yi(1,i) = peak2peak(x(((i-1)*(L/2))+(1:L)));   % Peak2Peak for each successive peaks
end
y = mean(yi);
end
