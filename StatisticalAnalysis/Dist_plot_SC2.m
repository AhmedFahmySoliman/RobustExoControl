%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The code used to obtain the averaged+/-SD plot for Xzmp, Yzmp, and pitch 
% orientation obtained by 12 different subjects wearing the lower-body 
% exoskeleton under the effect of three controllers.
% The plot is obtained for walking scenario #2.
% For more details, refer to the paper.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Clear every thing
clear, clc

Load_Results;

t = Model1_89kg_187cm_50cm_CMC_Dist(1,1:end-1);

%% Data Extraction

xbu     = Model3_70kg_170cm_47cm_CMC_Dist(15,1:end-1);
xbl     = Model3_70kg_170cm_47cm_CMC_Dist(16,1:end-1);
ybu     = Model3_70kg_170cm_47cm_CMC_Dist(18,1:end-1);
ybl     = Model3_70kg_170cm_47cm_CMC_Dist(19,1:end-1);

xzmp_1 = Model1_89kg_187cm_50cm_CMC_Dist(14,:);
yzmp_1 = Model1_89kg_187cm_50cm_CMC_Dist(17,:);
xzmp_2 = Model2_66kg_181cm_46cm_CMC_Dist(14,:);
yzmp_2 = Model2_66kg_181cm_46cm_CMC_Dist(17,:);
xzmp_3 = Model3_70kg_170cm_47cm_CMC_Dist(14,:);
yzmp_3 = Model3_70kg_170cm_47cm_CMC_Dist(17,:);
xzmp_4 = Model4_80kg_170cm_49cm_CMC_Dist(14,:);
yzmp_4 = Model4_80kg_170cm_49cm_CMC_Dist(17,:);
xzmp_5 = Model5_87kg_177cm_50cm_CMC_Dist(14,:);
yzmp_5 = Model5_87kg_177cm_50cm_CMC_Dist(17,:);
xzmp_6 = Model6_75kg_175cm_47cm_CMC_Dist(14,:);
yzmp_6 = Model6_75kg_175cm_47cm_CMC_Dist(17,:);
xzmp_7 = Model7_80kg_172cm_49cm_CMC_Dist(14,:);
yzmp_7 = Model7_80kg_172cm_49cm_CMC_Dist(17,:);
xzmp_8 = Model8_81kg_183cm_49cm_CMC_Dist(14,:);
yzmp_8 = Model8_81kg_183cm_49cm_CMC_Dist(17,:);
xzmp_9 = Model9_95kg_183cm_51cm_CMC_Dist(14,:);
yzmp_9 = Model9_95kg_183cm_51cm_CMC_Dist(17,:);
xzmp_10 = Model10_91kg_180cm_51cm_CMC_Dist(14,:);
yzmp_10 = Model10_91kg_180cm_51cm_CMC_Dist(17,:);
xzmp_11 = Model11_102kg_185cm_53cm_CMC_Dist(14,:);
yzmp_11 = Model11_102kg_185cm_53cm_CMC_Dist(17,:);
xzmp_12 = Model12_102kg_190cm_52cm_CMC_Dist(14,:);
yzmp_12 = Model12_102kg_190cm_52cm_CMC_Dist(17,:);

Pori_1 = 100*diff(Model1_89kg_187cm_50cm_CMC_Dist(24,:));
Pori_2 = 100*diff(Model2_66kg_181cm_46cm_CMC_Dist(24,:));
Pori_3 = 100*diff(Model3_70kg_170cm_47cm_CMC_Dist(24,:));
Pori_4 = 100*diff(Model4_80kg_170cm_49cm_CMC_Dist(24,:));
Pori_5 = 100*diff(Model5_87kg_177cm_50cm_CMC_Dist(24,:));
Pori_6 = 100*diff(Model6_75kg_175cm_47cm_CMC_Dist(24,:));
Pori_7 = 100*diff(Model7_80kg_172cm_49cm_CMC_Dist(24,:));
Pori_8 = 100*diff(Model8_81kg_183cm_49cm_CMC_Dist(24,:));
Pori_9 = 100*diff(Model9_95kg_183cm_51cm_CMC_Dist(24,:));
Pori_10 = 100*diff(Model10_91kg_180cm_51cm_CMC_Dist(24,:));
Pori_11 = 100*diff(Model11_102kg_185cm_53cm_CMC_Dist(24,:));
Pori_12 = 100*diff(Model12_102kg_190cm_52cm_CMC_Dist(24,:));

