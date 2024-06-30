%%%%%%%%%C

[~,~,~,pd_3_0]=fcn_r(0,para);

 x=x_0_vec;
 u=pd_3_0;
%%%%%%%%%%%%%%%%%%
m=para(2);
gra=para(3);
e3=para(16:18);
sigma=para(20);
eta=para(21);

pd=x(1:3);
pd_1=x(4:6);
pd_2=x(7:9);
z1=x(10:12);
z2=x(13:15);
r3=x(16:18);
s1=x(19);
s2=x(20:22);
xi=x(1:22);
q=x(23);

r=[pd;pd_1;pd_2];
z=[z1;z2;r3];

pd_3=u;

pdd=pd_1;
pd_1d=pd_2;
pd_2d=pd_3;
z1d=z2;
z2d=-1./m.*r3*s1+gra.*e3-pd_2;
r3d=-S(r3)*s2;
s1d=0;
s2d=zeros(3,1);
qd=0;

z2cld=-1./m.*r3*fcn_T(r,z,para)+gra.*e3-pd_2;
r3cld=-S(r3)*fcn_w(r,z,pd_3,q,para);

f_map=[pdd;pd_1d;pd_2d;z1d;z2d;r3d;s1d;s2d;qd];
fcl_map=[pdd;pd_1d;pd_2d;z1d;z2cld;r3cld;s1d;s2d;qd];

grad_V=fcn_grad_V(x,para);

% if (grad_Vq'*f<=sigma.*Lyacldot)%not correct, because there are numerical errors
% due to the equation I_3-r3^\top*r3=-S^2(r3) when getting the closed-loop
% expression for eqn 12
%%%C_1\cap C_2
value_C_1=(fcn_V(x,para)-min(fcn_V([xi;-1],para),fcn_V([xi;1],para))<=eta);
value_C_2=(grad_V'*f_map<=sigma.*grad_V'*fcl_map);
if (value_C_1==1)&&(value_C_2==1)
    value = 1;
else
    value = 0;
end
