function kappa= fcn_kappa(z1,z2,para)

kp=para(4);
kv=para(5);

kappa=[kp.*eye(3),kv.*eye(3)]*[z1;z2];

end