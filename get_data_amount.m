function [d,s_time] = get_data_amount(N,head,survival_time,cluster_set,dgr)
%% making the set of neighbouring sensors

Ns=0;

for i=1:N
    if(cluster_set(head , i) == 1)
        if( Ns == 0)
            Ns = survival_time(1 , i);
        else
            Ns = [Ns survival_time(1 , i)];
        end
    end
end

z = size(Ns);
k = z(1,2);
id = 1:k;


%% Sorting sensors in descending order of their survival times...

[Ns,id] = sort(Ns,'descend');
%display("Ns = " + Ns(1,:));
%display("id = " + id(1,:));

local_data = zeros(1,k);

for p=1:k
    local_data(1,p) = p * Ns(1,p) * dgr;   %adding data for each survival time of sensors
    %display("Location "+ head +" "+ local_data(1,p) + " " );
end

%% Finding the maximum volume of collectable data and associated sojourn time...

d=local_data(1,1);
index=1;
for p=2:k
    if(local_data(1,p)>= d)
        d=local_data(1,p);
        index=p;
    end
end

%display("Location " + head + " data = "+d+ " index = " +  index);
s_time = Ns(1,index);

clear Ns;
clear z;

end