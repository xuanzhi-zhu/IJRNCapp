function [x_0_vec,inside_C_1_D_1] = fcn_initial_uniform_eta(nPoints,para)

%x_0_vec: 24*nPoints, each column is a random initial state
m=para(2);
gra=para(3);
e3=para(16:18);
epsilon=para(19);
sigma=para(20);
eta=para(21);

% Pre-allocate memory for the random data
z1_0_vec = zeros(3,nPoints);
z2_0_vec = zeros(3,nPoints);
r3_0_vec = zeros(3,nPoints);
s1_0_vec=zeros(1,nPoints);%initial values of actuation signals do not really have to obey the control law T(r,z) and w(r,z,...) 
s2_0_vec=zeros(3,nPoints);
q_0_vec=zeros(1,nPoints);%initial desired direction do not really have to be a specified one of {-1,1}
Lya_0_vec=zeros(1,nPoints);%check correctness

% Initialize counter for the number of points we have
i = 0;
% Initial state of the reference trajectory
[pd_0,pd_1_0,pd_2_0,pd_3_0]=fcn_r(0,para);
r_0=[pd_0;pd_1_0;pd_2_0];

% Run a loop until we have the number we need
while i < nPoints
    z1_bound=5;%can be each \real_{>=0}
    z2_bound=0.5;%can be each \real_{>=0}
	z1_0=-z1_bound+2.*z1_bound.*rand(3,1);
	z2_0=-z2_bound+2.*z2_bound.*rand(3,1);
    
    %     q_0=(-1)^(round(rand(1)));%randomly choose 1 or -1 with equal probability
    q_0=1;%we'd like r3 to approach the normal thrust direction r3d, but it depends much on whether a jump or a flow happens at the initial time

    %%%===========================================================
    %%%use geometric properties to find r3_0
    zeta_0=[r_0;z1_0;z2_0];
    
    A=-2.*epsilon.*(fcn_r3d(zeta_0,para));
    B=eta;
    R=realsqrt(1-B.^2/(A'*A));
    if (A(1)==0)&&(A(2)==0)
        N=[1;0;0];
    elseif (A(1)==0)&&(A(2)~=0)
        N=[1;0;0];
    elseif (A(1)~=0)&&(A(2)==0)
        N=[0;1;0];
    else
        M=[-2/A(1);1/A(2);1/A(3)];%A'*M=0
        N=M/norm(M);%A'*N=0 and |N|=1
    end
    r3_0=A*B/(A'*A)+R.*N;
    %%%===========================================================
    
    z_0=[z1_0;z2_0;r3_0];
    %%%===========================================================
%     s1_0=fcn_T(r_0,z_0,para);
%     s2_0=fcn_w(r_0,z_0,pd_3_0,q_0,para);
    %%%===========================================================
    s1_0=0;
    s2_0=zeros(3,1);
    %%%===========================================================
    x_0_pre=[r_0;z1_0;z2_0;r3_0;s1_0;s2_0;q_0];
    Lya_0=fcn_V(x_0_pre,para);
  
    %recheck using the definitions of C_1 and D_1
    xi_0=x_0_pre(1:22);
    inside_C_1_D_1=(Lya_0-min(fcn_V([xi_0;-1],para),fcn_V([xi_0;1],para))==eta);
    
    %recheck if in C_1 & in C_2 & in D_1
    pdd=pd_1_0;
    pd_1d=pd_2_0;
    pd_2d=pd_3_0;
    z1d=z2_0;
    z2d=-1./m.*r3_0*s1_0+gra.*e3-pd_2_0;
    r3d=-S(r3_0)*s2_0;
    s1d=0;
    s2d=zeros(3,1);
    qd=0;
    z2cld=-1./m.*r3_0*fcn_T(r_0,z_0,para)+gra.*e3-pd_2_0;
    r3cld=-S(r3_0)*fcn_w(r_0,z_0,pd_3_0,q_0,para);
    
    f_map=[pdd;pd_1d;pd_2d;z1d;z2d;r3d;s1d;s2d;qd];
    fcl_map=[pdd;pd_1d;pd_2d;z1d;z2cld;r3cld;s1d;s2d;qd];
    
    x_0=[x_0_pre;Lya_0];
    grad_V=fcn_grad_V(x_0,para);
    value_C_2=(grad_V'*f_map<=sigma.*grad_V'*fcl_map);
    
    %%%%%%%%%
    if value_C_2==1
        i = i+1;
   
        z1_0_vec(:,i) = z1_0;
        z2_0_vec(:,i) = z2_0;
        r3_0_vec(:,i) = r3_0;
        s1_0_vec(:,i) = s1_0;
        s2_0_vec(:,i) = s2_0;
        q_0_vec(:,i) = q_0;
        Lya_0_vec(:,i) = Lya_0;
    end
end

x_0_vec = [r_0*ones(1,nPoints);z1_0_vec;z2_0_vec;r3_0_vec;s1_0_vec;s2_0_vec;q_0_vec;Lya_0_vec];

end