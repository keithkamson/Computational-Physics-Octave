#Experiment 7
#I19PH004 Keith Kamson Fernandes
#Random Walk

#steps
N = 100;

#co-ordinate axes
x = [];
y = [];

#intial points
x(1) = 1;
y(1) = 1;

#length of step
r =1;

for i=2:N,
  s = rand();
  x(i) = x(i-1) + r*sin(2*3.14*s);
  y(i) = y(i-1) + r*cos(2*3.14*s);
endfor

#Difference between 2 points/walks
step = ((x(end)-x(1))^2 + (y(end)-y(1))^2)^0.5;

printf ("\n \n Step Size = %d",step)

#Plot of Random Walk
plot(x,y);
title(["Total displacement after ", num2str(N), " steps is ",
num2str(step)]);
axis("square");

print fig.jpg