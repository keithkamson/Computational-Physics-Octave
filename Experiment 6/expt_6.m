#Experiment 6
#I19PH004 Keith Kamson Fernandes
#Pi Calculation using Monte Carlo

#Read csv file of random nos from last expt.
rnd = dlmread("rnd.csv");

lcg = rnd(1:10001,1);
msg = rnd(1:10001,2);
oct = rnd(1:10001,3);
N = size(lcg);


#LCG
count1 = 0;
for i=1:N(1),
  if (((lcg(i))^2 + (rand())^2)^0.5 < 1)
    count1 = count1+1;
  endif
endfor

prob1 = count1/N(1);
pi1 = 4*prob1;

#MID-SQUARE METHO
count2 = 0;
for i=1:N(1),
  if (((msg(i))^2 + (rand())^2)^0.5 < 1)
    count2 = count2+1;
  endif
endfor

prob2 = count2/N(1);
pi2 = 4*prob2;

#OCTAVE RAND() METHOD
count3 = 0;
for i=1:N(1),
  if (((oct(i))^2 + (rand())^2)^0.5 < 1)
    count3 = count3+1;
  endif
endfor

prob3 = count3/N(1);
pi3 = 4*prob3;

#Pi Values
pi1
pi2
pi3

%Error Calculation
error1 = ((pi1/3.1415)*100)-100;
error2 = ((pi2/3.1415)*100)-100;
error3 = ((pi3/3.1415)*100)-100;

printf("\n")

error1
error2
error3
printf("\n")

#LCG METHOD
printf ("a. LCG METHOD \n Pi Value Calculated using LCG Method = %d \n Error(LCG Method) = %d%%",pi1,error1)
printf("\n")
printf("\n")

#MID-SQUARE METHOD
printf ("b. MID-SQUARE METHOD \n Pi Value Calculated using Mid-Square Method = %d \n Error(Mid-Square Method) = %d%%",pi2,error2)
printf("\n")
printf("\n")

#OCTAVE RAND() METHOD
printf ("c. OCTAVE \n Pi Value Calculated using Octave Rand() = %d \n Error(Octave Rand()) = %d%%",pi3,error3)