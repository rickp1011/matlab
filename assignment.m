clear;
clc;

%heart attack
gender = [0,0];
chest_pain_type = [0,0,0,0];
fbs = [0,0];
ecg = [0,0,0];
exang = [0,0];
slope = [0,0,0];
ca = [0,0,0,0];
thal = [0,0,0];

%healthy
gender_h = [0,0];
chest_pain_type_h = [0,0,0,0];
fbs_h = [0,0];
ecg_h = [0,0,0];
exang_h = [0,0];
slope_h = [0,0,0];
ca_h = [0,0,0,0];
thal_h = [0,0,0];

[heart_attack,healthy,T]=positive();

chest_pain_type =fourvariable(heart_attack,chest_pain_type,3,1,2,3,4);
fbs = twovaraible(heart_attack,fbs,6,1,0);
ecg= threevaraible(heart_attack,ecg,7,0,1,2);
exang = twovaraible(heart_attack,exang,9,1,0);
slope =  threevaraible(heart_attack,slope,11,1,2,3);
ca=fourvariable(heart_attack,ca,12,0,1,2,3);
thal= threevaraible(heart_attack,thal,13,3,6,7);
gender = twovaraible(heart_attack,gender,2,1,0);

chest_pain_type_h=fourvariable(healthy,chest_pain_type_h,3,1,2,3,4);
fbs_h = twovaraible(healthy,fbs_h,6,1,0);
ecg_h=threevaraible(healthy,ecg_h,7,0,1,2);
exang_h = twovaraible(healthy,exang_h,9,1,0);
slope_h =  threevaraible(healthy,slope_h,11,1,2,3);
ca_h=fourvariable(healthy,ca_h,12,0,1,2,3);
thal_h=threevaraible(healthy,thal_h,13,3,6,7);
gender_h = twovaraible(healthy,gender_h,2,1,0);

[avg,sdv] = calculationstdev_mean(heart_attack(:,1));
[avg_h,sdv_h] = calculationstdev_mean(healthy(:,1));

figure(1)
plotting(heart_attack,chest_pain_type,fbs,ecg,exang,slope,ca,thal,gender);

figure(2)
plotting(healthy,chest_pain_type_h,fbs_h,ecg_h,exang_h,slope_h,ca_h,thal_h,gender_h);

prob_heartattack = probablity(gender,T);
prob_healthy = probablity(gender_h,T);










