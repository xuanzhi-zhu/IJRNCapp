function w = fcn_w(r,z,pd_3,q,para)

kw=para(7);
epsilon=para(19);
z1=z(1:3);
z2=z(4:6);
r3=z(7:9);
zeta=[r;z1;z2];

w=kw./q.*S(r3)*fcn_r3d(zeta,para)+fcn_wd(r,z,pd_3,para)+1./(q.*epsilon).*norm(fcn_mu(zeta,para)).*S(r3)*[zeros(3,3),eye(3)]*fcn_grad_V0(z1,z2,para);

end

% function w = fcn_w(r,xi,z3,pd_3)
% 
% global kw epsilon
% 
% w=kw.*S(z3+fcn_r3d(r,xi))*fcn_r3d(r,xi)+fcn_wd(r,xi,z3,pd_3)+1./epsilon.*norm(fcn_mu(r,xi)).*S(z3+fcn_r3d(r,xi))*[zeros(3,3),eye(3)]*fcn_grad_V0(xi);
% 
% end