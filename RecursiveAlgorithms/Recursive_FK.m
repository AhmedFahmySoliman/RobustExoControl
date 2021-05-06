function [dJ_R, dJ_L, dJ_cog, dJ_B, J_R, J_L, J_cog, J_B, T_B, T_R, T_L, D,omega,omegab] = Recursive_FK(q_L,q_R,q_B,dQ)

%% Load Physical Parameters
% Robot Physical Parameters
Lf = 22; La = 60; Ll = 430; Lth = 570; Lhf = 119; Lhl = 119; Lw = 276; 
Lb = 270; Ltf = 115; Lsh = Ll;

m_foot = 1.6535; m_ankle = 1; m_hipfront = 0.957; m_hiplateral = 1;
m_sea  = 2.85; m_shine = 4.7765; m_ub = 41.7435; m_thight = 13.618; 
m_waist = 11.0605;

L_l  = zeros(3,12);
L_r  = zeros(3,12);
w_l  = zeros(1,12);
w_r  = zeros(1,12);

% Link aggregated lengths
L_l(:,1)   = zeros(3,1);
L_l(:,2)   = zeros(3,1);
L_l(:,3)   = zeros(3,1);
L_l(:,4)   = zeros(3,1);
L_l(:,5)   = zeros(3,1);
L_l(:,6)   = zeros(3,1);
L_l(:,7)   = zeros(3,1);
L_l(:,8)   = (3*m_sea*[0;0;Lhl] + m_hipfront*[0;Lhf/2;Lhl] + m_hiplateral*[0;Lhf;Lhl/2])/(m_hipfront + m_hiplateral + 3*m_sea); 
L_l(:,9)  = m_thight*[-Lth/2, 0, 0]'/(m_thight);
L_l(:,10)  = m_shine*[-Ll/2, 0, 0]'/(m_shine);  
L_l(:,11)  = m_ankle*[0, Lhl/2, 0]'/(m_ankle);
L_l(:,12)  = m_foot*[0;0;0]/m_foot;

L_r(:,1)   = zeros(3,1);
L_r(:,2)   = zeros(3,1);
L_r(:,3)   = zeros(3,1);
L_r(:,4)   = zeros(3,1);
L_r(:,5)   = zeros(3,1);
L_r(:,6)   = zeros(3,1);
L_r(:,7)   = zeros(3,1);
L_r(:,8)   = (3*m_sea*[0;0;Lhl] + m_hipfront*[0;-Lhf/2;Lhl] + m_hiplateral*[0;-Lhf;Lhl/2])/(m_hipfront + m_hiplateral + 3*m_sea); 
L_r(:,9)  = m_thight*[-Lth/2, 0, 0]'/(m_thight);
L_r(:,10)  = m_shine*[-Ll/2, 0, 0]'/(m_shine);  
L_r(:,11)  = m_ankle*[0, -Lhl/2, 0]'/(m_ankle);
L_r(:,12)  = m_foot*[0;0;0]/m_foot;

L_b       = (m_sea*[0;-Lw/2;0] + m_sea*[0;Lw/2;0] + m_ub*[Ltf;0;Lb])/(2*m_sea+m_ub+m_waist);

% Link weights

w_l(1)   = 0;  
w_l(2)   = 0; 
w_l(3)   = 0; 
w_l(4)   = 0; 
w_l(5)   = 0; 
w_l(6)   = 0; 
w_l(7)   = 0; 
w_l(8)   =  m_hipfront + m_hiplateral + 3*m_sea; 
w_l(9)   =  m_thight; 
w_l(10)  =  m_shine;
w_l(11)  =  m_ankle; 
w_l(12)  =  m_foot;

w_r(1)   = 0;  
w_r(2)   = 0; 
w_r(3)   = 0; 
w_r(4)   = 0; 
w_r(5)   = 0; 
w_r(6)   = 0; 
w_r(7)   = 0; 
w_r(8)   = m_hiplateral + m_hipfront + 3*m_sea; 
w_r(9)   = m_thight;
w_r(10)  = m_shine; 
w_r(11)  = m_ankle; 
w_r(12)  = m_foot; 