xzmp_1_ZIF = Model1_89kg_187cm_50cm_zmp_Dist(14,:);
yzmp_1_ZIF = Model1_89kg_187cm_50cm_zmp_Dist(17,:);
xzmp_2_ZIF = Model2_66kg_181cm_46cm_zmp_Dist(14,:);
yzmp_2_ZIF = Model2_66kg_181cm_46cm_zmp_Dist(17,:);
xzmp_3_ZIF = Model3_70kg_170cm_47cm_zmp_Dist(14,:);
yzmp_3_ZIF = Model3_70kg_170cm_47cm_zmp_Dist(17,:);
xzmp_4_ZIF = Model4_80kg_170cm_49cm_zmp_Dist(14,:);
yzmp_4_ZIF = Model4_80kg_170cm_49cm_zmp_Dist(17,:);
xzmp_5_ZIF = Model5_87kg_177cm_50cm_zmp_Dist(14,:);
yzmp_5_ZIF = Model5_87kg_177cm_50cm_zmp_Dist(17,:);
xzmp_6_ZIF = Model6_75kg_175cm_47cm_zmp_Dist(14,:);
yzmp_6_ZIF = Model6_75kg_175cm_47cm_zmp_Dist(17,:);
xzmp_7_ZIF = Model7_80kg_172cm_49cm_zmp_Dist(14,:);
yzmp_7_ZIF = Model7_80kg_172cm_49cm_zmp_Dist(17,:);
xzmp_8_ZIF = Model8_81kg_183cm_49cm_zmp_Dist(14,:);
yzmp_8_ZIF = Model8_81kg_183cm_49cm_zmp_Dist(17,:);
xzmp_9_ZIF = Model9_95kg_183cm_51cm_zmp_Dist(14,:);
yzmp_9_ZIF = Model9_95kg_183cm_51cm_zmp_Dist(17,:);
xzmp_10_ZIF = Model10_91kg_180cm_51cm_zmp_Dist(14,:);
yzmp_10_ZIF = Model10_91kg_180cm_51cm_zmp_Dist(17,:);
xzmp_11_ZIF = Model11_102kg_185cm_53cm_zmp_Dist(14,:);
yzmp_11_ZIF = Model11_102kg_185cm_53cm_zmp_Dist(17,:);
xzmp_12_ZIF = Model12_102kg_190cm_52cm_zmp_Dist(14,:);
yzmp_12_ZIF = Model12_102kg_190cm_52cm_zmp_Dist(17,:);

Pori_1_ZIF = 100*diff(Model1_89kg_187cm_50cm_zmp_Dist(24,:));
Pori_2_ZIF = 100*diff(Model2_66kg_181cm_46cm_zmp_Dist(24,:));
Pori_3_ZIF = 100*diff(Model3_70kg_170cm_47cm_zmp_Dist(24,:));
Pori_4_ZIF = 100*diff(Model4_80kg_170cm_49cm_zmp_Dist(24,:));
Pori_5_ZIF = 100*diff(Model5_87kg_177cm_50cm_zmp_Dist(24,:));
Pori_6_ZIF = 100*diff(Model6_75kg_175cm_47cm_zmp_Dist(24,:));
Pori_7_ZIF = 100*diff(Model7_80kg_172cm_49cm_zmp_Dist(24,:));
Pori_8_ZIF = 100*diff(Model8_81kg_183cm_49cm_zmp_Dist(24,:));
Pori_9_ZIF = 100*diff(Model9_95kg_183cm_51cm_zmp_Dist(24,:));
Pori_10_ZIF = 100*diff(Model10_91kg_180cm_51cm_zmp_Dist(24,:));
Pori_11_ZIF = 100*diff(Model11_102kg_185cm_53cm_zmp_Dist(24,:));
Pori_12_ZIF = 100*diff(Model12_102kg_190cm_52cm_zmp_Dist(24,:));

