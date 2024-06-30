% to find r3_0 such that it is in C_2 and D_2

method 1 (BUT not working because this is nonconvex problem)
%     %%%check if the initial state are selected IN BOTH the C_2\cap D_2 (or
%     %%%at least near), here using convex optimization algorithms to find
%     %%%r3_0(which is faster than the method below). we can PROVE that IN
%     %%%BOTH the C_2\cap D_2 is equivalent to q_0=-argmin{...,...}, and the
%     %%%difference is given by <-2.*epsilon.*(fcn_r3d(zeta_0,para))'*r3_0>
%     %%%regardless of z1_0 and z2_0 (BUT not working because this is nonconvex problem)
%     zeta_0=[r_0;z1_0;z2_0];
%     cvx_begin
%         variable r3_0(3);
%         variable t
%         minimize(t);
%         subject to
%             -2.*epsilon.*(fcn_r3d(zeta_0,para))'*r3_0==eta;
%             t+1>=r3_0'*r3_0;
%             t+1<=r3_0'*r3_0; %%this creates an nonconvex set
%             t>=0;
%     cvx_end
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

method 2 (working but the error will be in norm(r3_0), and we cannot control the distribution of the solution)
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     %%%nonlinear programme to solve r3_0
%     zeta_0=[r_0;z1_0;z2_0];
%     
%     fun=@(w)0;
%     w0=ones(3,1);
%     A=[];
%     b=[];
%     Aeq=-2.*epsilon.*(fcn_r3d(zeta_0,para))';
%     beq=eta;
%     lb=[];
%     ub=[];
%     nonlcon=@fcn_nonlcon;
%     [w,~,exitflag,~] = fmincon(fun,w0,A,b,Aeq,beq,lb,ub,nonlcon);
%     r3_0=w;
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%     z_0=[z1_0;z2_0;r3_0];
%     s1_0=fcn_T(r_0,z_0,para);
%     s2_0=fcn_w(r_0,z_0,pd_3_0,q_0,para);
%     x_0=[r_0;z1_0;z2_0;r3_0;s1_0;s2_0;q_0];%q is included as a state in the whole state x
%     xi_0=x_0(1:22);
%     
%     %%%recheck if the nonlinear programme gives the right r3_0
% 
%     Lya_0=fcn_V(x_0,para);
%     inside_C_2_D_2=(Lya_0-min(fcn_V([xi_0;-1],para),fcn_V([xi_0;1],para))==eta);
%     
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

method 3 (working but the error will be in norm(r3_0), but we cannot control the distribution of the solution)
%     near_C_2_D_2=0;
%     while near_C_2_D_2~=1
%         theta=2.*pi.*rand();
%         phi=acos(1-2.*rand());
%         r3_0=[sin(phi).*cos(theta);...
%             sin(phi).*sin(theta);...
%             cos(phi)];
%         inside_D_2=(-2.*q_0.*epsilon.*(fcn_r3d(zeta_0,para))'*r3_0>eta);%a jump must occur and q^+=-q
%         near_C_2=(norm(-2.*q_0.*epsilon.*(fcn_r3d(zeta_0,para))'*r3_0-eta)<1e-4);
%         near_C_2_D_2=inside_D_2&&near_C_2;
%     end
