clear;
clc;

heartattacko = Health;
healthyo = Health;
%creating object for individuals with heart attack and healthy

[heartattacko.real,healthyo.real]= positive();

 [heartattacko.chest_pain_type,heartattacko.ca]=heartattacko.fourvariables();
 [heartattacko.ecg,heartattacko.slope,heartattacko.thal]=heartattacko.threevariables();
 [heartattacko.fbs,heartattacko.exang,heartattacko.gender]=heartattacko.twovariables();
%counting of all the variables for heart attack 

 [healthyo.chest_pain_type,healthyo.ca]=healthyo.fourvariables();
 [healthyo.ecg,healthyo.slope,healthyo.thal]=healthyo.threevariables();
 [healthyo.fbs,healthyo.exang,healthyo.gender]=healthyo.twovariables();
%counting of all the variables for heart attack 

[heartattacko.average,heartattacko.stand]= heartattacko.calculation_stats();
[healthyo.average,healthyo.stand] = healthyo.calculation_stats();
%calcualting the standard deviation and mean for both healthy and heart
%attack for all columns , this are stored in an array for us to analyse

figure(1);
heartattacko.plotting();
%plotttinf of graphs

figure(2);
healthyo.plotting();
%plotttinf of graphs

heartattacko.prob =heartattacko.probablity();
healthyo.prob = healthyo.probablity();

function [z,q] = positive()
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