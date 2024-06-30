function jacobi_beta = fcn_jacobi_beta(kappa,para,i)

M_beta_x=para(23);
M_beta_y=para(24);
M_beta_z=para(8);
K_beta_x=para(25);
K_beta_y=para(26);
K_beta_z=para(9);
dim=length(kappa);

if dim==1
    if i==1%%%dim==1
        jacobi_beta=M_beta_x./(1+(M_beta_x.*pi./(2.*K_beta_x).*kappa).^2);
    elseif i==2%%%dim==1
        jacobi_beta=M_beta_y./(1+(M_beta_y.*pi./(2.*K_beta_y).*kappa).^2);
    else %%%i==3 %%%dim==1 
        jacobi_beta=M_beta_z./(1+(M_beta_z.*pi./(2.*K_beta_z).*kappa).^2);
    end
end

if dim==3 %%%dim==3 vector
    jacobi_beta=diag([M_beta_x./(1+(M_beta_x.*pi./(2.*K_beta_x).*kappa(1)).^2),...
                                M_beta_y./(1+(M_beta_y.*pi./(2.*K_beta_y).*kappa(2)).^2),...
                                M_beta_z./(1+(M_beta_z.*pi./(2.*K_beta_z).*kappa(3)).^2)]);
end



% if dim==1% gradient of      \beta:\reals\to\reals
%     jacobi_beta=M_beta./(1+(M_beta.*pi./(2.*K_beta).*kappa).^2);
% end
% 
% if dim==3% Jocobian of      \beta:\reals^3\to\reals^3
%     jacobi_beta=diag([M_beta./(1+(M_beta.*pi./(2.*K_beta).*kappa(1)).^2),...
%         M_beta./(1+(M_beta.*pi./(2.*K_beta).*kappa(2)).^2),...
%        M_beta./(1+(M_beta.*pi./(2.*K_beta).*kappa(3)).^2)]);
% end

end



% function jacobi_beta = fcn_jacobi_beta(x)
% 
% global M_beta K_beta
% 
% dim=length(x);
% 
% if dim==1
%     jacobi_beta=K_beta.*(2./pi).*M_beta./(1+(M_beta.*x).^2);
% end
% 
% if dim==3
%     jacobi_beta=diag([K_beta.*(2./pi).*M_beta./(1+(M_beta.*x(1)).^2),...
%         K_beta.*(2./pi).*M_beta./(1+(M_beta.*x(2)).^2),...
%         K_beta.*(2./pi).*M_beta./(1+(M_beta.*x(3)).^2)]);
% end
% 
% end
% 
