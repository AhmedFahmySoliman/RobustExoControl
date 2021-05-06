function [Xzmp, Yzmp, Pitch] = sub(ZIF, AC, CMC)

stp_L = 120;  %Number of Samples per step

Xzmp(1,1) = PP_avg_fun(ZIF(14,:),stp_L); 
Xzmp(1,2) = PP_avg_fun(AC(14,:),stp_L);
Xzmp(1,3) = PP_avg_fun(CMC(14,:),stp_L);

Yzmp(1,1) = PP_avg_fun(ZIF(17,:),stp_L); 
Yzmp(1,2) = PP_avg_fun(AC(17,:),stp_L);
Yzmp(1,3) = PP_avg_fun(CMC(17,:),stp_L);

Pitch_rate(1,:) = diff(ZIF(24,:))/0.01; 
Pitch_rate(2,:) = diff(AC(24,:))/0.01;
Pitch_rate(3,:) = diff(CMC(24,:))/0.01;

Pitch(1,1) = PP_avg_fun(Pitch_rate(1,:),stp_L);
Pitch(1,2) = PP_avg_fun(Pitch_rate(2,:),stp_L);
Pitch(1,3) = PP_avg_fun(Pitch_rate(3,:),stp_L);

end