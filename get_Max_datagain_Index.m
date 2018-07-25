function [index,mdata,cluster_data,sojourn_time,stoppage_time,energy] = get_Max_datagain_Index(trajectory,feasible_loc,survival_time,sojourn_time,cluster_set,energy,cluster_data,dgr,dist,vel,M,N);

data = zeros(1,M);
mdatagain = -inf;
sz = size(feasible_loc);
sz = sz(1,2);
for j=1:sz
    i = feasible_loc(1,j);
    [data(1,i),sojourn_time(1,i)] = get_data_amount(N,i,survival_time,cluster_set,dgr);
    cluster_data(1,i) = data(1,i);
    d_cost = dist(trajectory(end) , i) + dist(trajectory(1,1) , i) - dist(trajectory(end) , trajectory(1,1));
    t_cost = d_cost / vel;
    datagain = data(1,i) / t_cost;
    if(datagain > mdatagain)
        mdatagain = datagain;
        mdata = data(1,i);
        index = i;
    end
end

stoppage_time = sojourn_time(1,index);

end