xzmp_1_BAC = Model1_89kg_187cm_50cm_AC_Dist(14,:);
yzmp_1_BAC = Model1_89kg_187cm_50cm_AC_Dist(17,:);
xzmp_2_BAC = Model2_66kg_181cm_46cm_AC_Dist(14,:);
yzmp_2_BAC = Model2_66kg_181cm_46cm_AC_Dist(17,:);
xzmp_3_BAC = Model3_70kg_170cm_47cm_AC_Dist(14,:);
yzmp_3_BAC = Model3_70kg_170cm_47cm_AC_Dist(17,:);
xzmp_4_BAC = Model4_80kg_170cm_49cm_AC_Dist(14,:);
yzmp_4_BAC = Model4_80kg_170cm_49cm_AC_Dist(17,:);
xzmp_5_BAC = Model5_87kg_177cm_50cm_AC_Dist(14,:);
yzmp_5_BAC = Model5_87kg_177cm_50cm_AC_Dist(17,:);
xzmp_6_BAC = Model6_75kg_175cm_47cm_AC_Dist(14,:);
yzmp_6_BAC = Model6_75kg_175cm_47cm_AC_Dist(17,:);
xzmp_7_BAC = Model7_80kg_172cm_49cm_AC_Dist(14,:);
yzmp_7_BAC = Model7_80kg_172cm_49cm_AC_Dist(17,:);
xzmp_8_BAC = Model8_81kg_183cm_49cm_AC_Dist(14,:);
yzmp_8_BAC = Model8_81kg_183cm_49cm_AC_Dist(17,:);
xzmp_9_BAC = Model9_95kg_183cm_51cm_AC_Dist(14,:);
yzmp_9_BAC = Model9_95kg_183cm_51cm_AC_Dist(17,:);
xzmp_10_BAC = Model10_91kg_180cm_51cm_AC_Dist(14,:);
yzmp_10_BAC = Model10_91kg_180cm_51cm_AC_Dist(17,:);
xzmp_11_BAC = Model11_102kg_185cm_53cm_AC_Dist(14,:);
yzmp_11_BAC = Model11_102kg_185cm_53cm_AC_Dist(17,:);
xzmp_12_BAC = Model12_102kg_190cm_52cm_AC_Dist(14,:);
yzmp_12_BAC = Model12_102kg_190cm_52cm_AC_Dist(17,:);

Pori_1_BAC = 100*diff(Model1_89kg_187cm_50cm_AC_Dist(24,:));
Pori_2_BAC = 100*diff(Model2_66kg_181cm_46cm_AC_Dist(24,:));
Pori_3_BAC = 100*diff(Model3_70kg_170cm_47cm_AC_Dist(24,:));
Pori_4_BAC = 100*diff(Model4_80kg_170cm_49cm_AC_Dist(24,:));
Pori_5_BAC = 100*diff(Model5_87kg_177cm_50cm_AC_Dist(24,:));
Pori_6_BAC = 100*diff(Model6_75kg_175cm_47cm_AC_Dist(24,:));
Pori_7_BAC = 100*diff(Model7_80kg_172cm_49cm_AC_Dist(24,:));
Pori_8_BAC = 100*diff(Model8_81kg_183cm_49cm_AC_Dist(24,:));
Pori_9_BAC = 100*diff(Model9_95kg_183cm_51cm_AC_Dist(24,:));
Pori_10_BAC = 100*diff(Model10_91kg_180cm_51cm_AC_Dist(24,:));
Pori_11_BAC = 100*diff(Model11_102kg_185cm_53cm_AC_Dist(24,:));
Pori_12_BAC = 100*diff(Model12_102kg_190cm_52cm_AC_Dist(24,:));

%% Disturbances
Dx = Model12_102kg_190cm_52cm_CMC_Dist(26,1:end-1);
Dy = Model12_102kg_190cm_52cm_CMC_Dist(27,1:end-1);

