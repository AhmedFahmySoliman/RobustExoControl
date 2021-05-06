
n = 8+6; %number of rigid bodies pluse 6 Dof fictitios joint

%% Physical Parameters

Lf = 0.01; La = 0.0719; Ll = 0.001*432; Lth = 0.001*570; Lhf = 0.001*119; Lhl = 0.001*119.2; Lw = 0.001*276; 
Lb = 0.001*270; Ltf = 0.001*119.3; Lsh = Ll; Lm = 0.0625; Lf_lat = 0.1747; L_torso = 0.2243;

m_foot = m_d(1,2); m_ankle = m_d(2,2); m_hf = m_d(5,2); m_hl = m_d(6,2);
m_m  = 2.85; m_sh = m_d(3,2); m_ub = m_d(8,2); m_th = m_d(4,2); 
m_waist = m_d(7,2); m_tt = 0.9371; m_t = 0.5; 

%% Individual Link Inertias (kg.m^2)
I_f= I_d(1,2)*(10E-7)*diag([0.5,0.5,1]); I_ankle= diag([1E-05,1E-05,0]); I_sh= I_d(3,2)*(10E-7)*diag([0.5,0.5,1]);
I_th= I_d(4,2)*(10E-7)*diag([0.5,0.5,1]); I_hf= 0*diag([0.5,1,0.5]); I_hl= 0*diag([0.5,1,0.5]);
I_waist= I_d(7,2)*(10E-7)*diag([1,0.5,0.5]); I_ub= 2.4*(m_patient/85)*diag([1,1,1]); I_m= diag([0.004,0.004,0.003]);
I_tt = diag([1.8987E-3, 1.8117E-3, 1.4944E-4]);
I_t  = diag([1E-7 1E-7 1E-7]);

I_c{1}         = zeros(6,6);
I_c{2}         = zeros(6,6);
I_c{3}         = zeros(6,6);
I_c{4}         = zeros(6,6);
I_c{5}         = zeros(6,6);

I_c{6}         = spat_I(I_waist,m_waist,[0,0,0]) + spat_I(I_ub,m_ub,[Ltf,0,L_torso])...
                 + spat_I(I_m,m_m,[-Lm,-Lw/2,0]) + spat_I(I_m,m_m,[-Lm,Lw/2,0])...
                 + spat_I(I_t,m_t,[Ltf,0,0.1142]) + spat_I(I_tt,m_tt,[0.0596,0,0]);

I_c{1+6}       = spat_I(I_hl,m_hl,[0,-Lhl/2,0]) + spat_I(I_hf,m_hf,[0,-Lhl,Lhf/2]) + 3*spat_I(I_m,m_m,[0,-(Lhl+Lm),Lhf]);
I_c{2+6}       = spat_I(I_th,m_th,[Lth/2,0,0]);
I_c{3+6}       = spat_I(I_sh,m_sh,[Lsh/2,0,0]);
I_c{4+6}       = spat_I(I_ankle,m_ankle,[0,0,-Lhl/2]) + spat_I(I_f,m_foot,[La,-Lf,-Lf_lat]);
I_c{5+6}       = spat_I(I_hl,m_hl,[0,Lhl/2,0]) + spat_I(I_hf,m_hf,[0,Lhl,-Lhf/2]) + 3*spat_I(I_m,m_m,[0,(Lhl+Lm),-Lhf]);
I_c{6+6}       = spat_I(I_th,m_th,[-Lth/2,0,0]);
I_c{7+6}       = spat_I(I_sh,m_sh,[-Lsh/2,0,0]);
I_c{8+6}       = spat_I(I_ankle,m_ankle,[0,0,Lhl/2]) + spat_I(I_f,m_foot,[-La,Lf,Lf_lat]);

%% Joint type
pitch(1) = inf;  %prismatic joint
pitch(2) = inf;  %prismatic joint
pitch(3) = inf;  %prismatic joint
pitch(4) = 0;    %revolute joint
pitch(5) = 0;    %revolute joint
pitch(6) = 0;    %revolute joint

pitch(1+6) = 0;  %revolute joint
pitch(2+6) = 0;  %revolute joint
pitch(3+6) = 0;  %revolute joint
pitch(4+6) = 0;  %revolute joint
pitch(5+6) = 0;  %revolute joint
pitch(6+6) = 0;  %revolute joint
pitch(7+6) = 0;  %revolute joint
pitch(8+6) = 0;  %revolute joint

%% Model Tree

model.tree{1} = eye(6,6); % Displacment w.r.t the prior frame
model.tree{2} = eye(6,6);  
model.tree{3} = eye(6,6);  
model.tree{4} = eye(6,6);
model.tree{5} = eye(6,6); % Displacment w.r.t the prior frame
model.tree{6} = eye(6,6);

model.tree{1+6} = roty(pi/2)*xlt(0,-Lw/2,0); % Displacment w.r.t the prior frame
model.tree{2+6} = rotx(pi/2)*xlt(0,-Lhf,Lhl);  
model.tree{3+6} = xlt(Lth,0,0);  
model.tree{4+6} = xlt(Lsh,0,0);
model.tree{5+6} = roty(-pi/2)*xlt(0,Lw/2,0); % Displacment w.r.t the prior frame
model.tree{6+6} = rotx(pi/2)*xlt(0,Lhl,-Lhf);   
model.tree{7+6} = xlt(-Lth,0,0);  
model.tree{8+6} = xlt(-Lsh,0,0);

for i = 1:n
Tree(:,:,i) = model.tree{i};
end

%% Parent Model
parent = [0 1 2 3 0 5 6 7];

%% Children Model
child = [2 3 4 0 6 7 8 0];

%% Inertia matrix
for i = 1:n
I(:,:,i) = I_c{i};
end
