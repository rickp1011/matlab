function z = fourvariable(x,a,col,h,j,k,l)   %user defined function for chest pain type, positive for heart disease
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
