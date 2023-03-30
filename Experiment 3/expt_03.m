#Code for Experiment 3
#I19PH004 Keith Kamson Fernandes
#Power Factor and Thermoelectric Properties

data300 = dlmread('300.csv');
data600 = dlmread('600.csv');
data900 = dlmread('900.csv');
data1200 = dlmread('1200.csv');

#energy
Energy = data300(2:702,1);
Ev = Energy.*13.606 ;

#temperature
T_300 = 300;
T_600 = 600;
T_900 = 900;
T_1200 = 1200;

#Seeback Coeff
S_300= data300(2:702,5);
S_600 = data600(2:702,5);
S_900 = data900(2:702,5);
S_1200 = data1200(2:702,5);

#Electrical Condutivity
sigma_300 = data300(2:702,6);
sigma_600 = data600(2:702,6);
sigma_900 = data900(2:702,6);
sigma_1200 = data1200(2:702,6);

#Thermal Condutivity
K_300 = data300(2:702,8);
K_600 = data600(2:702,8);
K_900 = data900(2:702,8);
K_1200 = data1200(2:702,8);

#zT
zT_300 = ((S_300.^2).* sigma_300.*T_300)./K_300 ;
zT_600 = ((S_600.^2).* sigma_600.*T_600)./K_600 ;
zT_900 = ((S_900.^2).* sigma_900.*T_900)./K_900 ;
zT_1200 = ((S_1200.^2).* sigma_1200.*T_1200)./K_1200;

#Power Factor (pf)
pf_300 = (S_300.^2).*(sigma_300);
pf_600 = (S_600.^2).*(sigma_600);
pf_900 = (S_900.^2).*(sigma_900);
pf_1200 = (S_1200.^2).*(sigma_1200);

#output file
output=[Ev,S_300,S_600,S_900,S_1200,sigma_300,sigma_600,sigma_900,sigma_1200,K_300,K_600,K_900,K_1200,zT_300,zT_600,zT_900,zT_1200,pf_300,pf_600,pf_900,pf_1200]
dlmwrite('out.csv', output)

#plots for energy vs S,pf,zT,K,sigma
fig = figure(1);
subplot(2,3,1)
plot(Ev,S_300,Ev,S_600,Ev,S_900,Ev,S_1200)
xlim([-1,1])
xlabel("Energy(eV)")
ylabel("Seeback Coeff.(V/K)")
title("Energy(eV) Vs Seeback Coeff.(V/K)")
legend('300K','600K','900K','1200K')

subplot(2,3,2)
plot(Ev,zT_300,Ev,zT_600,Ev,zT_900,Ev,zT_1200)
xlim([-1,1])
xlabel("Energy(eV)")
ylabel("zT")
title("Energy(eV) Vs zT")
legend('300K','600K','900K','1200K')

subplot(2,3,3)
plot(Ev,pf_300,Ev,pf_600,Ev,pf_900,Ev,pf_1200)
xlim([-1,1])
xlabel("Energy(eV)")
ylabel("Power Factor (pf)")
title("Energy(eV) Vs Power Factor (pf)")
legend('300K','600K','900K','1200K')

subplot(2,3,4)
plot(Ev,K_300,Ev,K_600,Ev,K_900,Ev,K_1200)
xlim([-1,1])
ylim([0 8e+15])
xlabel("Energy(eV)")
ylabel("Thermal Condutivity (W/m K)")
title("Energy(eV) Vs Thermal Condutivity (W/m K)")
legend('300K','600K','900K','1200K')

subplot(2,3,6)
plot(Ev,sigma_300,Ev,sigma_600,Ev,sigma_900,Ev,sigma_1200)
xlim([-1,1])
ylim([0 3e+20])
xlabel("Energy(eV)")
ylabel("Electrical Condutivity (1/ohm m)")
title("Energy(eV) Vs Electrical Condutivity (1/ohm m)")
legend('300K','600K','900K','1200K')

set(fig, 'PaperUnits', 'inches')
set(fig, 'Papersize', [12,20])
set(fig, 'PaperPosition', [0,0,20,12])

print EXP_3.png

#part2
new2 = csvread('1.csv');
output2 = new2(2:4:2805,:);
dlmwrite('O2.csv',output2);