for i = 1:length(t)
    xzmp_mean(i) = mean([xzmp_1(i),xzmp_2(i),xzmp_3(i),xzmp_4(i),xzmp_5(i),xzmp_6(i),xzmp_7(i),xzmp_8(i),xzmp_9(i),xzmp_10(i),xzmp_11(i),xzmp_12(i)]);
    xzmp_std(i)  = std([xzmp_1(i),xzmp_2(i),xzmp_3(i),xzmp_4(i),xzmp_5(i),xzmp_6(i),xzmp_7(i),xzmp_8(i),xzmp_9(i),xzmp_10(i),xzmp_11(i),xzmp_12(i)]);
    xzmp_max(i)  = xzmp_mean(i)+xzmp_std(i);
    xzmp_min(i)  = xzmp_mean(i)-xzmp_std(i);
    
    yzmp_mean(i) = mean([yzmp_1(i),yzmp_2(i),yzmp_3(i),yzmp_4(i),yzmp_5(i),yzmp_6(i),yzmp_7(i),yzmp_8(i),yzmp_9(i),yzmp_10(i),yzmp_11(i),yzmp_12(i)]);
    yzmp_std(i)  = std([yzmp_1(i),yzmp_2(i),yzmp_3(i),yzmp_4(i),yzmp_5(i),yzmp_6(i),yzmp_7(i),yzmp_8(i),yzmp_9(i),yzmp_10(i),yzmp_11(i),yzmp_12(i)]);
    yzmp_max(i)  = yzmp_mean(i)+yzmp_std(i);
    yzmp_min(i)  = yzmp_mean(i)-yzmp_std(i);
    
    Pori_mean(i) = mean([Pori_1(i),Pori_2(i),Pori_3(i),Pori_4(i),Pori_5(i),Pori_6(i),Pori_7(i),Pori_8(i),Pori_9(i),Pori_10(i),Pori_11(i),Pori_12(i)]);
    Pori_std(i)  = std([Pori_1(i),Pori_2(i),Pori_3(i),Pori_4(i),Pori_5(i),Pori_6(i),Pori_7(i),Pori_8(i),Pori_9(i),Pori_10(i),Pori_11(i),Pori_12(i)]);
    Pori_max(i)  = Pori_mean(i)+Pori_std(i);
    Pori_min(i)  = Pori_mean(i)-Pori_std(i);
end

for i = 1:length(t)
    xzmp_mean_ZIF(i) = mean([xzmp_1_ZIF(i),xzmp_2_ZIF(i),xzmp_3_ZIF(i),xzmp_4_ZIF(i),xzmp_5_ZIF(i),xzmp_6_ZIF(i),xzmp_7_ZIF(i),xzmp_8_ZIF(i),xzmp_9_ZIF(i),xzmp_10_ZIF(i),xzmp_11_ZIF(i),xzmp_12_ZIF(i)]);
    xzmp_std_ZIF(i)  = std([xzmp_1_ZIF(i),xzmp_2_ZIF(i),xzmp_3_ZIF(i),xzmp_4_ZIF(i),xzmp_5_ZIF(i),xzmp_6_ZIF(i),xzmp_7_ZIF(i),xzmp_8_ZIF(i),xzmp_9_ZIF(i),xzmp_10_ZIF(i),xzmp_11_ZIF(i),xzmp_12_ZIF(i)]);
    xzmp_max_ZIF(i)  = xzmp_mean_ZIF(i)+xzmp_std_ZIF(i);
    xzmp_min_ZIF(i)  = xzmp_mean_ZIF(i)-xzmp_std_ZIF(i);
    
    yzmp_mean_ZIF(i) = mean([yzmp_1_ZIF(i),yzmp_2_ZIF(i),yzmp_3_ZIF(i),yzmp_4_ZIF(i),yzmp_5_ZIF(i),yzmp_6_ZIF(i),yzmp_7_ZIF(i),yzmp_8_ZIF(i),yzmp_9_ZIF(i),yzmp_10_ZIF(i),yzmp_11_ZIF(i),yzmp_12_ZIF(i)]);
    yzmp_std_ZIF(i)  = std([yzmp_1_ZIF(i),yzmp_2_ZIF(i),yzmp_3_ZIF(i),yzmp_4_ZIF(i),yzmp_5_ZIF(i),yzmp_6_ZIF(i),yzmp_7_ZIF(i),yzmp_8_ZIF(i),yzmp_9_ZIF(i),yzmp_10_ZIF(i),yzmp_11_ZIF(i),yzmp_12_ZIF(i)]);
    yzmp_max_ZIF(i)  = yzmp_mean_ZIF(i)+yzmp_std_ZIF(i);
    yzmp_min_ZIF(i)  = yzmp_mean_ZIF(i)-yzmp_std_ZIF(i);
    
    Pori_mean_ZIF(i) = mean([Pori_1_ZIF(i),Pori_2_ZIF(i),Pori_3_ZIF(i),Pori_4_ZIF(i),Pori_5_ZIF(i),Pori_6_ZIF(i),Pori_7_ZIF(i),Pori_8_ZIF(i),Pori_9_ZIF(i),Pori_10_ZIF(i),Pori_11_ZIF(i),Pori_12_ZIF(i)]);
    Pori_std_ZIF(i)  = std([Pori_1_ZIF(i),Pori_2_ZIF(i),Pori_3_ZIF(i),Pori_4_ZIF(i),Pori_5_ZIF(i),Pori_6_ZIF(i),Pori_7_ZIF(i),Pori_8_ZIF(i),Pori_9_ZIF(i),Pori_10_ZIF(i),Pori_11_ZIF(i),Pori_12_ZIF(i)]);
    Pori_max_ZIF(i)  = Pori_mean_ZIF(i)+Pori_std_ZIF(i);
    Pori_min_ZIF(i)  = Pori_mean_ZIF(i)-Pori_std_ZIF(i);
