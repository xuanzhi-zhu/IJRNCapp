function T = fcn_T(r,z,para)

m=para(2);
z1=z(1:3);
z2=z(4:6);
r3=z(7:9);
zeta=[r;z1;z2];

T=m.*r3'*fcn_mu(zeta,para); %expand the expression in eqn 10

end