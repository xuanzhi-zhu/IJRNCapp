close all
clear all

t=(0:0.1:100)';

pd=zeros(length(t),3);
pd_1=zeros(length(t),3);
pd_2=zeros(length(t),3);
pd_3=zeros(length(t),3);

% for i=1:1:length(t)
%     [pd(i,:),pd_1(i,:),pd_2(i,:),pd_3(i,:)] = r_circle(t(i));
% end

for i=1:1:length(t)
    [pd(i,:),pd_1(i,:),pd_2(i,:),pd_3(i,:)] = r_lemniscate(t(i));
end

norm_pd_2=sum(pd_2.^2,2).^(1/2);