w_b     = (2*m_sea+m_ub+m_waist);

J_B     = zeros(6,16);
JbvL_b  = zeros(3,6);
omega    = zeros(3,1);
omegab   = zeros(3,1);
% Total Masses

m_total_l = sum(w_l);
m_total_r = sum(w_r);
m_total_b = w_b;

W_l       = w_l/m_total_l;
W_R       = w_r/m_total_r;

m_total = m_total_l + m_total_r + w_b;

%% Transformation matrix computation
n = 5;       % Number of joints per leg
% 
% %% Initial Values

Jbw    = zeros(3,6);
Jbv    = zeros(3,6);
dJbw    = zeros(3,6);
dJbv    = zeros(3,6);

Jrw    = zeros(3,16);
Jrv    = zeros(3,16);
dJrw    = zeros(3,16);
dJrv    = zeros(3,16);

Jlv    = zeros(3,16);
Jlw    = zeros(3,16);
dJlv    = zeros(3,16);
dJlw    = zeros(3,16);

dJ_R   = zeros(6,16);
dJ_L   = zeros(6,16);
dJ_cog = zeros(3,16); 
dJ_B   = zeros(6,16);

dQ = [dQ(1:4);0;dQ(5:8);0;dQ(9:end)];
%% Fixed Inertial Frame
z0 = [0;0;1];                                    % Z vector direction
D_r = zeros(3,1);
D_l = zeros(3,1);
%% FloatingBase DH parameters
a_B  = [0 0 0 0 0 0 0];
al_B = [90 90 90 90 90 90 0];
d_B  = [0 q_B(1) q_B(2) q_B(3) 0 0 0];
th_B = [pi/2 pi/2 pi/2 pi/2 q_B(4)+pi/2 q_B(5)+pi/2 q_B(6)];

T_B  = A_trans(a_B(1),al_B(1),d_B(1),th_B(1));

for i = 2:7
     %% Floating Base Transformation matrices Computation
     A_B         = A_trans(a_B(i),al_B(i),d_B(i),th_B(i));
     rb          = T_B(1:3,1:3)*A_B(1:3,4);
     Rbi_1       = A_B(1:3,1:3);                                  % Rotation matrix per link
     Rbi_b       = T_B(1:3,1:3);                                  % Rotation matrix w.r.t base frame 
     T_B         = T_B*A_B;                                       % Transformation w.r.t base frame   
     
          %% Jacobian Computation
    b     = Rbi_b*z0; 
     
    if i == 2
        Jbw(1:3,i-1)     =    zeros(3,1);                                                 % Prismatic Jacobian
        Jbv(1:3,i-1)     =   [[] ,b] - skew(rb)*Jbw(1:3,i-1);                           % Linear Jacobian 
        
        omegab            =   Jbw(1:3,1:i-1)*dQ(9:9+(i-2));
        dJbw(1:3,i-1)    =   zeros(3,1);
        dJbv(1:3,1:i-1)    = -(skew(rb)*dJbw(1:3,1:i-1) + skew(omegab)*skew(rb)*Jbw(1:3,1:i-1));
        
    else
        if i <= 4
        Jbw(1:3,1:i-1)   = [Jbw(1:3,1:i-2) zeros(3,1)];                              % Prismatic Jacobian
        Jbv(1:3,1:i-1)   = [Jbv(1:3,1:i-2) b] - skew(rb)*Jbw(1:3,1:i-1);      % Linear Jacobian 
        
        omegab            = Jbw(1:3,1:i-1)*dQ(9:9+(i-2));
        dJbw(1:3,1:i-1)    = [dJbw(1:3,1:i-2),   zeros(3,1)];
        dJbv(1:3,1:i-1)    = [dJbv(1:3,1:i-2),   skew(omegab)*b] -skew(rb)*dJbw(1:3,1:i-1) - skew(omegab)*skew(rb)*Jbw(1:3,1:i-1);
           
        else
        Jbw(1:3,1:i-1)     = [Jbw(1:3,1:i-2) b];                                % Rotational Jacobian
        Jbv(1:3,1:i-1)     = [Jbv(1:3,1:i-2) zeros(3,1)] - skew(rb)*Jbw(1:3,1:i-1);    % Linear Jacobian 
        
        omegab              = Jbw(1:3,1:i-1)*dQ(11:11+(i-2));
        dJbw(1:3,1:i-1)    = [dJbw(1:3,1:i-2),   skew(omegab)*b];
        dJbv(1:3,1:i-1)    = [dJbv(1:3,1:i-2),  zeros(3,1)] -skew(rb)*dJbw(1:3,1:i-1) - skew(omegab)*skew(rb)*Jbw(1:3,1:i-1);
        
        end
    end
