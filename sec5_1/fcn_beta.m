function beta = fcn_beta(kappa,para,i)

M_beta_x=para(23);
M_beta_y=para(24);
M_beta_z=para(8);
K_beta_x=para(25);
K_beta_y=para(26);
K_beta_z=para(9);
dim=length(kappa);

if dim==1
    if i==1%%%dim==1
        beta=K_beta_x.*(2./pi).*atan(M_beta_x.*pi./(2.*K_beta_x).*kappa);
    elseif i==2%%%dim==1
        beta=K_beta_y.*(2./pi).*atan(M_beta_y.*pi./(2.*K_beta_y).*kappa);
    else %%%i==3 %%%dim==1 
        beta=K_beta_z.*(2./pi).*atan(M_beta_z.*pi./(2.*K_beta_z).*kappa);
    end
end
    
if dim==3 %%%dim==3 vector
    beta=[K_beta_x.*(2./pi).*atan(M_beta_x.*pi./(2.*K_beta_x).*kappa(1)),...
            K_beta_y.*(2./pi).*atan(M_beta_y.*pi./(2.*K_beta_y).*kappa(2)),...
            K_beta_z.*(2./pi).*atan(M_beta_z.*pi./(2.*K_beta_z).*kappa(3))]';
end
% if dim==1
%     beta=K_beta.*(2./pi).*atan(M_beta.*pi./(2.*K_beta).*kappa);
% end

% if dim==3
%     beta=K_beta.*(2./pi).*[atan(M_beta.*pi./(2.*K_beta).*kappa(1)),atan(M_beta.*pi./(2.*K_beta).*kappa(2)),atan(M_beta.*pi./(2.*K_beta).*kappa(3))]';
% end

end

% function beta = fcn_beta(x)
% 
% global M_beta K_beta
% 
% dim=length(x);
% 
% if dim==1
%     beta=K_beta.*(2./pi).*atan(M_beta.*x);
% end
% 
% if dim==3
%     beta=K_beta.*(2./pi).*[atan(M_beta.*x(1)),atan(M_beta.*x(2)),atan(M_beta.*x(3))]';
% end
% 
% end