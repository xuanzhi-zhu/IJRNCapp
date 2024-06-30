function [pd,pd_1,pd_2,pd_3] = r_lemniscate(t)
% function [pd,pd_1,pd_2,pd_3,pd_4] = r_lemniscate(t)

V=1;%desired speed
    
radius = 1.3;
rot_x_ang = 0;
rot_z_ang = 0;
h=-1;
%%==============================================
Phix=-pi/18;
Rxx=[1,         0,         0;
     0, cos(Phix), sin(Phix);
     0, -sin(Phix), cos(Phix)];
%%==============================================
Psiz=0;
Rzz=[cos(Psiz), -sin(Psiz), 0;
     sin(Psiz),  cos(Psiz), 0;
     0        ,          0, 1];
%%==============================================

[sn,cn,dn,am] = jacobiAm(t*(V/radius));

gamma = am;
Dgamma = dn*(V/radius);
D2gamma = cn*sn*(V/radius)^2;
D3gamma = (3*dn-2*dn^3)*(V/radius)^3;
% D4gamma = (3*cn*sn*(1-2*dn^2))*(V/radius)^4;

p_ = radius*Rxx*Rzz*[(sin(gamma.*2.0).*(1.0./2.0))./(sin(gamma).^2+1.0);-cos(gamma)./(cos(gamma).^2-2.0);h];
Dp_ = radius*Rxx*Rzz*[1.0./(cos(gamma).^2-2.0).^2.*(cos(gamma).^2.*3.0-2.0);sin(gamma).*1.0./(sin(gamma).^2+1.0).^2.*(sin(gamma).^2-3.0);0.0];
D2p_ = radius*Rxx*Rzz*[sin(gamma.*2.0).*(sin(gamma).^2.*3.0-5.0).*1.0./(sin(gamma).^2+1.0).^3;cos(gamma).*1.0./(cos(gamma).^2-2.0).^3.*(cos(gamma).^2.*1.0e1+cos(gamma).^4-8.0);0.0];
D3p_ = radius*Rxx*Rzz*[1.0./(sin(gamma).^2+1.0).^4.*(sin(gamma).^2.*4.4e1-sin(gamma).^4.*4.1e1+sin(gamma).^6.*6.0-5.0).*2.0;-sin(gamma).*1.0./(sin(gamma).^2+1.0).^4.*(sin(gamma).^2.*1.03e2-sin(gamma).^4.*4.3e1+sin(gamma).^6-4.5e1);0.0];
% D4p_ = radius*Rxx*Rzz*[sin(gamma.*2.0).*1.0./(sin(gamma).^2+1.0).^5.*(sin(gamma).^2.*1.07e2-sin(gamma).^4.*5.0e1+sin(gamma).^6.*3.0-3.2e1).*-4.0;-cos(gamma).*1.0./(cos(gamma).^2-2.0).^5.*(cos(gamma).^2.*-4.32e2+cos(gamma).^4.*3.28e2+cos(gamma).^6.*1.32e2+cos(gamma).^8+1.6e1);0.0];

p = p_;
Dp = Dp_*Dgamma;
D2p = D2p_*Dgamma^2 + Dp_*D2gamma;
D3p = D3p_*Dgamma^3 + 3*D2p_*D2gamma*Dgamma + Dp_*D3gamma;
% D4p = D4p_*Dgamma^4 + 3*D3p_*Dgamma^2*D2gamma ...
%     + 3*D3p_*D2gamma*Dgamma^2 + 3*D2p_*D3gamma*Dgamma + 3*D2p_*D2gamma*D2gamma ...
%     + D2p_*D3gamma*Dgamma + Dp_*D4gamma;

% y_3d = [p ; Dp ; D2p; D3p; D4p];

pd=p(1:3);
pd_1=Dp(1:3);
pd_2=D2p(1:3);
pd_3=D3p(1:3);
% pd_4=D4p(1:3);
%%=========================================================================

R_rot_z = [cos(rot_z_ang) -sin(rot_z_ang) 0; sin(rot_z_ang) cos(rot_z_ang) 0; 0 0 1];
R_rot_x = [1 0 0; 0 cos(rot_x_ang) -sin(rot_x_ang); 0 sin(rot_x_ang) cos(rot_z_ang)];
R_rot = R_rot_x*R_rot_z;
R = zeros(15);
R(1:3,1:3) = R_rot;
R(4:6,4:6) = R_rot;
R(7:9,7:9) = R_rot;
R(10:12,10:12) = R_rot;
R(13:15,13:15) = R_rot;

end 

function [sn,cn,dn,am] = jacobiAm(s)

coder.extrinsic('ellipj');

k = 1;
kl = sqrt(2);

K_comp = ellipke(k/kl^2)/kl;

sn_ = 0;
cn_ = 0;

[sn_,cn_,~]=ellipj(sqrt(2)*(K_comp - s),1/2);

am = pi/2 - atan2(sn_,cn_);
dn = sqrt(1+cn_^2);
cn = sn_;
sn = cn_;



end

%check condition

%eqn 8
%|pd_2|=?
