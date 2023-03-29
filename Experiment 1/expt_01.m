#Code for Experiment 1
#I19PH004 Keith Kamson Fernandes
#Simple Harmonic Motion

#intial values
#A=1, w=1, p=2, m=1
A = input("Enter the Amplitude = ");
w = input("Enter the Omega = ");
p = input("Enter the Pi = ");
m = input("Enter the Mass = ");

#calculating the proportionality constant k
k = m*w*w;

#creating empty matrices
x = []
v = []
a = []
t = []
ke = []
pe = []
te = []

#looping the equations to iterate from 1-100
for i=1:100,
  t(i) = i;
  x(i) = A*sin(w*t(i) + p);
  v(i) = A*w*cos(w*t(i) + p);
  a(i) = -A*w*w*sin(w*t(i) + p);
  ke(i) = 0.5*m*v(i)*v(i);
  pe(i) = 0.5*k*x(i)*x(i);
  te(i) = ke(i) + pe(i);
end;

#plots for x,v,a vs time
figure(1)
subplot(3,1,1)
plot(t,x)
xlabel('t')
ylabel('x')
title("Position(x) v/s Time(t)")

subplot(3,1,2)
plot(t,v)
xlabel('t')
ylabel('v')
title("Velocity(v) v/s Time(t)")

subplot(3,1,3)
plot(t,a)
xlabel('t')
ylabel('a')
title("Acceleration(a) v/s Time(t)")

print fig_i_4.jpg

#Plots for energy vs time 
figure(2)
subplot(3,1,1)
plot(t,ke)
xlabel('t')
ylabel('ke')
title("Kinetic Energy(ke) v/s Time(t)")

subplot(3,1,2)
plot(t,pe)
xlabel('t')
ylabel('pe')
title("Potential Energy(pe) v/s Time(t)")

subplot(3,1,3)
plot(t,te)
xlabel('t')
ylabel('te')
title("Total Energy(te) v/s Time(t)")

print fig_f_4.jpg

#to print values in an excel sheet
data = [t; x; v; a]';
dlmwrite('data_3.xlsx', data)