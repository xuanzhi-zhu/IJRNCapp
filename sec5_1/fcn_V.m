function V = fcn_V(x,para)

epsilon=para(19);

r=x(1:9);
z1=x(10:12);
z2=x(13:15);
r3=x(16:18);
zeta=[r;z1;z2];
q=x(23);

V=fcn_V0(z1,z2,para)+epsilon.*(1-q.*r3'*fcn_r3d(zeta,para));

end