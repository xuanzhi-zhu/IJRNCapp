clear all
close all

load data_q

T_omega=figure();

clf
subplot(2,1,1);
modificatorJ{1} = '--';
plotHarc(t,j,s1,[],[],modificatorJ);
% plot(t,s1);
grid on;
set(gca, 'FontSize', 12);
leg = legend('$s_1$','Orientation','horizontal');
set(leg,'Orientation','horizontal','Location','southeast',...
    'Interpreter','latex',...
    'FontSize',12);
% xlabel('$t(s)$', 'Interpreter', 'latex', 'Fontsize', 12);
ylabel('$s_1\,(kg\,m\,s^{-2})$', 'Interpreter', 'latex', 'Fontsize', 12);
axis tight
xlim([0,12]);

subplot(2,1,2);
modificatorJ{1} = '--';
plotHarc(t,j,s2,[],[],modificatorJ);
% plot(t,s2);
grid on;
set(gca, 'FontSize', 12);
leg = legend('$s_{21}$', '$s_{22}$', '$s_{23}$','Orientation','horizontal');
set(leg,'Orientation','horizontal','Interpreter','latex','FontSize',12);
xlabel('$t\,(s)$', 'Interpreter', 'latex', 'Fontsize', 12);
ylabel('\boldmath$s$\unboldmath$_2\,(s^{-1})$', 'Interpreter', 'latex', 'Fontsize', 12);
axis tight
xlim([0,12]);

% % plot s1 and s2
% figure(2)
% clf
% subplot(2,1,1), plotHarc(t,j,s1);
% grid on
% ylabel('s1')
% subplot(2,1,2), plotHarc(t,j,s2);
% grid on
% ylabel('s2')
% save2pdf('A_T_omega',T_omega,900);