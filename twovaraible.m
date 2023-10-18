function z = twovaraible(x,a,col,h,k)
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

