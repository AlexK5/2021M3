function [total] = monteCarlo(age,time,day, income)
hours = [12.00, 7.60, 11.35, 23.80, 40.02, 50.60; 2.72, 4.18, 3.63, 1.73, 0.47, 0.17; 7.72, 4.52, 6.95, 6.87, 4.95, 3.20; 2.68, 7.00, 3.97, 4.77, 5.03, 3.17; 1.28, 2.57, 1.73, 1.28, 1.07, 0.50; 10.15, 33.25, 29.48, 30.12, 25.23, 19.12; 4.08, 5.95, 3.03, 2.28, 1.38, 0.97; 1.40, 8.28, 1.62, 0.85, 0.60, 0.42; 6.76, 4.08, 5.07, 7.13, 7.27, 7.97; 3.15, 1.40, 0.98, 1.07, 0.85, 0.65; 0.70, 0.70, 0.20, 0.22, 0.17, 0.10];
%each list item corresponds to an activity on D4, each item within a list
%item corresponds to an age group

min = [3, 1, 1, 1, 5, 1, 5, 0.5, 1, 5, 0.5];
max = [4, 3, 1, 1, 8, 1, 8, 0.5, 1, 8, 0.5];
%each item corresponds to a D4 activity

%0 is after work only, 1 is any time while awake

total = 0;
fourk = 0;
hd = 0;
multiplier = 1;

if(income == 4)
    type = rand;
    if(type < 0.17)
        income = 0;
    elseif(type < 0.42)
        income = 1;
    elseif(type < 0.63)
        income = 2;
    else
        income = 3;
    end
end

if(income == 0)
    multiplier = 1.323;
    if(rand < 2/17)
        hd = 1;
    else
        hd = 0;
    end    
    fourk = 0;
elseif(income == 1)
    multiplier = 1.120;
    hd = 1;
    fourk = 0;
elseif(income == 2)
    multiplier = 0.969;
    hd = 1;
    fourk = 0;
elseif(income == 3)
    multiplier = 0.788;
    hd = 1;
    if(rand < 31/37)
        fourk = 1;
    else
        fourk = 0;
    end   
end    
    
for i = (1:6)
    hours(6,i) = hours(6,i) - hours(7,i) - hours(8,i);
    hours(9,i) = hours(9,i) - hours(10,i) - hours(11,i);
end
    
for  i = (1:11)
   if(time > 9/24 && time < 17/24 && day < 5)
       if(rand < hours(i,age) .* multiplier / 112 && i > 3)
               total = total + rand * (max(i)-min(i)) + min(i);
       end
   elseif((time > 8/24 && time < 9/24) || (time > 17/24) || day > 4)
       if(i < 4)
           if(rand < hours(i,age) .* multiplier / 72)
               if(i == 1)
                   type = rand;
                   if(fourk == 1)
                        total = total + 25;
                   elseif(hd == 1)
                       total = total + rand * 3 + 5;
                   else
                       total = total + rand + 3;
                   end
               end     
           else  
               total = total + rand * (max(i)-min(i)) + min(i);
           end    
       else
           if(rand < hours(i,age) .* multiplier / 112)
               total = total + rand * (max(i)-min(i)) + min(i);
           end
       end
   end
end
end

