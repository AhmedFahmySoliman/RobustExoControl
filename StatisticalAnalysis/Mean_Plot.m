%% Clear every thing
clear,clc

%% Load Data
Subjects_Table;

ZIF_F = [T_F.Xzmp_ZIF, T_F.Yzmp_ZIF, T_F.Pitch_ZIF]; MZIF_F = mean(ZIF_F); stdZIF_F = 2*std(ZIF_F);
BAC_F = [T_F.Xzmp_BAC, T_F.Yzmp_BAC, T_F.Pitch_BAC]; MBAC_F = mean(BAC_F); stdBAC_F = 2*std(BAC_F);
CMC_F = [T_F.Xzmp_CMC, T_F.Yzmp_CMC, T_F.Pitch_CMC]; MCMC_F = mean(CMC_F); stdCMC_F = 2*std(CMC_F);

ZIF_D = [T_D.Xzmp_ZIF, T_D.Yzmp_ZIF, T_D.Pitch_ZIF]; MZIF_D = mean(ZIF_D); stdZIF_D = 2*std(ZIF_D); 
BAC_D = [T_D.Xzmp_BAC, T_D.Yzmp_BAC, T_D.Pitch_BAC]; MBAC_D = mean(BAC_D); stdBAC_D = 2*std(BAC_D);
CMC_D = [T_D.Xzmp_CMC, T_D.Yzmp_CMC, T_D.Pitch_CMC]; MCMC_D = mean(CMC_D); stdCMC_D = 2*std(CMC_D);

%% Bar plot 

axes('Units', 'normalized', 'Position', [0.1 0.1 0.79 0.85]); %Fill the entire plot

line([3.5 3.5],[0 0.55],'LineWidth',1,'color','k','LineStyle','--'); hold on
F = 18;

w = 0.2;
yyaxis left
h1 = bar((1:6)-w,[MZIF_F(1);MBAC_F(1);MCMC_F(1);MZIF_D(1);MBAC_D(1);MCMC_D(1)],w,'FaceColor','y');
h2 = bar((1:6),[MZIF_F(2);MBAC_F(2);MCMC_F(2);MZIF_D(2);MBAC_D(2);MCMC_D(2)],w,'FaceColor','g');
yyaxis right
h3 = bar((1:6)+w,[MZIF_F(3);MBAC_F(3);MCMC_F(3);MZIF_D(3);MBAC_D(3);MCMC_D(3)],w,'FaceColor','c','basevalue',-0.1);

grid on, box on
x_scale = 1:6;
xticks(x_scale);
yyaxis left
h11 = errorbar(x_scale-w,[MZIF_F(1);MBAC_F(1);MCMC_F(1);MZIF_D(1);MBAC_D(1);MCMC_D(1)],[stdZIF_F(1),stdBAC_F(1),stdCMC_F(1),stdZIF_D(1),stdBAC_D(1),stdCMC_D(1)],'k.','LineWidth',1);
h22 = errorbar(x_scale,[MZIF_F(2);MBAC_F(2);MCMC_F(2);MZIF_D(2);MBAC_D(2);MCMC_D(2)],[stdZIF_F(2),stdBAC_F(2),stdCMC_F(2),stdZIF_D(2),stdBAC_D(2),stdCMC_D(2)],'k.','LineWidth',1);
ylim([0 .55])
xlim([0.5 6.5])
yyaxis right
h33 = errorbar(x_scale+w,[MZIF_F(3);MBAC_F(3);MCMC_F(3);MZIF_D(3);MBAC_D(3);MCMC_D(3)],[stdZIF_F(3),stdBAC_F(3),stdCMC_F(3),stdZIF_D(3),stdBAC_D(3),stdCMC_D(3)],'k.','LineWidth',1);
set(gca,'FontName', 'Times New Roman','FontSize', F,'LineWidth',1,{'ycolor'},{'k'})
ylim([-0.1 1.25])

ylabel('\omega_y^{pp}[rad/sec]','fontsize',F,'FontName','Times New Roman','color','k')

plots2=get(gca, 'Children');
l3 = plots2(2);

yyaxis left
text(0.6,0.44,{'SC#1';'(No disturbance)'},'FontName', 'Times New Roman','FontSize', F,'fontangle','italic')
text(3.55,0.44,{'SC#2';'(With applied disturbances)'},'FontName', 'Times New Roman','FontSize', F,'fontangle','italic')
set(gca,'FontName', 'Times New Roman','FontSize', F,'LineWidth',1,{'ycolor'},{'k'})
plots1=get(gca, 'Children');
l1 = plots1(5); l2 = plots1(6); l4 = plots1(3);
aa1 = {'x_{zmp}','y_{zmp}','\omega_y^{pp}'}; 

HL = legend([l2 l1 l3 l4],{'x_{zmp}^{pp}','y_{zmp}^{pp}','\omega_y^{pp}','95% CI'},'Location','northwest','fontsize',F,'fontangle','italic','NumColumns',4);

newPosition = [0.26 0.84 0.1 0.1];
newUnits = 'normalized';
set(HL,'Position', newPosition,'Units', newUnits);

set(gca,'XTickLabel',{'ZIF','BAC','CMC','ZIF','BAC','CMC'},'fontsize',F,'FontName', 'Times New Roman')
ylabel('x_{zmp}^{pp},y_{zmp}^{pp}[m]','fontsize',F,'FontName', 'Times New Roman','color','k')

set(gcf, 'Units', 'Normalized', 'OuterPosition', [0.1, 0.1, 0.7, 0.7]);

