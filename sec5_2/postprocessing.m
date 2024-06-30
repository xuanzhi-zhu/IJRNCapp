%%%only for nPoints=1, because x here is a single simulation result
% extract states
pd=x(:,1:3);
pd_1=x(:,4:6);
pd_2=x(:,7:9);
z1=x(:,10:12);
z2=x(:,13:15);
r3=x(:,16:18);
s1=x(:,19);
s2=x(:,20:22);
q=x(:,23);
Lya=x(:,24);

r=x(:,1:9);
zeta=[r,z1,z2];

%check if the Lya got from integrating Lyad EQUALS the actual expression for V
Lya_actual=zeros(size(Lya));
for i=1:1:length(t)
    Lya_actual(i)=fcn_V(x(i,:)',para);
end
err_Lya=Lya-Lya_actual;

%compute the error between r3 and (q.*r3d)
z3=zeros(size(r3));
for i=1:1:length(t)
    z3_intermediate=r3(i,:)'-q(i).*fcn_r3d(zeta(i,:)',para);
    z3(i,:)=z3_intermediate';
end
%data_x_w_q_remain OR data_x_w_q_switched
save data_x_w_q_remain

% save data_x_w_q_switched