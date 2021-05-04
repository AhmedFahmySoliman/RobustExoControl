%% Clear every thing
% clear,clc,close all

%% Load Tabulated Data
Subjects_Table;
within_zmp = table({'ZIF';'ZIF';'ZIF';'BAC';'BAC';'BAC';'CMC';'CMC';'CMC'},{'X_zmp';'Y_zmp';'Pitch';'X_zmp';'Y_zmp';'Pitch';'X_zmp';'Y_zmp';'Pitch'},'VariableNames',{'Controller','Metric'});
n = 12;               %Number of Subjects
%% Check normality of the Data
warning('off','all');
[h(1),p(1)] = lillietest(rep_outlier(T_D.Xzmp_ZIF)); [h(2),p(2)] = lillietest(rep_outlier(T_D.Yzmp_ZIF)); [h(3),p(3)] = lillietest(rep_outlier(T_D.Pitch_ZIF)); 
[h(4),p(4)] = lillietest(rep_outlier(T_D.Xzmp_BAC)); [h(5),p(5)] = lillietest(rep_outlier(T_D.Yzmp_BAC)); [h(6),p(6)] = lillietest(rep_outlier(T_D.Pitch_BAC));
[h(7),p(7)] = lillietest(rep_outlier(T_D.Xzmp_CMC)); [h(8),p(8)] = lillietest(rep_outlier(T_D.Yzmp_CMC)); [h(9),p(9)] = lillietest(rep_outlier(T_D.Pitch_CMC));

if all(h) ~= 0
    return
end
  
%% Compute ANOVA test
rm = fitrm(T_D,'Xzmp_ZIF-Pitch_CMC ~ 1','WithinDesign',within_zmp,'WithinModel','orthogonalcontrasts');
ANOVA_SC2 = ranova(rm,'WithinModel','Controller');
disp('ANOVA Table2 =')
disp(ANOVA_SC2)

%% Pairwise Compare
%Post_Hoc_SC2 = multcompare(rm,'Controller');
%disp('Post-Hoc Table2 =')
%disp(Post_Hoc_SC2)

%% Manual Comp Post-Hoc Table

n_sub=12; n_pair=2; n_met=3;
kstar = nchoosek(3, 2); 
alpha=0.05;df=n_sub-1;
T_crit = tinv(1 - alpha / (2*kstar), df);

Y2 = [rm.BetweenDesign.Xzmp_CMC, rm.BetweenDesign.Yzmp_CMC, rm.BetweenDesign.Pitch_CMC, ...
      rm.BetweenDesign.Xzmp_BAC, rm.BetweenDesign.Yzmp_BAC, rm.BetweenDesign.Pitch_BAC, ];
[Var_CB,STDErrCB] = STDErr_fun(Y2,n_sub,n_pair,n_met);M_dCB = mean(mean(Y2(:,1:3)))-mean(mean(Y2(:,4:6)));
t_CB = abs(M_dCB)/STDErrCB; P_CB = 2*tcdf(-abs(t_CB),df);

Y1 = [rm.BetweenDesign.Xzmp_ZIF, rm.BetweenDesign.Yzmp_ZIF, rm.BetweenDesign.Pitch_ZIF, ...
      rm.BetweenDesign.Xzmp_BAC, rm.BetweenDesign.Yzmp_BAC, rm.BetweenDesign.Pitch_BAC, ];
[Var_ZB,STDErrZB] = STDErr_fun(Y1,n_sub,n_pair,n_met);M_dZB = mean(mean(Y1(:,1:3)))-mean(mean(Y1(:,4:6)));
t_ZB = abs(M_dZB)/STDErrZB; P_ZB = 2*tcdf(-abs(t_ZB),df);

Y3 = [rm.BetweenDesign.Xzmp_ZIF, rm.BetweenDesign.Yzmp_ZIF, rm.BetweenDesign.Pitch_ZIF, ...
      rm.BetweenDesign.Xzmp_CMC, rm.BetweenDesign.Yzmp_CMC, rm.BetweenDesign.Pitch_CMC, ];
[Var_ZC,STDErrZC] = STDErr_fun(Y3,n_sub,n_pair,n_met);M_dZC = mean(mean(Y3(:,1:3)))-mean(mean(Y3(:,4:6)));
t_ZC = abs(M_dZC)/STDErrZC; P_ZC = 2*tcdf(-abs(t_ZC),df);

Names = {'Controller_Pairs','Mean_Diff','Mean_Square_Error','pValue','tValue','CI_Lower_Bound','CI_Upper_Bound'};
Cpairs = ['CMC vs BAC';'ZIF vs BAC';'ZIF vs CMC'];

LB_CB  = M_dCB-T_crit*STDErrCB;UB_CB  = M_dCB+T_crit*STDErrCB;
LB_ZB  = M_dZB-T_crit*STDErrZB;UB_ZB  = M_dZB+T_crit*STDErrZB;
LB_ZC  = M_dZC-T_crit*STDErrZC;UB_ZC  = M_dZC+T_crit*STDErrZC;

Y = [Var_CB,M_dCB,P_CB,t_CB,LB_CB,UB_CB;Var_ZB,M_dZB,P_ZB,t_ZB,LB_ZB,UB_ZB,;Var_ZC,M_dZC,P_ZC,t_ZC,LB_ZC,UB_ZC];
T = table(Cpairs,Y(:,2),Y(:,1),Y(:,3),Y(:,4),Y(:,5),Y(:,6),'VariableNames',Names);
disp('Post-Hoc Table2 =')
disp(T)