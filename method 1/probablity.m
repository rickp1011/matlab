 function o = probablity(o,T)        % o is a 2 element array representing counts of females and males
                                     % T is the total count of females and males
        prob_female = (o(1) /T) *100;  % divide the count of females o(2) by the total count (T)
                                     % multiply by 100 to express as a percentage
        prob_male = (o(2) /T)*100;     % divide the count of males 0(1) by the total count (T)
                                     % multiply by 100 to express as a percentage   
        o = [prob_female,prob_male]; % o array containing calculated probabilities of females and males
    end