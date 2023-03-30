#Code for Experiment 4
#I19PH004 Keith Kamson Fernandes
#Simple Pendulum Simulation

theta = pi/4
thetd = 0
l = 1
dt = 0.01

for i=[0:1:10000],
    thetdd = -9.8*sin(theta)/l;
    thetd = thetd+thetdd*dt;
    theta = theta+thetd*dt;
    plot(l*sin(theta), l*(1-cos(theta)), 'ko', "markersize", 10,[0,l*sin(theta)], [1, l*(1-cos(theta))], "linewidth", 1.5);
    axis("square");
    xlim([-l-0.1, l+0.1]);
    ylim([0-0.1,2*l+0.1]);
    hold on;
    pause(dt);
    clf;
end
