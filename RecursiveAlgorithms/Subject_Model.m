%% Patient Data
l_patient = 1904;%mm
m_patient = 101.68;%kg

ratio = l_patient/1730;
%% Exo Parameters for 190cm human's lower body
% 2 Foot, 3 Hip, 4 Hip Abduction, 5 Shank, 6Thigh
exo_mass = xlsread('Exo Specs\Mass&Inertia.xlsx','Sheet1','D2:D6');
exo_cm = xlsread('Exo Specs\Mass&Inertia.xlsx','Sheet1','E2:G6');
exo_I_xx = xlsread('Exo Specs\Mass&Inertia.xlsx','Sheet1','K2:K6');
exo_I_yy = xlsread('Exo Specs\Mass&Inertia.xlsx','Sheet1','L2:L6');
exo_I_zz = xlsread('Exo Specs\Mass&Inertia.xlsx','Sheet1','M2:M6');

%% Limb Length (mm)

l_lt = ratio*251.7; %lower trunk aka hip
l_th = ratio*520.2; %thigh
l_sh = ratio*393.4; %shank
l_ft = ratio*259.1; %foot
l_tr = (ratio*531.9*55.14/100)-ratio*89.1;
% my_fprintf=(' hip, thigh, shank, foot')
human_L = [l_lt, l_th, l_sh, l_ft];

d0 = l_patient*60/1770; 
d1 = l_patient*101/1770*1.1;
d2 = l_sh;
d3 = l_th;
d4 = d1;
d5 = d1;
d6 = l_lt;
d7 = l_tr;

d= [0 d0;
    1 d1;
    2 d2;
    3 d3;
    4 d4;
    5 d5;
    6 d6
    7 d7];
%% Updated Exo Parameters according to body size

exo_d0_I=  exo_I_xx(1)*ratio^2;
exo_d1_I= 0;
exo_d2_I= exo_I_xx(4)*ratio^2;
exo_d3_I= exo_I_xx(5)*ratio^2;
exo_d4_I= exo_I_xx(3)*ratio^2;
exo_d5_I= 0;
exo_d6_I= exo_I_xx(2)*ratio^2;

%% Limb Mass
m_th = m_patient*0.1416; %thigh
m_sh = m_patient*0.0433; %shank
m_ft = m_patient*0.0137; %foot
m_lt = m_patient*0.1117; %lower trunk aka hip
m_up = m_patient*(0.0694+0.1596+0.1633+2*(0.0271+0.0162+0.0061)); %upper body = head+ arms+ rest of the trunk

%%%%%%%
m_head = m_patient*0.0694;
m_arm = m_patient*0.0271;
m_forearm = m_patient*0.0162;
m_hand = m_patient*0.0061;
m_rest = m_patient*(0.1596+0.1633);
%%%%%%%
human_m = [m_th,m_sh,m_ft,m_lt,m_up];
%% Limb Inertias

%radius of gyration
r_th = [0.329,0.329,0.149] ; %thigh 
r_sh = [0.255,0.249,0.103] ; %shank
r_ft = [0.257,0.245,0.124] ; %foot
r_lt = [0.615,0.551,0.587] ; %lower trunk aka hip
r_tr = [0.372,0.347,0.191] ;

I_th = (m_th)*((l_th*r_th).^2); %thigh
I_sh = (m_sh)*((l_sh*r_sh).^2); %shank
I_ft = (m_ft)*((l_ft*r_ft).^2); %foot
I_lt = (m_lt)*((l_lt*r_lt).^2); %lower trunk aka hip
I_tr = (m_up)*((l_tr*r_tr).^2); %lower trunk aka hip

human_I = [I_th, I_sh,I_ft,I_lt];

%% human inertias 

human_d0_I= I_ft(1);
human_d1_I= 0;
human_d2_I= I_sh(1);
human_d3_I= I_th(1);
human_d4_I= 0;
human_d5_I= 0;
human_d6_I= I_lt(1);
human_d7_I= I_tr(1);

%% total values

total (1) = 0.5*(exo_I_xx(2)+I_lt(1)); %Hip_Ixx
total (2) = 0.5*(exo_I_yy(2)+I_lt(2)); %Hip_Iyy
total (3) = 0.5*(exo_I_zz(2)+I_lt(3)); %Hip_Izz
total (4) = 0.5*(exo_mass(2)+m_lt); %Hip_Mass

total (5) = exo_I_xx(3); %Hip_Abduction_Ixx
total (6) = exo_I_yy(3); %Hip_Abduction_Iyy
total (7) = exo_I_zz(3); %Hip_Abduction_Izz
total (8) = exo_mass(3); %Hip_Abduction_Mass

total (9) = exo_I_xx(5)+I_th(1); %Thigh_Ixx
total (10) = exo_I_yy(5)+I_th(2); %Thigh_Iyy
total (11) = exo_I_zz(5)+I_th(3); %Thigh_Izz
total (12) = exo_mass(5)+m_th; %Thigh_Mass

total (13) = exo_I_xx(4)+I_sh(1); %Shank_Ixx
total (14) = exo_I_yy(4)+I_sh(2); %Shank_Iyy
total (15) = exo_I_zz(4)+I_sh(3); %Shank_Izz
total (16) = exo_mass(4)+m_sh; %Shank_Mass

total (17) = exo_I_xx(1)+I_ft(1); %Foot_Ixx
total (18) = exo_I_yy(1)+I_ft(2); %Foot_Iyy
total (19) = exo_I_zz(1)+I_ft(3); %Foot_Izz
total (20) = exo_mass(1)+m_ft; %Foot_Mass

I_d0 = human_d0_I+exo_d0_I;
I_d1 = human_d1_I+exo_d1_I;
I_d2 = human_d2_I+exo_d2_I;
I_d3 = human_d3_I+exo_d3_I;
I_d4 = human_d4_I+exo_d4_I;
I_d5 = human_d5_I+exo_d5_I;
I_d6 = human_d6_I+exo_d6_I;
I_d7 = human_d7_I;

m_d0 = total (20);
m_d1 = 1;
m_d2 = total (16);
m_d3 = total (12);
m_d4 = total (8);
m_d5 = 1;
m_d6 = total (4)*2;
m_d7 = m_up; 

m_d= [0 m_d0;
    1 m_d1;
    2 m_d2;
    3 m_d3;
    4 m_d4;
    5 m_d5;
    6 m_d6
    7 m_d7];

I_d = [0 I_d0;
    1 I_d1;
    2 I_d2;
    3 I_d3;
    4 I_d4;
    5 I_d5;
    6 I_d6
    7 I_d7];
