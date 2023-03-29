#Code for Experiment 1
#I19PH004 Keith Kamson Fernandes
#Optical Properties

#empty matrices
values = []

#read csv file
datasheet = dlmread('Optical.csv')

#read specific values from the sheet
Ei = datasheet(2:101,5)
Er = datasheet(2:101,10)
Energy = datasheet(2:101, 1)

#calculations
Ew = sqrt((Ei.*Ei)+(Er.*Er));
n = sqrt((Ew+Er)/2);
k = sqrt((Ew-Er)/2);
Lw = Ei./Ew.^2;
R = ((n-1).^2+k.^2)./((n+1).^2+k.^2);
A = sqrt(2)*sqrt(Ew-Er)

#Plots for energy vs Ew, n, k
subplot(3,1,1)
plot(Energy,Ew)
xlim([0 20])
xlabel('E')
ylabel('Ew')
title("Energy(E) v/s Epsilon(Ew)")

subplot(3,1,2)
plot(Energy,n)
xlim([0 20])
xlabel('E')
ylabel('n')
title("Energy(E) v/s Refractive Index(n)")

subplot(3,1,3)
plot(Energy,k)
xlim([0 20])
xlabel('E')
ylabel('k')
title("Energy(E) v/s Extension(k)")

print optical_fig01.jpg

#Plots for energy vs Lw, R, A
figure(2)
subplot(3,1,1)
plot(Energy,Lw)
xlim([0 20])
xlabel('E')
ylabel('Lw')
title("Energy(E) v/s EELS(Lw)")

subplot(3,1,2)
plot(Energy,R)
xlim([0 20])
yticks(0:0.2:1)
xlabel('E')
ylabel('R')
title("Energy(E) v/s Reflectivity(R)")

subplot(3,1,3)
plot(Energy,A)
xlim([0 20])
xlabel('E')
ylabel('A')
title("Energy(E) v/s Absorption(A)")

print optical_fig02.jpg

#write values in an excel sheet
data = [Energy, Ew, n, k, Lw, R, A];
dlmwrite('optical_new.csv', data)