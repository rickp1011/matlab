clear;
clc;
clevelandunhealthy = heartattack;
cleevelandhealthy = healthy;
[clevelandunhealthy.heart_attack,cleevelandhealthy.ok] = clevelandunhealthy.positive();
% sorting into heart attack and healthy

[clevelandunhealthy.chest_pain_type,clevelandunhealthy.ca]=clevelandunhealthy.fourvariables(clevelandunhealthy.heart_attack);
[clevelandunhealthy.ecg,clevelandunhealthy.slope,clevelandunhealthy.thal]=clevelandunhealthy.threevariables(clevelandunhealthy.heart_attack);
[clevelandunhealthy.fbs,clevelandunhealthy.exang,clevelandunhealthy.gender]=clevelandunhealthy.twovariables(clevelandunhealthy.heart_attack);
[clevelandunhealthy.average,clevelandunhealthy.stand] = clevelandunhealthy.calculation_stats(clevelandunhealthy.heart_attack);
 


[cleevelandhealthy.chest_pain_type,cleevelandhealthy.ca]=cleevelandhealthy.fourvariables(cleevelandhealthy.ok);
[cleevelandhealthy.ecg,cleevelandhealthy.slope,cleevelandhealthy.thal]=cleevelandhealthy.threevariables(cleevelandhealthy.ok);
[cleevelandhealthy.fbs,cleevelandhealthy.exang,cleevelandhealthy.gender]=cleevelandhealthy.twovariables(cleevelandhealthy.ok);
[clevelandunhealthy.average,clevelandunhealthy.stand]= clevelandunhealthy.calculation_stats(clevelandunhealthy.heart_attack);
[cleevelandhealthy.average,cleevelandhealthy.stand] = cleevelandhealthy.calculation_stats(cleevelandhealthy.ok);


figure(1);
clevelandunhealthy.plotting(clevelandunhealthy.heart_attack);
%plotttinf of graphs

figure(2);
cleevelandhealthy.plotting(cleevelandhealthy.ok);
%plotttinf of graphs

clevelandunhealthy.prob =clevelandunhealthy.probablity();
cleevelandhealthy.prob = cleevelandhealthy.probablity();