end

%% Floating Base COM
rm_B        =   T_B(1:3,1:3)*L_b; 
JbvL_b      =   Jbv - skew(rm_B)*Jbw(1:3,:);
dJbvL_b     =   dJbv - skew(omegab)*skew(rm_B)*Jbw(1:3,:);

J_B   = [zeros(6,2*n) [Jbv; Jbw]];
dJ_B   = [zeros(6,2*n) [dJbv; dJbw]];

D_b  = rm_B+T_B(1:3,4);

%% Right Foot FloatingBase DH parameters
a_R  = [0 0 0 0 0 0 0 Lw/2 0 Lth Lsh 0 La];
al_R = [90 90 90 90 90 90 0 -90 90 0 0 -90 0];
d_R  = [0 q_B(1) q_B(2) q_B(3) 0 0 0 0 Lhf Lhl 0 -Lhl Lf];
th_R = [pi/2 pi/2 pi/2 pi/2 q_B(4)+pi/2 q_B(5)+pi/2 q_B(6) -pi/2 q_R(1)+pi/2 q_R(2) q_R(3) q_R(4) q_R(5)];

T_R  = A_trans(a_R(1),al_R(1),d_R(1),th_R(1));
Tr_old  =  T_R;

Jbv_r   = zeros(3,16);
dJbv_r  = zeros(3,16);
Jrv_old = zeros(3,16);
dJrv_old = zeros(3,16);

