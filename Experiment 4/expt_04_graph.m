#Roshan
#Tinku
#Ashish

clear all
close all
clc
function [dtheta_dt] =second_orderODE_pendulum(t,theta,b,g,l,m)

#angle made by the pendulum with the axis
theta1 = theta(1);
theta2 = theta(2);

#simplified ODE
dtheta1_dt = theta2;
dtheta2_dt = -(b/m)*theta2-(g/l)*sin(theta1);

#solution matrix containing both the ODE
dtheta_dt = [dtheta1_dt;dtheta2_dt];
end

#Input parameters
b = 0.05;
g = 9.81;
l = 1;
m = 1;
ct = 1;

#Initial conditions
theta_0 = [0;3];

#time length
t_span =  linspace(0,10,500);

#ODE for pendulum
[t,results] = ode45(@(t,theta) second_orderODE_pendulum(t,theta,b,g,l,m), t_span ,theta_0);

#plotting
figure (1)
hold on
plot (t,results (:,1))
plot (t,results (:,2))
xlabel ('time')
ylabel ('velocity')

print EXP_4.png

grid on

#creating animation for the pendulum
theta2 = results(:,1);
for i = 1:length(theta2)
    theta_x = theta2(i);

    x0 = 0;
    y0 = 0;

    x1 = l*sin(theta_x);
    y1 = -l*cos(theta_x);

    #ploting the pendulum
    figure(2)
    plot([-1 1],[0 0],'color','g','linewidth',6);
    hold on
    plot([x0 x1],[y0 y1],'color','b','linewidth',3);
    hold on
    plot (x1,y1,'o','markers',15,'markerfacecolor','r');
    hold off
    grid on
    axis([-1.5 1.5 -1.5 0.5]);
    pause (0.002);
    M(ct) = getframe(gcf);
    ct = ct+1;
end
movie (M)
videofile = VideoWriter('pendulum_animation.avi','Uncompressed avi');
open(videofile);
writeVideo(videofile,M)
close(videofile)
