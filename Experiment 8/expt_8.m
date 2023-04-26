#Experiment 8
#I19PH004 Keith Kamson Fernandes
#Random Decay

thresh = 0.13;
parent = [100];
daughter = [0];
t = [0];

for dummy=1:10000;
  if parent(end)>0,
    count=0;
    for i=1:parent(end),
      if rand()<thresh,
        count=count+1;
      endif
    endfor
    daughter=[daughter, daughter(end) + count];
    parent=[parent, parent(end) - count];
    t=[t,t(end)+1];
  endif
endfor

#radioactive constant
lambda = (parent(1)-parent(2))/parent(1);

#mean life/average life
mean_life = 1/lambda;

#half life
t_half = 0.693/lambda;

#printing the values
lambda
mean_life
t_half

printf ("\n Radioactive Constant = %d",lambda)
printf ("\n Average Life/Mean Life = %d",mean_life)
printf ("\n Half Life = %d",t_half)

#Plot of Random Decay
plot(t, parent, "r", t, daughter, "b")
title("Random Decay")
legend("Parent Nuclei","Daughter Nuclei")

print fig.jpg