for i = 7:6+2+n
     %% Floating Base Transformation matrices Computation
     
     if i == 7
         A_R  = A_B;
        Rri_b = Rbi_b; 
        rr    = rb;
        T_R   = T_B;
     else
     A_R         = A_trans(a_R(i),al_R(i),d_R(i),th_R(i));
     rr          = T_R(1:3,1:3)*A_R(1:3,4);
     Rri_b       = T_R(1:3,1:3);                                  % Rotation matrix w.r.t base frame 
     T_R         = T_R*A_R;                                       % Transformation w.r.t base frame
     end
     
     %% Jacobian Computation
             b = Rri_b*z0;
             
             if i == 7
                 Jrv(1:3,:)     = [J_B(1:3,11:16) J_B(1:3,1:10)];
                 Jrw(1:3,:)     = [J_B(4:6,11:16) J_B(4:6,1:10)];

                 dJrv(1:3,:)     = [dJ_B(1:3,11:16) dJ_B(1:3,1:10)];
                 dJrw(1:3,:)     = [dJ_B(4:6,11:16) dJ_B(4:6,1:10)];
                 
             elseif i>7
                 Jrw(1:3,1:i-1)     = [Jrw(1:3,1:i-2) b];                                %Rotational Jacobian
                 Jrv(1:3,1:i-1)     = [Jrv(1:3,1:i-2) zeros(3,1)] - skew(rr)*Jrw(1:3,1:i-1);    % Linear Jacobian 
                 
                if i == 8
                  omega             = Jrw(1:3,1:i-1)*[dQ(11:16);0];  
                else
                  omega             = Jrw(1:3,1:i-1)*[dQ(11:16);0;dQ(6:6+(i-7)-2)];  
                end
                
                dJrw(1:3,1:i-1)    = [dJrw(1:3,1:i-2),   skew(omega)*b];
                dJrv(1:3,1:i-1)    = [dJrv(1:3,1:i-2),  zeros(3,1)] -skew(rr)*dJrw(1:3,1:i-1) - skew(omega)*skew(rr)*Jrw(1:3,1:i-1);
                
             end

    %% Aggregatted COM
    
      Am_r                = A_R*[eye(3,3), L_r(:,i-1); 0,0,0,1];
      rm_r                = Tr_old(1:3,1:3) * Am_r(1:3,4);
      JbvL_r              = [Jrv_old(1:3,1:i-2) zeros(3,1)]  - skew(rm_r)*Jrw(1:3,1:i-1);                
      dJbvL_r             = [dJrv_old(1:3,1:i-2) zeros(3,1)] - skew(rm_r)*dJrw(1:3,1:i-1) - skew(omega)*skew(rm_r)*Jrw(1:3,1:i-1);
      Jbv_r(1:3,1:i-1)    = W_R(i-1)*JbvL_r + Jbv_r(1:3,1:i-1);
      dJbv_r(1:3,1:i-1)   = W_R(i-1)*dJbvL_r + dJbv_r(1:3,1:i-1);
      D_r                 = W_R(i-1)*(rm_r+Tr_old(1:3,4)) + D_r;
      Tr_old              =  T_R;   
      Jrv_old             = Jrv; 
      dJrv_old            = dJrv;   
end

%% Left Foot FloatingBase DH parameters
a_L  = [0    0       0         0          0                0                  0         Lw/2     0               Lth       Lsh       0       La];
al_L = [90   90      90        90         90               90                 0         90       -90             0         0         90       0];

d_L  = [0    q_B(1)  q_B(2)    q_B(3)     0                0                  0         0        Lhf             Lhl       0        -Lhl      Lf];
th_L = [pi/2 pi/2    pi/2      pi/2       q_B(4)+pi/2      q_B(5)+pi/2        q_B(6)    pi/2     q_L(1)-pi/2     q_L(2)    q_L(3)   q_L(4)    q_L(5)];


T_L     = A_trans(a_L(1),al_L(1),d_L(1),th_L(1));
Tl_old  =  T_L;

Jbv_l    = zeros(3,16);
dJbv_l   = zeros(3,16);
Jlv_old  = zeros(3,16);
dJlv_old = zeros(3,16);

