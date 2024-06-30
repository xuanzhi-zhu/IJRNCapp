clear all
close all

load data_x

z=figure();

clf
subplot(3,1,1), plotHarc(t,j,z1);
grid on;
set(gca, 'FontSize', 12);
leg = legend('$z_{11}$', '$z_{12}$', '$z_{13}$','Orientation','horizontal');
set(leg, 'Interpreter', 'latex','FontSize', 12);
% xlabel('$t(s)$', 'Interpreter', 'latex', 'Fontsize', 12);
ylabel('\boldmath$z$\unboldmath$_1\,(m)$', 'Interpreter', 'latex', 'Fontsize', 12);
axis tight
xlim([0,12]);

subplot(3,1,2), plotHarc(t,j,z2);
grid on;
set(gca, 'FontSize', 12);
leg = legend('$z_{21}$', '$z_{22}$', '$z_{23}$','Orientation','horizontal');
% set(leg, 'Interpreter', 'latex','FontSize', 12);
set(leg,...
    'Position',[0.56906715801784 0.580079365751676 0.313075699125018 0.0564285717313251],...
    'Orientation','horizontal',...
    'Interpreter','latex',...
    'FontSize',12);
% xlabel('$t(s)$', 'Interpreter', 'latex', 'Fontsize', 12);
ylabel('\boldmath$z$\unboldmath$_2\,(m\,s^{-1})$', 'Interpreter', 'latex', 'Fontsize', 12);
axis tight
xlim([0,12]);

subplot(3,1,3), plotHarc(t,j,z3);
grid on;
set(gca, 'FontSize', 12);
leg = legend('$z_{31}$', '$z_{32}$', '$z_{33}$','Orientation','horizontal');
set(leg,'Orientation','horizontal','Location','southeast',...
    'Interpreter','latex',...
    'FontSize',12);
xlabel('$t\,(s)$', 'Interpreter', 'latex', 'Fontsize', 12);
ylabel('\boldmath$z$\unboldmath$_3$', 'Interpreter', 'latex', 'Fontsize', 12);
axis tight
xlim([0,12]);

% save2pdf('A_z',z,900);