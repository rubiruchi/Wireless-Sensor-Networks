function [index,mdata,cluster_data,sojourn_time,stoppage_time,energy] = getMaxIndex(feasible_loc,survival_time,sojourn_time,cluster_set,energy,cluster_data, dgr, M, N)

%for i=1:N
%    if(clusters(1,i) ~=0)
%        head = clusters(1,i);
%        cluster_data(1,head) = cluster_data(1,head) + survival_time(1,i) * dgr;
%    end
%end
data = zeros(1,M);
mdata = -inf;
sz = size(feasible_loc);
sz = sz(1,2);
for j=1:sz
    i = feasible_loc(1,j);
    [data(1,i),sojourn_time(1,i)] = get_data_amount(N,i,survival_time,cluster_set,dgr);
    cluster_data(1,i) = data(1,i);
    if(data(1,i) > mdata)
        mdata = data(1,i);
        index = i;
    end
end

stoppage_time = sojourn_time(1,index);

end