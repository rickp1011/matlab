function [m,n] = calculationstdev_mean(x) 
%User defined function, calculations of standard deviation and mean value
%and put in an array for all columns so that can compare mean and sd for
%all columns then we can get a good comaprison
    m = mean(x);
    n = std(x);
end