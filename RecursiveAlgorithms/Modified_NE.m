function [H_I, Cor, G_O, X_L, X_R] = Modified_NE(parent,pitch,Tree,I,n, child, Xfb, q, dq, q_fb,dq_fb)

grav = [0;0;0;0;0;9.806];
Jr = zeros(14,6);
Jl = zeros(14,6);

[Jfb, dJfb] = FB_Param(q_fb,dq_fb);   %Floating Base Jacobian and Jacobian dervative w.r.t Global frame

vfb  = Xfb*(Jfb*dq_fb);
afb = Xfb*grav;

J_0 = eye(6,6); dJ_0 = zeros(6,6);

L = 0;       % Leg index
NBR        = n-6;

for i = 1:NBR
    [XJ, S(:,i)] = jcalc(pitch(i+6),q(i));
    vJ           = S(:,i)*dq(i);
    Xup(:,:,i)   = XJ*Tree(:,:,i+6);
   
    if parent(i)==0
        X(:,:,i) = Xup(:,:,i);
    else
        X(:,:,i) = Xup(:,:,i)*X(:,:,parent(i));
    end
       
    if parent(i) == 0
        v(:,i) =  Xup(:,:,i)*vfb + S(:,i)*dq(i);
        g(:,i) =  Xup(:,:,i)*afb;
        L = L+1;
       
        if L == 1
        J((1:6)+(L-1)*6,1:i+6) =  [Xup(:,:,i)*J_0 S(:,i)];
        dJ  = [Xup(:,:,i)*dJ_0 crm(vfb)*S(:,i)];
        else
        J((1:6)+(L-1)*6,1:i+6) =  [Xup(:,:,i)*J_0 zeros(6,4) S(:,i)]; 
        dJ  = [Xup(:,:,i)*dJ_0 crm(vfb)*S(:,i)];
        end     
        
    else

        J((1:6)+(L-1)*6,1:i+6) =  [Xup(:,:,i)*J((1:6)+(L-1)*6,1:parent(i)+6) S(:,i)];       
        v(:,i)    =  Xup(:,:,i)*v(:,parent(i)) + S(:,i)*dq(i);                            
        g(:,i)    =  Xup(:,:,i)*g(:,parent(i));
        dJ(:,1:i) =  [Xup(:,:,i)*dJ(:,1:parent(i)) crm(v(:,i))*S(:,i)];
        
    end
    
        IC(:,:,i) = I(:,:,i+6);    
        fg(:,i) = IC(:,:,i)*g(:,i);
        M1(:,1:i+6,i) = crf(v(:,i))*IC(:,:,i)*J((1:6)+(L-1)*6,1:i+6) + [zeros(6,6), IC(:,:,i)*dJ(:,1:i)];
        
end
Ifb  = I(:,:,6);
ffbg  = Ifb*afb;

L = 0;       % Leg index

for i = NBR:-1:1
  if parent(i) == 0
      L = L+1;
     
            if L == 1
            K_b = [(crf(vfb)*Ifb*J_0) zeros(6,8)]+Xup(:,:,i)'*M2(:,:,i);
            else
            K_b   = K_b + Xup(:,:,i)'*M2(:,:,i);    
            end
     
      Ifb   = Ifb + Xup(:,:,i)'*IC(:,:,i)*Xup(:,:,i);
      ffbg  = ffbg + Xup(:,:,i)'*fg(:,i);
           
  else
      IC(:,:,parent(i)) = IC(:,:,parent(i)) + Xup(:,:,i)'*IC(:,:,i)*Xup(:,:,i);
      fg(:,parent(i))   = fg(:,parent(i)) + Xup(:,:,i)'*fg(:,i);
     
      if child(i) == 0
      M2(:,:,parent(i)) = (M1(:,:,parent(i)) + Xup(:,:,i)'*M1(:,:,i));
      M2(:,:,i)         =  M1(:,:,i);
      else
      M2(:,:,parent(i)) = M1(:,:,parent(i)) + Xup(:,:,i)'*M2(:,:,i);
      end  

  end
end

for i = NBR:-1:1
   if child(i) == 0
    XX(:,:,i) = eye(6,6);
   else
    XX(:,:,i) = Xup(:,:,child(i))'*XX(:,:,child(i));
   end
end

for i = 1:4
        Jr(i+6,:)= S(:,i)'*XX(:,:,i);      % Right foot Jacobian Transpose
end
for i = 5:8
        Jl(i+6,:)= S(:,i)'*XX(:,:,i);      % Left foot Jacobian Transpose
end

Jr(1:6,:) = X(:,:,4)';
Jl(1:6,:) = X(:,:,8)';

for i = 1:NBR
   C_M(i,:)  = S(:,i)' * M2(:,:,i);
   Cc(i,1) = C_M(i,:)*[dq_fb;dq];
   G(i,1)  = S(:,i)' * fg(:,i);
end

%% Composite Rigid Body Algorithm

for i = 1:NBR
  fh = IC(:,:,i) * S(:,i);
  F1(:,i) = X(:,:,i)'*fh;
  H(i,i) = S(:,i)' * fh;
  j = i;
  while parent(j) > 0
    fh = Xup(:,:,j)' * fh;
    j = parent(j);
    H(i,j) = S(:,i)' * fh;
    H(j,i) = H(i,j);
  end
end

%% Model Parameters
H_I    = [Ifb, F1; F1', H];
Cor    = [K_b; C_M];
G_O    = [ffbg; G(:,1)];

X_L = X(:,:,8);
X_R = X(:,:,4);
end