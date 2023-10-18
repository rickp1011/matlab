    function o = probablity(o,T)
        prob_female = o(2) /T *100;
        prob_male = o(1) /T*100;
        o = [prob_female,prob_male];
    end
        %function to calculate the probabilty