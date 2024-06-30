function statistics_vec= fcn_statistics(t,j,x)

% extract states
Lya=x(:,24);

%%%%check the time for V to decrease form V(t=0,j=0) to 0.01V(may not stay within afterwards), denoted by T_star
i=1;
V=Lya;
while ((i<=length(t))&&(V(i)>=1/100*V(1)))
    i=i+1;
    if i<=length(t)
        T_star=t(i);
        J_star=j(i);%no. of transmissions corresponding to T_star
    end
end

%%%%average transmission time and least transmission time
i=1;
trans=[];
for i=1:1:(length(t)-1)
    if (j(i)~=j(i+1))%%(t(i+1)>t(i)) could be added to avoid multiple jumps at the same instant, but since the sampling interval in the computer does not have to coincide with the exact event instants, therefore we cannot extinguish between one jump with two jumps. And in the occurence of two jumps, the number of transmission intervals are counted more than the actual number, so that the average inter-transmission time is estimated lower than the actual one.
        t_i=t(i);
        trans=[trans;t_i];%instants of transmission
    end
end

inter_trans=trans-[0;trans(1:(length(trans)-1))];%inter transmission time(maybe we shall redefine the def. because there are two jumps at one instant so that the inter-transmission time is 0)
trans_avr=mean(inter_trans);%average inter transmission time
trans_min=min(inter_trans);%minimum transmission time
[trans_max,max_index]=max(inter_trans);%maximum transmission time

%%%number of transmission
n_trans=length(trans);

%%%the time to reach the neighborhood near the origin t_reach
%%%this is the final stopping time w/o change of the jump and flow sets
t_reach=t(length(t));

statistics_vec=[T_star,J_star,trans_avr,trans_min,trans_max,n_trans,t_reach]';

end