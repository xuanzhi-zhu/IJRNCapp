function int= fcn_int_beta(kappa,para,i)

M_beta_x=para(23);
M_beta_y=para(24);
M_beta_z=para(8);
K_beta_x=para(25);
K_beta_y=para(26);
K_beta_z=para(9);

if i==1%%%dim==1
    p=2.*K_beta_x./pi;
    q=M_beta_x./p;
    int=p./q.*(q.*kappa*atan(q.*kappa)-1./2.*log((q.*kappa).^2+1));
elseif i==2%%%dim==1
    p=2.*K_beta_y./pi;
    q=M_beta_y./p;
    int=p./q.*(q.*kappa*atan(q.*kappa)-1./2.*log((q.*kappa).^2+1));
else %%%i=3  %%%dim==1 
    p=2.*K_beta_z./pi;
    q=M_beta_z./p;
    int=p./q.*(q.*kappa*atan(q.*kappa)-1./2.*log((q.*kappa).^2+1));
end
% p=2.*K_beta./pi;
% q=M_beta./p;
% 
% int=p./q.*(q.*kappa*atan(q.*kappa)-1./2.*log((q.*kappa).^2+1));

end