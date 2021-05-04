%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The code used to generate tables used by ANOVA test. 
% The table represents the RMS values of Xzmp, Yzmp, and pitch orientation 
% obtained by 12 different subjects wearing the lower body exoskeleton in 
% question.
% The values obtained for two walking scenarios namely SC#1, and SC#2.
% For more details, refere to the paper
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Load Data
Load_Results;
Index = 400:2001;
%% Free Walking Results per Subjects
[Xzmp_F(1,:), Yzmp_F(1,:), Pitch_F(1,:)] = sub(Model1_89kg_187cm_50cm_zmp_Free(:,Index), Model1_89kg_187cm_50cm_AC_Free(:,Index), Model1_89kg_187cm_50cm_CMC_Free(:,Index));
[Xzmp_F(2,:), Yzmp_F(2,:), Pitch_F(2,:)] = sub(Model2_66kg_181cm_46cm_zmp_Free(:,Index), Model2_66kg_181cm_46cm_AC_Free(:,Index), Model2_66kg_181cm_46cm_CMC_Free(:,Index));
[Xzmp_F(3,:), Yzmp_F(3,:), Pitch_F(3,:)] = sub(Model3_70kg_170cm_47cm_zmp_Free(:,Index), Model3_70kg_170cm_47cm_AC_Free(:,Index), Model3_70kg_170cm_47cm_CMC_Free(:,Index));
[Xzmp_F(4,:), Yzmp_F(4,:), Pitch_F(4,:)] = sub(Model4_80kg_170cm_49cm_zmp_Free(:,Index), Model4_80kg_170cm_49cm_AC_Free(:,Index), Model4_80kg_170cm_49cm_CMC_Free(:,Index));
[Xzmp_F(5,:), Yzmp_F(5,:), Pitch_F(5,:)] = sub(Model5_87kg_177cm_50cm_zmp_Free(:,Index), Model5_87kg_177cm_50cm_AC_Free(:,Index), Model5_87kg_177cm_50cm_CMC_Free(:,Index));
[Xzmp_F(6,:), Yzmp_F(6,:), Pitch_F(6,:)] = sub(Model6_75kg_175cm_47cm_zmp_Free(:,Index), Model6_75kg_175cm_47cm_AC_Free(:,Index), Model6_75kg_175cm_47cm_CMC_Free(:,Index));
[Xzmp_F(7,:), Yzmp_F(7,:), Pitch_F(7,:)] = sub(Model7_80kg_172cm_49cm_zmp_Free(:,Index), Model7_80kg_172cm_49cm_AC_Free(:,Index), Model7_80kg_172cm_49cm_CMC_Free(:,Index));
[Xzmp_F(8,:), Yzmp_F(8,:), Pitch_F(8,:)] = sub(Model8_81kg_183cm_49cm_zmp_Free(:,Index), Model8_81kg_183cm_49cm_AC_Free(:,Index), Model8_81kg_183cm_49cm_CMC_Free(:,Index));
[Xzmp_F(9,:), Yzmp_F(9,:), Pitch_F(9,:)] = sub(Model9_95kg_183cm_51cm_zmp_Free(:,Index), Model9_95kg_183cm_51cm_AC_Free(:,Index), Model9_95kg_183cm_51cm_CMC_Free(:,Index));
[Xzmp_F(10,:), Yzmp_F(10,:), Pitch_F(10,:)] = sub(Model10_91kg_180cm_51cm_zmp_Free(:,Index), Model10_91kg_180cm_51cm_AC_Free(:,Index), Model10_91kg_180cm_51cm_CMC_Free(:,Index));
[Xzmp_F(11,:), Yzmp_F(11,:), Pitch_F(11,:)] = sub(Model11_102kg_185cm_53cm_zmp_Free(:,Index), Model11_102kg_185cm_53cm_AC_Free(:,Index), Model11_102kg_185cm_53cm_CMC_Free(:,Index));
[Xzmp_F(12,:), Yzmp_F(12,:), Pitch_F(12,:)] = sub(Model12_102kg_190cm_52cm_zmp_Free(:,Index), Model12_102kg_190cm_52cm_AC_Free(:,Index), Model12_102kg_190cm_52cm_CMC_Free(:,Index));

