function [pd,pd_1,pd_2,pd_3] = fcn_r(t,para)

r_index=para(1);

switch r_index
    case 1
        [pd,pd_1,pd_2,pd_3] = r_circle(t);
    case 2
        [pd,pd_1,pd_2,pd_3] = r_lemniscate(t);
    case 3
        [pd,pd_1,pd_2,pd_3] = r_stationary(t);
end

end