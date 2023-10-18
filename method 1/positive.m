function [z,q,t] = positive()
    load("HeartDisease.mat");
    x=sortrows(T,14,"descend");
    for t = 1:size(x)
        if ((x(t,14) >= 1 ))
            z(t,:)= x(t,:);
        elseif((x(t,14) == 0 ))
            q(t,:)= x(t,:);
        end
    end
    indicesz = z(:,1) == 0;
    z(indicesz,:) = [];
    indicesq = q(:,1) == 0;
    q(indicesq,:) = []; 
    t = length(T);
end