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