end

for i = 1:length(t)
    xzmp_mean_BAC(i) = mean([xzmp_1_BAC(i),xzmp_2_BAC(i),xzmp_3_BAC(i),xzmp_4_BAC(i),xzmp_5_BAC(i),xzmp_6_BAC(i),xzmp_7_BAC(i),xzmp_8_BAC(i),xzmp_9_BAC(i),xzmp_10_BAC(i),xzmp_11_BAC(i),xzmp_12_BAC(i)]);
    xzmp_std_BAC(i)  = std([xzmp_1_BAC(i),xzmp_2_BAC(i),xzmp_3_BAC(i),xzmp_4_BAC(i),xzmp_5_BAC(i),xzmp_6_BAC(i),xzmp_7_BAC(i),xzmp_8_BAC(i),xzmp_9_BAC(i),xzmp_10_BAC(i),xzmp_11_BAC(i),xzmp_12_BAC(i)]);
    xzmp_max_BAC(i)  = xzmp_mean_BAC(i)+xzmp_std_BAC(i);
    xzmp_min_BAC(i)  = xzmp_mean_BAC(i)-xzmp_std_BAC(i);
    
    yzmp_mean_BAC(i) = mean([yzmp_1_BAC(i),yzmp_2_BAC(i),yzmp_3_BAC(i),yzmp_4_BAC(i),yzmp_5_BAC(i),yzmp_6_BAC(i),yzmp_7_BAC(i),yzmp_8_BAC(i),yzmp_9_BAC(i),yzmp_10_BAC(i),yzmp_11_BAC(i),yzmp_12_BAC(i)]);
    yzmp_std_BAC(i)  = std([yzmp_1_BAC(i),yzmp_2_BAC(i),yzmp_3_BAC(i),yzmp_4_BAC(i),yzmp_5_BAC(i),yzmp_6_BAC(i),yzmp_7_BAC(i),yzmp_8_BAC(i),yzmp_9_BAC(i),yzmp_10_BAC(i),yzmp_11_BAC(i),yzmp_12_BAC(i)]);
    yzmp_max_BAC(i)  = yzmp_mean_BAC(i)+yzmp_std_BAC(i);
    yzmp_min_BAC(i)  = yzmp_mean_BAC(i)-yzmp_std_BAC(i);
    
    Pori_mean_BAC(i) = mean([Pori_1_BAC(i),Pori_2_BAC(i),Pori_3_BAC(i),Pori_4_BAC(i),Pori_5_BAC(i),Pori_6_BAC(i),Pori_7_BAC(i),Pori_8_BAC(i),Pori_9_BAC(i),Pori_10_BAC(i),Pori_11_BAC(i),Pori_12_BAC(i)]);
    Pori_std_BAC(i)  = std([Pori_1_BAC(i),Pori_2_BAC(i),Pori_3_BAC(i),Pori_4_BAC(i),Pori_5_BAC(i),Pori_6_BAC(i),Pori_7_BAC(i),Pori_8_BAC(i),Pori_9_BAC(i),Pori_10_BAC(i),Pori_11_BAC(i),Pori_12_BAC(i)]);
    Pori_max_BAC(i)  = Pori_mean_BAC(i)+Pori_std_BAC(i);
    Pori_min_BAC(i)  = Pori_mean_BAC(i)-Pori_std_BAC(i);
end

%% Plot data
% 
L = length(t)-1;

X_Limit = [10.36 15.13];

a3 = subplot(3,1,3); hold on
p1 = patch([5.6 5.75 5.75 5.6],[-0.395 -0.395 0.395 0.395],'g');p1.FaceColor = [0.85 0.85 0.85];p1.EdgeColor = 'none';, hold on
p2 = patch([7.4 7.55 7.55 7.4],[-0.395 -0.395 0.395 0.395],'g');p2.FaceColor = [0.85 0.85 0.85];p2.EdgeColor = 'none';
p3 = patch([10.6 10.75 10.75 10.6],[-0.395 -0.395 0.395 0.395],'g');p3.FaceColor = [0.85 0.85 0.85];p3.EdgeColor = 'none';
p4 = patch([12.4 12.55 12.55 12.4],[-0.395 -0.395 0.395 0.395],'g');p4.FaceColor = [0.85 0.85 0.85];p4.EdgeColor = 'none';

