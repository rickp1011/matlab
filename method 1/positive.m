function [z,q,t] = positive()
%this user defined function is to sort the Heart attack and  
%the healthy  into different arrays  of heart attack and healthy  from the T files
    load("HeartDisease.mat");       
    x=sortrows(T,14,"descend");
    for t = 1:size(x)
        if ((x(t,14) >= 1 ))
            z(t,:)= x(t,:);
        elseif((x(t,14) == 0 ))
            q(t,:)= x(t,:);
        end
    end
% sorting of the different arrays those that have nan in the last row will not be counted
    indicesz = z(:,1) == 0;
    z(indicesz,:) = [];
    indicesq = q(:,1) == 0;
    q(indicesq,:) = []; 
    t = length(T);
%removing zeros for those that are zeros as after sorting is done there will be zeros in bothe the array
% this part removes all the zeros except for the output so that it wont be
% counted 
%total 48 healty 39 heart attack as nan cannot be counted
end