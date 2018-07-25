function [index,sojourn_time,data] = get_Last_Location(feasible_last_loc,survival_time,cluster_set,dgr,M,N);

sz = size(feasible_last_loc);
sz = sz(1,2);
data = zeros(1,sz);
max_data = -inf;

for i = 1:sz
    j = feasible_last_loc(1,i);
    for k =1:N
        if(cluster_set(j,k) == 1)
            data(1,i) = data(1,i) + survival_time(1,k) * dgr;
        end
    end
    if(max_data < data(1,i))
        max_data = data(1,i);
        index = i;
    end
end
clear data;

[data,sojourn_time] = get_data_amount(N,index,survival_time,cluster_set,dgr);

end