function [feasible_last_loc] = get_last_feasible_loc(dist,trajectory,time,vel,M)

origin =  trajectory(1,1);
present = trajectory(end);
feasible_last_loc = 0;
for i = 1 : M
    if(( time - (dist(present,i)/vel) - (dist(i,origin)/vel)) > 0)
        if( feasible_last_loc == 0)
            feasible_last_loc = i;
        else
            feasible_last_loc = [feasible_last_loc i];
        end
    end
end

end