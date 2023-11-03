function z = threevaraible(x,a,col,j,k,l)
%Function to count columns with three criteria x is the input array , a is the counts put in an array
%col is the column we want 
%j,k,l is the criteria stated in the problem like for example in col 13  where it is to represent the thalium stress test result
%j is 3 , k is 6 and l is 7 
%columns that use three variable function are :7, 11 and 13
%
    for t=1:size(x)
        switch(x(t,col))
            case j
                a(1) = a(1) +1 ;
            case k
                a(2) = a(2) +1;
            case l
                a(3) = a(3)+1;
        end
    end
    z = a;
end
