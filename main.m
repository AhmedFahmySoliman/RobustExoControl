% This is the main file, used to reproduce the Figures and tables explained
% in the README.md file

%% Generate Figure 1
figure(1); clf
Free_plot_SC1;

%% Generate Figure 2
figure(2); clf
Dist_plot_SC2;

%% Generate Figure 3
figure(3); clf
Mean_Plot;

%% Generate ANOVA table1, and Post-Hoc table1
ANOVA_Test_SC1;

%% Generate ANOVA table2, and Post-Hoc table2
ANOVA_Test_SC2;
