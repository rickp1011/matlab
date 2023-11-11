function z = fourvariable(x,a,col,h,j,k,l) 
%Function to count columns with four criteria x is the input array , a is the counts put in an array
%col is the column we want 
%h,j,k,l is the criteria stated in the problem like for example in col 12 where it is to represent the number of blood vessesls coloured 
%h means  0 blood vessel coloured , j is 1 blood vessel coloured and k is 2 blood vessel coloured , and l is 3 blood vessel coloured
%functions that use fourvariable function are : 3 and 12 
%
    for t=1:size(x)
        switch(x(t,col))
            case h
                a(1) = a(1) +1 ;
            case j
                a(2) = a(2) +1;
            case k
                a(3) = a(3)+1;
            case l
                a(4) = a(4) +1;
        end
    end
    z = a;
end