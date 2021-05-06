function [MSE,STDErr] = STDErr_fun(Y,n_sub,n_pair,n_met)
%% STDError Computation

N=n_sub*n_pair*n_met;

T1 = 0; T2 = 0; T3 = 0;
for i = 1:n_pair
    for j = 1:n_sub
        T1 = T1+sum(Y(j,((i-1)*n_met)+(1:n_met)))^2;
    end
end
T1 = T1/n_met;

for i = 1:n_pair
        T2 = T2+sum(sum(Y(:,((i-1)*n_met)+(1:n_met))))^2;
end
T2 = T2/(n_met*n_sub);

for i = 1:n_sub
        T3 = T3+sum(Y(i,(1:n_met*n_pair)))^2;
end
T3 = T3/(n_pair*n_met);

T4 = sum(sum(Y))^2;
T4 = T4/N;

SSE = T1-T2-T3+T4; df = n_sub-1;
MSE = SSE/df;
STDErr = sqrt(2*MSE/(n_sub*n_met));