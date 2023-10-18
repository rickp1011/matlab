function z = threevaraible(x,a,col,j,k,l)
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