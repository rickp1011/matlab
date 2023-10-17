classdef variables
    properties
        gender = [0,0];
        chest_pain_type = [0,0,0,0];
        fbs = [0,0];
        ecg = [0,0,0]
        exang = [0,0];
        slope = [0,0,0];
        ca = [0,0,0,0];
        thal = [0,0,0];
        stand=[];
        average = [];
        prob = [];
    end
    methods
        function [z,q] = positive(obj)
            load("HeartDisease.mat");
            x=sortrows(T,14,"descend");
            for t = 1:size(x)
                if ((x(t,14) >= 1 ))
                    z(t,:)= x(t,:);
                elseif((x(t,14) == 0 ))
                    q(t,:)= x(t,:);
                end
    
            end
            indicesz = z(:,1) == 0;
            z(indicesz,:) = [];
            indicesq = q(:,1) == 0;
            q(indicesq,:) = []; 
        end
        function [z,a] = fourvariables(obj,r)
             for t=1:size(r)
                switch(r(t,3))
                    case 1
                        obj.chest_pain_type(1) = obj.chest_pain_type(1) +1 ;
                    case 2
                        obj.chest_pain_type(2) = obj.chest_pain_type(2) +1;
                    case 3
                        obj.chest_pain_type(3) = obj.chest_pain_type(3)+1;
                    case 4
                        obj.chest_pain_type(4) = obj.chest_pain_type(4) +1;
                end
                switch(r(t,12))
                    case 0
                        obj.ca(1) = obj.ca(1) +1 ;
                    case 1
                        obj.ca(2) = obj.ca(2) +1;
                    case 2
                        obj.ca(3) = obj.ca(3)+1;
                    case 3
                        obj.ca(4) = obj.ca(4) +1;
                end

             end
             z= obj.chest_pain_type;
             a= obj.ca;
        end
        %function to count chest pain types

%function to count number of blood vessels coloured s
        function [z,a,w] = threevariables(obj,r)
            for t=1:size(r)
                switch(r(t,7))
                    case 0
                        obj.ecg(1) = obj.ecg(1) +1 ;
                    case 1
                        obj.ecg(2) = obj.ecg(2) +1;
                    case 2
                        obj.ecg(3) = obj.ecg(3)+1;
                end
               switch(r(t,13))
                    case 3
                        obj.thal(1) = obj.thal(1) +1 ;
                    case 6
                        obj.thal(2) = obj.thal(2) +1;
                    case 7
                        obj.thal(3) = obj.thal(3)+1;
               end
               switch(r(t,11))
                    case 1
                        obj.slope(1) = obj.slope(1) +1 ;
                    case 2
                        obj.slope(2) = obj.slope(2) +1;
                    case 3
                        obj.slope(3) = obj.slope(3)+1;
                end
            end
            z= obj.ecg;
                a = obj.slope;
                w= obj.thal;
        end
          
        %function to count thalium types
        function [z,a,w] = twovariables(obj,r)
            for t=1:size(r)
                switch(r(t,6))
                    case 1
                        obj.fbs(1) = obj.fbs(1) +1 ;
                    case 0
                        obj.fbs(2) = obj.fbs(2) +1;
                end
                switch(r(t,9))
                    case 1
                        obj.exang(1) = obj.exang(1) +1 ;
                    case 0
                        obj.exang(2) = obj.exang(2) +1;
                end
                switch(r(t,2))
                    case 1
                        obj.gender(1) = obj.gender(1) +1 ;
                    case 0
                        obj.gender(2) = obj.gender(2) +1;
                end

                end
               
                z = obj.fbs;
                    a = obj.exang;
                    w = obj.gender;
            end
                


            function [z,a] = calculation_stats(obj,r)
                obj.average = mean(r);
                obj.stand = std(r);
                z = obj.average;
                a = obj.stand;
         end
%function to calcuate mean


        function obj = probablity(obj)
        prob_female = obj.gender(2) /88 *100;
        prob_male = obj.gender(1) /88 *100;
        obj = [prob_female,prob_male];
        end
        %function to calculate the probabilty

        function plotting(obj,r)
      
        subplot(6,2,1)
        histogram(r(:,4))
        title("Resting blood pressure ")

        subplot(6,2,2)
        histogram(r(:,5))
        title("Serum cholesterol ")
     
        subplot(6,2,3)
        histogram(r(:,8))
        title("Maximum heart rate achieved")

        subplot(6,2,4)
        histogram(r(:,10))
        title("ST depression induced by exercise relative to rest")

        subplot(6,2,5)
        bar(obj.chest_pain_type)
        title("Chest pain type ")
        xticklabels({'typical angina','atypical angina','non-anginal pain','asymptomatic'})


        subplot(6,2,6)
        bar(obj.fbs)
        title("Fasting blood sugar > 120 mg/dl")
        xticklabels({'high','low'})


        subplot(6,2,7)
        bar(obj.ecg)
        title("Resting electrocardiographic results ")
        xticklabels({'normal','ST-T wave abnormality ','left ventricular hypertrophy'})


        subplot(6,2,8)
        bar(obj.exang)
        title("Exercise-induced angina ")
        xticklabels({'yes','no '})


        subplot(6,2,8)
        pie(obj.slope)
        legend('upsloping','flat','downsloping','Location','eastoutside')
        title("slope of the peak exercise ST segment")


        subplot(6,2,9)
        pie(obj.ca)
        legend('0','1','2','3','Location','eastoutside')
        title("Number of major vessels colored by fluoroscopy")


        subplot(6,2,10)
        pie(obj.thal)
        legend('normal','fixed defect','reversable_defect','Location','eastoutside')
        title("Thallium stress test results")

        subplot(6,2,11)
        pie(obj.gender)
        legend('male','female','Location','eastoutside')
        title("gender")
        
        subplot(6,2,12)
        axis =(30:5:60); 
        histogram(r(:,1),axis);
        title("ages")
 
        end
        %funciton to plot the grpahs
        
    end
end



