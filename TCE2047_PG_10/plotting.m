function plotting(x,a,b,c,d,e,f,g,h)
% function is to plot all the columns in a subplot
% so that we can view all at once and compare between heart disease and
% healthy subplot of 7 roles 2 columns are used to plot the graphs for all
% thirteen column all this graphs are later used in our analysis for the
% question c where we want to find what is difference between healthy and
% heart attack
    subplot(7,2,1)
    histogram(x(:,4))
    title("Resting blood pressure ")

    subplot(7,2,2)
    histogram(x(:,5))
    title("Serum cholesterol ")
     
    subplot(7,2,3)
    histogram(x(:,8))
    title("Maximum heart rate achieved")

    subplot(7,2,4)
    histogram(x(:,10))
    title("ST depression induced by exercise relative to rest")

    subplot(7,2,5)
    bar(a)
    title("Chest pain type ")
    xticklabels({'typical angina','atypical angina','non-anginal pain','asymptomatic'})


    subplot(7,2,6)
    bar(b)
    title("Fasting blood sugar > 120 mg/dl")
    xticklabels({'high','low'})


    subplot(7,2,7)
    bar(c)
    title("Resting electrocardiographic results ")
    xticklabels({'normal','ST-T wave abnormality ','left ventricular hypertrophy'})


    subplot(7,2,8)
    bar(d)
    title("Exercise-induced angina ")
    xticklabels({'yes','no '})


    subplot(7,2,9)
    pie(e)
    legend('upsloping','flat','downsloping','Location','eastoutside')
    title("slope of the peak exercise ST segment")


    subplot(7,2,10)
    pie(f)
    legend('0','1','2','3','Location','eastoutside')
    title("Number of major vessels colored by fluoroscopy")


    subplot(7,2,11)
    pie(g)
    legend('normal','fixed defect','reversable_defect','Location','eastoutside')
    title("Thallium stress test results")

    subplot(7,2,12)
    pie(h)
    legend('male','female','Location','eastoutside')
    title("gender")

    subplot(7,2,13)
    axis =(30:5:60); 
    histogram(x(:,1),axis);
    title("age")
end