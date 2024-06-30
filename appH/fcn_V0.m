function V0 = fcn_V0(z1,z2,para)

kp=para(4);
kv=para(5);
gamma=para(6);
e1=para(10:12);
e2=para(13:15);
e3=para(16:18);

e=[e1,e2,e3];
D=[kv./kp.*gamma,-gamma;-gamma,kp];

V0=0;%initialize
for i=1:1:3
    V0=V0+1./2.*[fcn_beta(e(:,i)'*fcn_kappa(z1,z2,para),para,i);e(:,i)'*z2]'*D*...
        [fcn_beta(e(:,i)'*fcn_kappa(z1,z2,para),para,i);e(:,i)'*z2]+fcn_int_beta(e(:,i)'*fcn_kappa(z1,z2,para),para,i);
end

end