for i = 1:L-1    %CMC SD
    y = [Pori_min(i) Pori_min(i+1) Pori_max(i+1) Pori_max(i)];
    x = [t(i) t(i+1) t(i+1) t(i)];
    p = patch(x,y,'b');
    p.FaceColor = [0.5,0.85,1];      
    p.EdgeColor = 'none';
end
for i = 1:L-1    % BAC SD 
    y_BAC = [Pori_min_BAC(i) Pori_min_BAC(i+1) Pori_max_BAC(i+1) Pori_max_BAC(i)];
    x_BAC = [t(i) t(i+1) t(i+1) t(i)];
    p = patch(x_BAC,y_BAC,'b'); 
    p.FaceColor = [0.48,1,0];      
    p.EdgeColor = 'none';
end
for i = 1:L-1    %ZIF SD
    y_ZIF = [Pori_min_ZIF(i) Pori_min_ZIF(i+1) Pori_max_ZIF(i+1) Pori_max_ZIF(i)];
    x_ZIF = [t(i) t(i+1) t(i+1) t(i)];
    p = patch(x_ZIF,y_ZIF,'b');
    p.FaceColor = [0.98,0.71,0.82];      
    p.EdgeColor = 'none';
end

plot(t,Pori_mean_BAC,'color',[0,0.6,0],'Linewidth',1), 
plot(t,Pori_mean,'b','Linewidth',1), plot(t,Pori_mean_ZIF,'r','Linewidth',1), hold off, grid on, box on
set(gca,'FontName', 'Times New Roman','FontSize', 12,'LineWidth',1)
a3_pos = get(a3,'Position');
set(a3,'Position',[a3_pos(1) a3_pos(2)+0.03 a3_pos(3)+0.07 a3_pos(4)+0.05])
ylabel('\omega_{pitch} [rad/s]')
ylim([-0.4 0.4]), yticks([-0.3 0 0.3])
xlim(X_Limit),xlabel('Time[s]')

a2 = subplot(3,1,2); hold on
p1 = patch([5.6 5.75 5.75 5.6],[-0.185 -0.185 0.185 0.185],'g');p1.FaceColor = [0.85 0.85 0.85];p1.EdgeColor = 'none';, hold on
p2 = patch([7.4 7.55 7.55 7.4],[-0.185 -0.185 0.185 0.185],'g');p2.FaceColor = [0.85 0.85 0.85];p2.EdgeColor = 'none';
p3 = patch([10.6 10.75 10.75 10.6],[-0.185 -0.185 0.185 0.185],'g');p3.FaceColor = [0.85 0.85 0.85];p3.EdgeColor = 'none';
p4 = patch([12.4 12.55 12.55 12.4],[-0.185 -0.185 0.185 0.185],'g');p4.FaceColor = [0.85 0.85 0.85];p4.EdgeColor = 'none';

for i = 1:L-1    %CMC SD
    y = [yzmp_min(i) yzmp_min(i+1) yzmp_max(i+1) yzmp_max(i)];
    x = [t(i) t(i+1) t(i+1) t(i)];
    p = patch(x,y,'b');
    p.FaceColor = [0.5,0.85,1];      
    p.EdgeColor = 'none';
end
for i = 1:L-1    % BAC SD 
    y_BAC = [yzmp_min_BAC(i) yzmp_min_BAC(i+1) yzmp_max_BAC(i+1) yzmp_max_BAC(i)];
    x_BAC = [t(i) t(i+1) t(i+1) t(i)];
    p = patch(x_BAC,y_BAC,'b'); 
    p.FaceColor = [0.48,1,0];      
    p.EdgeColor = 'none';
end
for i = 1:L-1    %ZIF SD
    y_ZIF = [yzmp_min_ZIF(i) yzmp_min_ZIF(i+1) yzmp_max_ZIF(i+1) yzmp_max_ZIF(i)];
    x_ZIF = [t(i) t(i+1) t(i+1) t(i)];
    p = patch(x_ZIF,y_ZIF,'b');
    p.FaceColor = [0.98,0.71,0.82];      
    p.EdgeColor = 'none';
