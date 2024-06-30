function mu = fcn_mu(zeta,para)

gra=para(3);
e3=para(16:18);
r=zeta(1:9);
z1=zeta(10:12);
z2=zeta(13:15);
pd_2= r(7:9);

mu=fcn_beta(fcn_kappa(z1,z2,para),para)+gra.*e3-pd_2;
    
end