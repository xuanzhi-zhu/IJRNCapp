%%%% note 1: make a modification WRT original_C_D_20181031 in terms of:
%%%% initial state are selected IN BOTH the C_2\cap D_2, that is, a jump or
%%%% a flow can both occur, POSSIBLY controlled by rule=1 or rule=2
%%%% It can be expected that q^+=q or q^+=-q, leading to two different
%%%% eventual configuration of the quadrotor thrust direction

%%%%% note 2: the lemniscate trajectory can be used because the
%%%%% sup_{t>=0}|pd_2(t)| is calculated and K_\beta can be chosen
%%%%% accordingly

%step 1:open initialization.m, set nPoints= how many initial points to simulate?
%step 2:open quadrotor.slx, double click the block named "Double Click to Initialize"
%step 3:open postprocessing.m and run
%step 4:plots: open plot_z, plot_T_omega in this file directory if PDFs are
%wanted, open the subfolder "figures_matlab_code_wo" under "20181006" to
%plot if EPSs are wanted

%states: z1,z2,r3
clear all 
close all

rng('shuffle');

% physical variables
global r_index m gra kp kv gamma kw M_beta_z K_beta_z e1 e2 e3 epsilon sigma eta delta M_beta_x M_beta_y K_beta_x K_beta_y para
r_index=2;% 1 for circle / 2 for lemniscate / 3 for stationary%%para(1)
m=0.2;%%para(2)
gra=9.8;%%para(3)
kp=2;%kp>0%%para(4)
kv=2;%kv>0%%para(5)
gamma=0.8;%0<gamma<kv%%para(6)
kw=5;%kw>0%%para(7)   kw=20;
M_beta_z=1;%M_beta>0%%para(8)
K_beta_z=4.3;
K_beta_z=1;%0<K_beta<sqrt(3)./3.*(gra-sup|pd_2|)
%r_index=1,0<K_beta<sqrt(3)./3.*(gra-|r|), when r=1.2, 0<K_beta<4.965
%r_index=2,0<K_beta<sqrt(3)./3.*(gra-sup|pd_2|), 0<K_beta<4.214
%r_index=3,0<K_beta<sqrt(3)./3.*gra=5.658%%para(9)
e1=[1,0,0]';%%para(10:12)
e2=[0,1,0]';%%para(13:15)
e3=[0,0,1]';%%para(16:18)
epsilon=20;%epsilon>0%%para(19)   epsilon=20;
sigma=0.01;%0<sigma<1      0.9 0.5 0.1  0.01 0.0001%%para(20)
eta=0.9.*2.*epsilon;%0<eta<2*epsilon%%para(21)
delta=1e-3;%delta<=fcn_V(x(0,0),para)%%para(22)
M_beta_x=1;%%para(23)
M_beta_y=1;%%para(24)
K_beta_x=1;%%para(25)
K_beta_y=1;%%para(26)
%para=[r_index;m;gra;kp;kv;gamma;kw;M_beta;K_beta;e1;e2;e3;epsilon;sigma;eta];%
para=[r_index;m;gra;kp;kv;gamma;kw;M_beta_z;K_beta_z;e1;e2;e3;epsilon;sigma;eta;delta;M_beta_x;M_beta_y;K_beta_x;K_beta_y];
%%%===========================================================
%%%%%create initial points
% nPoints=1;
% [x_0_vec,inside_C_1_D_1]=fcn_initial_uniform_eta(nPoints,para);
% save data_x_0_vec x_0_vec
%%%%%%===========================================================

% simulation horizon
T = 18;
J = 35000;

% rule for jumps
% rule = 1          q_switched
% rule = 2          q_remain
rule = 1;

RelTol=1e-6;
AbsTol=1e-6;
MaxStep=1e-3;

% % simulation for different initial points
load data_x_0_vec x_0_vec
t_0=0;
No_cols=size(x_0_vec,2);
statistics_vec=zeros(7,No_cols);
for i=1:1:No_cols
    x_0=x_0_vec(:,i);
    sim quadrotor_20181106;
    statistics_vec(:,i)=fcn_statistics(t,j,x);
end

%%%data_t_j_wo_q_remain OR data_t_j_wo_q_switched
% t_wo_q_remain=t;
% j_wo_q_remain=j;
% save data_t_j_wo_q_remain t_wo_q_remain j_wo_q_remain
% 
t_wo_q_switched=tout;
j_wo_q_switched=j;
save data_t_j_wo_q_switched t_wo_q_switched j_wo_q_switched