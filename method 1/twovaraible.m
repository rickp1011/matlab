function z = twovaraible(x,a,col,h,k)
%
Function to count columns with four criteria x is the input array , a is the counts put in an array
col is the column we want 
h,k is the criteria stated in the problem like for example in col 2 where it is to represent gender 
h is 1 means male ,k is 0 means female  
columns  that use fourvariable function are : 6,9,and 2
%
    for t=1:size(x)
        switch(x(t,col))
            case h
                a(1) = a(1) +1 ;
            case k
                a(2) = a(2) +1;
        end
    end
    z = a;
end

