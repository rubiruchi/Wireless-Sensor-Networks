function [feasible_loc] = get_next_feasible_loc(dist,trajectory,time,vel,M)

feasible_loc = 0;
index = trajectory(end);
%display("Trajectory : " + trajectory(1,:) +" Time: "+ time);
for i = 1 : M
    if( i ~= index)
        t_left = time - (dist(index,i) / vel) - (dist(i,trajectory(1,1)) / vel) ;
        if(t_left > 0)
            if( feasible_loc == 0)
                feasible_loc = i;
            else
                feasible_loc = [feasible_loc  i];
            end
            
        end
        
    end
end

end