for i = 7:6+2+n
     %% Floating Base Transformation matrices Computation
     if i == 7
     A_L  = A_B;
     Rli_b = Rbi_b; 
     rl    = rb;
     T_L   = T_B;
     else
     A_L         = A_trans(a_L(i),al_L(i),d_L(i),th_L(i));
     rl          = T_L(1:3,1:3)*A_L(1:3,4);
     Rli_b       = T_L(1:3,1:3);                                  % Rotation matrix w.r.t base frame 
     T_L         = T_L*A_L;                                       % Transformation w.r.t base frame
     end
          %% Jacobian Computation
        b = Rli_b*z0;
        
             if i == 7
         Jlv(1:3,:)     = [J_B(1:3,11:16) J_B(1:3,1:10)];
         Jlw(1:3,:)     = [J_B(4:6,11:16) J_B(4:6,1:10)];
         
         dJlv(1:3,:)     = [dJ_B(1:3,11:16) dJ_B(1:3,1:10)];
         dJlw(1:3,:)     = [dJ_B(4:6,11:16) dJ_B(4:6,1:10)];
                 
             else
        Jlw(1:3,1:i-1)     = [Jlw(1:3,1:i-2) b];                                % Rotational Jacobian
        Jlv(1:3,1:i-1)     = [Jlv(1:3,1:i-2) zeros(3,1)] - skew(rl)*Jlw(1:3,1:i-1);    % Linear Jacobian  
        
        if i == 8
                  omega             = Jlw(1:3,1:i-1)*[dQ(11:16);0];  
                else
                  omega             = Jlw(1:3,1:i-1)*[dQ(11:16);0;dQ(1:1+(i-7)-2)];  
        end
                
                dJlw(1:3,1:i-1)    = [dJlw(1:3,1:i-2),   skew(omega)*b];
                dJlv(1:3,1:i-1)    = [dJlv(1:3,1:i-2),  zeros(3,1)] - skew(rl)*dJlw(1:3,1:i-1) - skew(omega)*skew(rl)*Jlw(1:3,1:i-1);
            end
           
    %% Aggregatted COM Computation
   
      Am_l         = A_L*[eye(3,3), L_l(:,i-1); 0,0,0,1];
      rm_l         = Tl_old(1:3,1:3) * Am_l(1:3,4);

     JbvL_l              = [Jlv_old(1:3,1:i-2) zeros(3,1)] - skew(rm_l)*Jlw(1:3,1:i-1); 
     dJbvL_l             = [dJlv_old(1:3,1:i-2) zeros(3,1)] - skew(rm_l)*dJlw(1:3,1:i-1) - skew(omega)*skew(rm_l)*Jlw(1:3,1:i-1);
     Jbv_l(1:3,1:i-1)    = W_l(i-1)*JbvL_l + Jbv_l(1:3,1:i-1);
     dJbv_l(1:3,1:i-1)   = W_l(i-1)*dJbvL_l + dJbv_l(1:3,1:i-1);
     
D_l  = W_l(i-1)*(rm_l+Tl_old(1:3,4)) + D_l;
     
Tl_old  =  T_L;   
Jlv_old = Jlv;     
end

J_R      = [zeros(3,5) Jrv(:,8:12) Jrv(:,1:6);zeros(3,5) Jrw(:,8:12) Jrw(:,1:6)];
dJ_R     = [zeros(3,5) dJrv(:,8:12) dJrv(:,1:6);zeros(3,5) dJrw(:,8:12) dJrw(:,1:6)];

J_L     = [Jlv(:,8:12) zeros(3,5) Jlv(:,1:6); Jlw(:,8:12) zeros(3,5) Jlw(:,1:6)];
dJ_L    = [dJlv(:,8:12) zeros(3,5) dJlv(:,1:6); dJlw(:,8:12) zeros(3,5) dJlw(:,1:6)];

Jbv_r   = [Jbv_r(:,13:16) zeros(3,1) Jbv_r(:,8:12) Jbv_r(:,1:6)];
Jbv_l   = [Jbv_l(:,8:16) zeros(3,1) Jbv_l(:,1:6)];

dJbv_r   = [dJbv_r(:,13:16) zeros(3,1) dJbv_r(:,8:12) dJbv_r(:,1:6)];
dJbv_l   = [dJbv_l(:,8:16) zeros(3,1) dJbv_l(:,1:6)];

J_cog   = (w_b*[zeros(3,10) JbvL_b] + m_total_l*Jbv_l + m_total_r*Jbv_r)/(w_b+m_total_l+ m_total_r);
dJ_cog   = (w_b*[zeros(3,10) dJbvL_b] + m_total_l*dJbv_l + m_total_r*dJbv_r)/(w_b+m_total_l+ m_total_r);
D       = (w_b*D_b + m_total_l*D_l + m_total_r*D_r)/(w_b+m_total_l+ m_total_r);

J_cog(:,[5,10])  = [];
dJ_cog(:,[5,10]) = [];
J_L(:,[5,10])  = [];
dJ_L(:,[5,10]) = [];
J_R(:,[5,10])  = [];
dJ_R(:,[5,10]) = [];
J_B(:,[5,10])  = [];
dJ_B(:,[5,10]) = [];

end