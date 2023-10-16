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

prob_female = (gender(2)/T) *100;
prob_male = (gender(1) /T) *100;

function z = fourvariable(x,a,col,h,j,k,l)
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

function plotting(x,a,b,c,d,e,f,g,h)
    subplot(6,2,1)
    histogram(x(:,4))
    title("Resting blood pressure ")

    subplot(6,2,2)
    histogram(x(:,5))
    title("Serum cholesterol ")
     
    subplot(6,2,3)
    histogram(x(:,8))
    title("Maximum heart rate achieved")

    subplot(6,2,4)
    histogram(x(:,10))
    title("ST depression induced by exercise relative to rest")

    subplot(6,2,5)
    bar(a)
    title("Chest pain type ")
    xticklabels({'typical angina','atypical angina','non-anginal pain','asymptomatic'})


    subplot(6,2,6)
    bar(b)
    title("Fasting blood sugar > 120 mg/dl")
    xticklabels({'high','low'})


    subplot(6,2,7)
    bar(c)
    title("Resting electrocardiographic results ")
    xticklabels({'normal','ST-T wave abnormality ','left ventricular hypertrophy'})


    subplot(6,2,8)
    bar(d)
    title("Exercise-induced angina ")
    xticklabels({'yes','no '})


    subplot(6,2,8)
    pie(e)
    legend('upsloping','flat','downsloping','Location','eastoutside')
    title("slope of the peak exercise ST segment")


    subplot(6,2,9)
    pie(f)
    legend('0','1','2','3','Location','eastoutside')
    title("Number of major vessels colored by fluoroscopy")


    subplot(6,2,10)
    pie(g)
    legend('normal','fixed defect','reversable_defect','Location','eastoutside')
    title("Thallium stress test results")

    subplot(6,2,11)
    pie(h)
    legend('male','female','Location','eastoutside')
    title("gender")

    subplot(6,2,12)
    axis =(30:5:60); 
    histogram(x(:,1),axis);
end



function [m,n] = calculationstdev_mean(x)
    m = mean(x);
    n = std(x);
end

function [z,q,T] = positive()
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
    T = length(T);
end



