clear;
clc;

heart_attacko = Health;
healthyo = Health;
%creating object for individuals with heart attack and healthy

[heart_attacko.real,healthyo.real]=positive();

heart_attacko.gender = heart_attacko.gendercount();
heart_attacko.chest_pain_type=heart_attacko.chestpain();
heart_attacko.ca = heart_attacko.cacount();
heart_attacko.ecg= heart_attacko.ecgcount();
heart_attacko.fbs = heart_attacko.fbscount();
heart_attacko.exang = heart_attacko.exangcount();
heart_attacko.slope =  heart_attacko.slopecount();
heart_attacko.ca= heart_attacko.cacount();
heart_attacko.thal= heart_attacko.thalcount();
%counting of all the variables for heart attack 

healthyo.gender = healthyo.gendercount();
healthyo.chest_pain_type=healthyo.chestpain();
healthyo.ca = healthyo.cacount();
healthyo.ecg= healthyo.ecgcount();
healthyo.fbs = healthyo.fbscount();
healthyo.exang = healthyo.exangcount();
healthyo.slope =  healthyo.slopecount();
healthyo.ca= healthyo.cacount();
healthyo.thal= healthyo.thalcount();
%counting of all the variables for heart attack 

heart_attacko.stand= heart_attacko.calculationstdev();
heart_attacko.average= heart_attacko.calculationmean();
healthyo.stand=healthyo.calculationstdev();
healthyo.average = healthyo.calculationmean();
%calcualting the standard deviation and mean for both healthy and heart
%attack for all columns , this are stored in an array for us to analyse

figure(1);
heart_attacko.plotting();
%plotttinf of graphs

figure(2);
healthyo.plotting();
%plotttinf of graphs

heart_attacko.prob =heart_attacko.probablity();
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
