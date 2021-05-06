%% %%%%%%%% Code identification section
% The code used to run recursive Algorithms used to obtain kinematic and 
% dynamic models
% The first section: used to run modified Newton Euler algorithm to obtain 
% the % dynamic model parameters H(q), C(q,dq), G(q) for an arbitrary 
% floating base posture.
% The second section: used to run the recursive forward kinematics algorithm
% to obtain the transformation, Jacobian, and rate of change of Jacobian
% matrices.

%% Clear every thing
clear, clc, close all

%% Load subject model
Subject_Model;
Kinematic_Tree;

%% Define an arbitrary posture 
Xfb = [1,zeros(1,5);
       0,0.9965,-0.08366,zeros(1,3);
       0,0.08366,0.9965,zeros(1,3);
       0,0.9803,0.00017,1,0,0;
      -0.9769,0.09119,1.086,0,0.9965,-0.08366;
      -0.08244,-1.086,0.09114,0,0.08366,0.9965];     % Floating base spatial transformation
  
q     = [0.1015,0.4316,-0.6949,0.2633,-0.103,0.3018,-0.8727,0.5709]';    % Arbitrary actuated joint angular displacements
dq    = [-0.5405,-0.1731,-0.08497,0.2581,0.557,-0.638,0.54,0.09804]';    % Arbitrary actuated joint angular veloicities

q_fb  = [1.078, 0, 0.9801, -0.1023, 0, 0]';             % Arbitrary Floating base joint angular displacements
dq_fb = [0.3822, -0.008195, 0.01074, 0.557, 0, 0]';     % Arbitrary Floating base joint angular veloicities

%% Section 1: Floating base model parameters 

[H, C, G, X_L, X_R] = Modified_NE(parent,pitch,Tree,I,n, child, Xfb, q, dq, q_fb,dq_fb);

disp('%%%%%%%%%%%%% Dynamic Model Parameters %%%%%%%%%%%%%%%%');
disp('%%%%%%%%%%%%% Inertia Matrix')
disp('H(q)=')                   % Inertia matrix
disp(num2str(round(H,2)))
disp('%%%%%%%%%%%%% Coriolis centrifugal Matrix')
disp('C(q,dq)=')                % Coriolis centrifugal matrix
disp(num2str(round(C,2)))
disp('%%%%%%%%%%%%% Gravitational Matrix')
disp('G(q)=')                   % Gravitational matrix
disp(num2str(round(G,2)))
disp('%%%%%%%%%%%%% Left Foot Spatial Transformation')
disp('XL(q)=')                  % Left foot spatial transformation matrix
disp(num2str(round(X_L,2)))
disp('%%%%%%%%%%%%% Right Foot Spatial Transformation')
disp('XR(q)=')                  % Right foot spatial transformation matrix
disp(num2str(round(X_R,2)))
%% Section 2: Recursive forward kinematics

[dJ_R, dJ_L, dJ_cog, dJ_B, J_R, J_L, J_cog, J_B, T_B, T_R, T_L, D,omega,omegab] = Recursive_FK([q(1:4)' 0],[q(5:8)' 0],q_fb,[dq;dq_fb]);

disp('%%%%%%%%%%%%% Kinamatic Model Parameters %%%%%%%%%%%%%%%%');
disp('%%%%%%%%%%%%% rate of change of Jacobian of the right foot')
disp('dJ_R(q)=')                  % Display rate of change of Jacobian of the right foot
disp(num2str(round(dJ_R,2)))
disp('%%%%%%%%%%%%% rate of change of Jacobian of the left foot')
disp('dJ_L(q)=')                  % Display rate of change of Jacobian of the left foot
disp(num2str(round(dJ_L,2)))
disp('%%%%%%%%%%%%% rate of change of Jacobian CoM')
disp('dJ_cog(q)=')                % Display rate of change of Jacobian of the center of gravity
disp(num2str(round(dJ_cog,2)))
disp('%%%%%%%%%%%%% rate of change of Jacobian of the floating base')
disp('dJ_B(q)=')                  % Display rate of change of Jacobian of the floating base
disp(num2str(round(dJ_B,2)))


disp('%%%%%%%%%%%%% Jacobian matrix of the right foot')
disp('J_R(q)=')                  % Jacobian of the right foot
disp(num2str(round(J_R,2)))
disp('%%%%%%%%%%%%% Jacobian matrix of the left foot')
disp('J_L(q)=')                  % Jacobian of the left foot
disp(num2str(round(J_L,2)))
disp('%%%%%%%%%%%%% Jacobian matrix of the CoM')
disp('J_cog(q)=')                % Jacobian of the center of gravity
disp(num2str(round(J_cog,2)))
disp('%%%%%%%%%%%%% Jacobian matrix of the floating base')
disp('J_B(q)=')                  % Jacobian of the floating base
disp(num2str(round(J_B,2)))


disp('%%%%%%%%%%%%% Transformation matrix of the right foot')
disp('T_R(q)=')                  % Transformation matrix of the right foot
disp(num2str(round(T_R,2)))
disp('%%%%%%%%%%%%% Transformation matrix of the left foot')
disp('T_L(q)=')                  % Transformation matrix of the left foot
disp(num2str(round(T_L,2)))
disp('%%%%%%%%%%%%% Aggregated center of mass')
disp('D=')                       % Aggregated center of mass
disp(num2str(round(D,2)))
disp('%%%%%%%%%%%%% Transformation matrix of the floating base')
disp('T_B(q)=')                  % Transformation matrix of the floating base
disp(num2str(round(T_B,2)))