end

plot(t,yzmp_mean_BAC,'color',[0,0.6,0],'Linewidth',1), 
plot(t,yzmp_mean,'b','Linewidth',1), plot(t,yzmp_mean_ZIF,'r','Linewidth',1)
plot(t,ybu,'k','Linewidth',1), plot(t,ybl,'k','Linewidth',1), hold off, grid on, box on
set(gca,'FontName', 'Times New Roman','FontSize', 12,'LineWidth',1)
a2_pos = get(a2,'Position');
set(a2,'Position',[a2_pos(1) a2_pos(2) a2_pos(3)+0.07 a2_pos(4)+0.05])
ylabel('y_{zmp}[m]')
ylim([-0.19 0.19]), yticks([-0.15 0 0.15])
xlim(X_Limit),set(a2,'xticklabel',[])

a1 = subplot(3,1,1);
p1 = patch([5.6 5.75 5.75 5.6],[-0.265 -0.265 0.265 0.265],'g');p1.FaceColor = [0.85 0.85 0.85];p1.EdgeColor = 'none'; hold on
p2 = patch([7.4 7.55 7.55 7.4],[-0.265 -0.265 0.265 0.265],'g');p2.FaceColor = [0.85 0.85 0.85];p2.EdgeColor = 'none';
p3 = patch([10.6 10.75 10.75 10.6],[-0.265 -0.265 0.265 0.265],'g');p3.FaceColor = [0.85 0.85 0.85];p3.EdgeColor = 'none';
p4 = patch([12.4 12.55 12.55 12.4],[-0.265 -0.265 0.265 0.265],'g');p4.FaceColor = [0.85 0.85 0.85];p4.EdgeColor = 'none';

for i = 1:L-1    %CMC SD
    y = [xzmp_min(i) xzmp_min(i+1) xzmp_max(i+1) xzmp_max(i)];
    x = [t(i) t(i+1) t(i+1) t(i)];
    p = patch(x,y,'b');
    p.FaceColor = [0.5,0.85,1];      
    p.EdgeColor = 'none';
end
for i = 1:L-1    % BAC SD
    y_BAC = [xzmp_min_BAC(i) xzmp_min_BAC(i+1) xzmp_max_BAC(i+1) xzmp_max_BAC(i)];
    x_BAC = [t(i) t(i+1) t(i+1) t(i)];
    p = patch(x_BAC,y_BAC,'b');
    p.FaceColor = [0.48,1,0];      
    p.EdgeColor = 'none';
end
for i = 1:L-1    %ZIF SD
    y_ZIF = [xzmp_min_ZIF(i) xzmp_min_ZIF(i+1) xzmp_max_ZIF(i+1) xzmp_max_ZIF(i)];
    x_ZIF = [t(i) t(i+1) t(i+1) t(i)];
    p = patch(x_ZIF,y_ZIF,'b');
    p.FaceColor = [0.98,0.71,0.82];      
    p.EdgeColor = 'none';
end

plot(t,xzmp_mean_BAC,'color',[0,0.6,0],'Linewidth',1),
plot(t,xzmp_mean,'b','Linewidth',1), plot(t,xzmp_mean_ZIF,'r','Linewidth',1) 
plot(t,xbu,'k','Linewidth',1), plot(t,xbl,'k','Linewidth',1), hold off, grid on, box on
set(gca,'FontName', 'Times New Roman','FontSize', 12,'LineWidth',1)
ylabel('x_{zmp}[m]')
ylim([-0.27 0.27]), yticks([-0.25 0 0.25])
xlim(X_Limit),
a1_pos = get(a1,'Position');
set(a1,'xticklabel',[])
set(a1,'Position',[a1_pos(1) a1_pos(2)-0.032 a1_pos(3)+0.07 a1_pos(4)+0.05])

plots1=get(gca, 'Children');
l1 = plots1(4); l2 = plots1(5); l3 = plots1(3);
hl=legend([l1 l2 l3],{'CMC','BAC','ZIF'},'location','southeast','NumColumns',3);
newPosition = [0.725 0.67 0.1 0.03];
newUnits = 'normalized';
set(hl,'Position', newPosition,'Units', newUnits);

x0=0;
y0=0;
width=580;
height=350;
set(gcf,'position',[x0,y0,width,height])
