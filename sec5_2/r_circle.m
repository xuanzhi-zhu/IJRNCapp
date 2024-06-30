function [pd,pd_1,pd_2,pd_3] = r_circle(t)
% function [pr,prd,prdd,prddd,prd4] = p_desired_circle(t)
%P_DESIRED_CIRCLE Summary of this function goes here
%   Detailed explanation goes here
%#codegen

r=1.2;
w1=1;
w2=1;
%translation along z-axis
h=-1;

x=r*cos(w1*t);
y=r*sin(w2*t);

x_1=-r*w1*sin(w1*t);
y_1=r*w2*cos(w2*t);

x_2=-r*w1*w1*cos(w1*t);
y_2=-r*w2*w2*sin(w2*t);

x_3=r*w1*w1*w1*sin(w1*t);
y_3=-r*w2*w2*w2*cos(w2*t);

% xd4=r*w1*w1*w1*w1*cos(w1*t');
% yd4=r*w2*w2*w2*w2*sin(w2*t');

%rotate about x-axis of 30/180*pi rad (Roll-Pitch-Yaw)
roll=0/180*pi;
%rotate about x-axis of 30/180*pi rad (Roll-Pitch-Yaw)
pitch=0/180*pi;
%rotate about z-axis of 30/180*pi rad
yaw=0/180*pi;

R=[   cos(yaw), -sin(yaw),          0,  0;
      sin(yaw),  cos(yaw),          0,  0;
             0,         0,          1,  0;
             0,         0,          0,  1];
R=[ cos(pitch),         0, sin(pitch),  0;
             0,         1,          0,  0;
   -sin(pitch),         0, cos(pitch),  0;
             0,         0,          0,  1]*R;
Rot=[          1,             0,           0, 0;
             0,     cos(roll),  -sin(roll), 0;
             0,     sin(roll),   cos(roll), 0;
             0,             0,           0, 1]*R;
   
%%%get the rotated position vector
pd=[  x;
     y;
     0;
     1];
pd=Rot*pd;
pd=[    eye(3), [0 0 h]';
         zeros(1,3),        1]*pd;
pd=pd(1:3,1);

% plot3(x_desired,y_desired,z_desired)
% set(gca,'ZDir','reverse');
% axis([-4 4 -4 4 0 2])
% axis equal
% xlabel('x/m');ylabel('y/m');zlabel('z/m');
% grid on

%%%get the rotated (just rotated) velocity vector
pd_1=[  x_1;
       y_1;
        0;
        1];
pd_1=Rot*pd_1;
pd_1=[    eye(3), zeros(3,1);
         zeros(1,3),          1]*pd_1;
pd_1=pd_1(1:3,1);

%%%get the rotated (just rotated) acceleration vector
pd_2=[  x_2;
        y_2;
          0;
          1];
pd_2=Rot*pd_2;
pd_2=[    eye(3), zeros(3,1);
          zeros(1,3),          1]*pd_2;
pd_2=pd_2(1:3,1);

%%%get the rotated (just rotated) derivative of acceleration vector
pd_3=[  x_3;
        y_3;
          0;
          1];
pd_3=Rot*pd_3;
pd_3=[    eye(3), zeros(3,1);
          zeros(1,3),          1]*pd_3;
pd_3=pd_3(1:3,1);

% p_d4=[  xd4;
%         yd4;
%           0;
%           1];
% p_d4=Rot*p_d4;
% p_d4=[    eye(3), zeros(3,1);
%           zeros(1,3),          1]*p_d4;
% p_d4=p_d4(1:3,1);


%check condition

%eqn 7
% Fd(r)
% T_{A_d}(r)
% A_d=

%eqn 8
%|pd_2|=|R1*pd_2(1);R2*pd_2(2);R3*pd_2(3)|=sqrt(3).*|r|<gra
% where R=[R1;R2;R3]

end

