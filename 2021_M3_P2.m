age = 6
vals = []
len = 0
income = 2

for time = (0:0.01:1)
    for day = (0:6);
       len = len + 1;
       %couple with child
       %vals(len) = monteCarlo(3,time,day,2) + monteCarlo(3,time,day,2) + monteCarlo(1,time,day,2);
       
       %retired woman
       %vals(len) = monteCarlo(6,time,day,2);
       %if(rand < 2/7)
       %    vals(len) = vals(len) + monteCarlo(2,time,day,2) + monteCarlo(2,time,day,2);
       %end 
       
       %college students
       %vals(len) = monteCarlo(3,time,day,3) + monteCarlo(3,time,day,3) + monteCarlo(3,time,day,3);
       
       %Region C bandwidth calculation
       %vals(len) = 0;
       %for i = (1:9505);
       %    age = rand;
       %    income = rand;
       %    if(age < 0.10256)
       %        age = 1;
       %    elseif(age < 0.16276)
       %        age = 2;
       %    elseif(age <  0.5052)
       %        age = 3;
       %    elseif(age < 0.7183)  
       %        age = 4;
       %    elseif(age < 0.8797)
       %        age = 5;
       %    else
       %        age = 6;
       %    end
       %    if(income < 0.098)
       %        income = 0;
       %    else
       %        income = 3;
       %    end    
       %    vals(len) = vals(len) + monteCarlo(age,time,day,income);    
       %end
       %vals(len) = vals(len) * 0.027;
    end
end    


vals = sort(vals);


vals(round(len*0.9))
vals(round(len*0.99))
