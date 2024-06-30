function grad_V0 = fcn_grad_V0(z1,z2,para)

kp=para(4);
kv=para(5);
gamma=para(6);
e1=para(10:12);
e2=para(13:15);
e3=para(16:18);

D=[kv./kp.*gamma,-gamma;-gamma,kp];

g1=[fcn_beta(e1'*fcn_kappa(z1,z2,para),para,1);e1'*z2]'*D*[kp.*fcn_jacobi_beta(e1'*fcn_kappa(z1,z2,para),para,1);0]+kp.*fcn_beta(e1'*fcn_kappa(z1,z2,para),para,1);
g2=[fcn_beta(e2'*fcn_kappa(z1,z2,para),para,2);e2'*z2]'*D*[kp.*fcn_jacobi_beta(e2'*fcn_kappa(z1,z2,para),para,2);0]+kp.*fcn_beta(e2'*fcn_kappa(z1,z2,para),para,2);
g3=[fcn_beta(e3'*fcn_kappa(z1,z2,para),para,3);e3'*z2]'*D*[kp.*fcn_jacobi_beta(e3'*fcn_kappa(z1,z2,para),para,3);0]+kp.*fcn_beta(e3'*fcn_kappa(z1,z2,para),para,3);

g4=[fcn_beta(e1'*fcn_kappa(z1,z2,para),para,1);e1'*z2]'*D*[kv.*fcn_jacobi_beta(e1'*fcn_kappa(z1,z2,para),para,1);1]+kv.*fcn_beta(e1'*fcn_kappa(z1,z2,para),para,1);
g5=[fcn_beta(e2'*fcn_kappa(z1,z2,para),para,2);e2'*z2]'*D*[kv.*fcn_jacobi_beta(e2'*fcn_kappa(z1,z2,para),para,2);1]+kv.*fcn_beta(e2'*fcn_kappa(z1,z2,para),para,2);
g6=[fcn_beta(e3'*fcn_kappa(z1,z2,para),para,3);e3'*z2]'*D*[kv.*fcn_jacobi_beta(e3'*fcn_kappa(z1,z2,para),para,3);1]+kv.*fcn_beta(e3'*fcn_kappa(z1,z2,para),para,3);

grad_V0=[g1,g2,g3,g4,g5,g6]';

end