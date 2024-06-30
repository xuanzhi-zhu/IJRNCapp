close all
clear all
load data_x

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

% plot error states z1 z2 z3
figure(1)
clf
subplot(3,1,1), plotHarc(t,j,z1);
grid on
ylabel('z1')
subplot(3,1,2), plotHarc(t,j,z2);
grid on
ylabel('z2')
subplot(3,1,3), plotHarc(t,j,z3);
grid on
ylabel('z3')

% plot s1 and s2
figure(2)
clf
subplot(2,1,1), plotHarc(t,j,s1);
grid on
ylabel('s1')
subplot(2,1,2), plotHarc(t,j,s2);
grid on
ylabel('s2')

%check if the integrated Lya from Lyad equals to the analytical V
figure(3)
plot(t,err_Lya,'b')