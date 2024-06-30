function grad_V = fcn_grad_V(x,para)

kp=para(4);
kv=para(5);
epsilon=para(19);

r=x(1:9);
z1=x(10:12);
z2=x(13:15);
r3=x(16:18);
q=x(23);
zeta=[r;z1;z2];

jacobi_zeta_r=[eye(9),zeros(9,6)]';
jacobi_kappa_z1_z2=[kp.*eye(3);kv.*eye(3)]';
jacobi_mu_zeta=[zeros(6,3);-eye(3);jacobi_kappa_z1_z2'*fcn_jacobi_beta(fcn_kappa(z1,z2,para),para,4)']';
jacobi_r3d_mu=[-S(fcn_mu(zeta,para))*S(fcn_mu(zeta,para))./norm(fcn_mu(zeta,para)).^3]';
grad_V_r=-epsilon.*q.*jacobi_zeta_r'*jacobi_mu_zeta'*jacobi_r3d_mu'*r3;

jacobi_zeta_z1_z2=[zeros(6,9),eye(6)]';
grad_minus_epsilon_q_r3_r3d_z1_z2=-epsilon.*q.*jacobi_zeta_z1_z2'*jacobi_mu_zeta'*jacobi_r3d_mu'*r3;
grad_V_z=[fcn_grad_V0(z1,z2,para)+grad_minus_epsilon_q_r3_r3d_z1_z2;-epsilon.*q.*fcn_r3d(zeta,para)];

grad_V_s_1=0;
grad_V_s_2=zeros(3,1);
grad_V_q=0;

grad_V=[grad_V_r;grad_V_z;grad_V_s_1;grad_V_s_2;grad_V_q];

end