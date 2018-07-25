function [clusters] = make_cluster( N , sensor_pos , M , locations , Rm , clusters)

for i = 1 : N
    for j = 1 : M
        
        xlen = sensor_pos(i,1) - locations(j,1);
        ylen = sensor_pos(i,2) - locations(j,2);
        len = xlen*xlen + ylen*ylen;
        if( clusters(1,i) == 0)   %% sensor not assingned
            
            if( len < Rm*Rm )
                clusters(1,i) = j;
            end
            
        else                    %% sensor already assigned
            
            loc = clusters(1,i);
            x_length = sensor_pos(i,1) - locations(loc,1);
            y_length = sensor_pos(i,2) - locations(loc,2);
            length = x_length*x_length + y_length*y_length;
            
            if( len < length ) %% linking with closest location
                clusters(1,i)=j;
            end
            
        end
    end
end
end