function wd = fcn_wd(r,z,pd_3,para)

kp=para(4);
kv=para(5);
z1=z(1:3);
z2=z(4:6);
r3=z(7:9);
zeta=[r;z1;z2];

wd=S(fcn_r3d(zeta,para))./norm(fcn_mu(zeta,para))*(fcn_jacobi_beta(fcn_kappa(z1,z2,para),para,4)*(kp.*z2-kv.*(fcn_beta(fcn_kappa(z1,z2,para),para,4)+S(r3)*S(r3)*fcn_mu(zeta,para)))-pd_3);

end