%% Disturbed Walking Results per Subjects
[Xzmp_D(1,:), Yzmp_D(1,:), Pitch_D(1,:)] = sub(Model1_89kg_187cm_50cm_zmp_Dist(:,Index), Model1_89kg_187cm_50cm_AC_Dist(:,Index), Model1_89kg_187cm_50cm_CMC_Dist(:,Index));
[Xzmp_D(2,:), Yzmp_D(2,:), Pitch_D(2,:)] = sub(Model2_66kg_181cm_46cm_zmp_Dist(:,Index), Model2_66kg_181cm_46cm_AC_Dist(:,Index), Model2_66kg_181cm_46cm_CMC_Dist(:,Index));
[Xzmp_D(3,:), Yzmp_D(3,:), Pitch_D(3,:)] = sub(Model3_70kg_170cm_47cm_zmp_Dist(:,Index), Model3_70kg_170cm_47cm_AC_Dist(:,Index), Model3_70kg_170cm_47cm_CMC_Dist(:,Index));
[Xzmp_D(4,:), Yzmp_D(4,:), Pitch_D(4,:)] = sub(Model4_80kg_170cm_49cm_zmp_Dist(:,Index), Model4_80kg_170cm_49cm_AC_Dist(:,Index), Model4_80kg_170cm_49cm_CMC_Dist(:,Index));
[Xzmp_D(5,:), Yzmp_D(5,:), Pitch_D(5,:)] = sub(Model5_87kg_177cm_50cm_zmp_Dist(:,Index), Model5_87kg_177cm_50cm_AC_Dist(:,Index), Model5_87kg_177cm_50cm_CMC_Dist(:,Index));
[Xzmp_D(6,:), Yzmp_D(6,:), Pitch_D(6,:)] = sub(Model6_75kg_175cm_47cm_zmp_Dist(:,Index), Model6_75kg_175cm_47cm_AC_Dist(:,Index), Model6_75kg_175cm_47cm_CMC_Dist(:,Index));
[Xzmp_D(7,:), Yzmp_D(7,:), Pitch_D(7,:)] = sub(Model7_80kg_172cm_49cm_zmp_Dist(:,Index), Model7_80kg_172cm_49cm_AC_Dist(:,Index), Model7_80kg_172cm_49cm_CMC_Dist(:,Index));
[Xzmp_D(8,:), Yzmp_D(8,:), Pitch_D(8,:)] = sub(Model8_81kg_183cm_49cm_zmp_Dist(:,Index), Model8_81kg_183cm_49cm_AC_Dist(:,Index), Model8_81kg_183cm_49cm_CMC_Dist(:,Index));
[Xzmp_D(9,:), Yzmp_D(9,:), Pitch_D(9,:)] = sub(Model9_95kg_183cm_51cm_zmp_Dist(:,Index), Model9_95kg_183cm_51cm_AC_Dist(:,Index), Model9_95kg_183cm_51cm_CMC_Dist(:,Index));
[Xzmp_D(10,:), Yzmp_D(10,:), Pitch_D(10,:)] = sub(Model10_91kg_180cm_51cm_zmp_Dist(:,Index), Model10_91kg_180cm_51cm_AC_Dist(:,Index), Model10_91kg_180cm_51cm_CMC_Dist(:,Index));
[Xzmp_D(11,:), Yzmp_D(11,:), Pitch_D(11,:)] = sub(Model11_102kg_185cm_53cm_zmp_Dist(:,Index), Model11_102kg_185cm_53cm_AC_Dist(:,Index), Model11_102kg_185cm_53cm_CMC_Dist(:,Index));
[Xzmp_D(12,:), Yzmp_D(12,:), Pitch_D(12,:)] = sub(Model12_102kg_190cm_52cm_zmp_Dist(:,Index), Model12_102kg_190cm_52cm_AC_Dist(:,Index), Model12_102kg_190cm_52cm_CMC_Dist(:,Index));

%% Generate Tables for ANOVA procedure
S = 1:12;      %Subject index
n = length(S); %Number of Subjects

for i = 1:n
Y_F(S(i),1:9) = [Xzmp_F(S(i),1) Yzmp_F(S(i),1) Pitch_F(S(i),1) Xzmp_F(S(i),2) Yzmp_F(S(i),2) Pitch_F(S(i),2) Xzmp_F(S(i),3) Yzmp_F(S(i),3) Pitch_F(S(i),3)];
end
for i = 1:n
Y_D(S(i),1:9) = [Xzmp_D(S(i),1) Yzmp_D(S(i),1) Pitch_D(S(i),1) Xzmp_D(S(i),2) Yzmp_D(S(i),2) Pitch_D(S(i),2) Xzmp_D(S(i),3) Yzmp_D(S(i),3) Pitch_D(S(i),3)];
end

Sub = ['S01';'S02';'S03';'S04';'S05';'S06';'S07';'S08';'S09';'S10';'S11';'S12'];
Names     = {'Subjects','Xzmp_ZIF','Yzmp_ZIF','Pitch_ZIF','Xzmp_BAC','Yzmp_BAC','Pitch_BAC','Xzmp_CMC','Yzmp_CMC','Pitch_CMC'};

T_F     = table(Sub,Y_F(:,1),Y_F(:,2),Y_F(:,3),Y_F(:,4),Y_F(:,5),Y_F(:,6),Y_F(:,7),Y_F(:,8),Y_F(:,9),'VariableNames',Names);
T_D     = table(Sub,Y_D(:,1),Y_D(:,2),Y_D(:,3),Y_D(:,4),Y_D(:,5),Y_D(:,6),Y_D(:,7),Y_D(:,8),Y_D(:,9),'VariableNames',Names);

save ('TF.mat','T_F'),save ('TD.mat','T_D')