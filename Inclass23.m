%In this directory, you will find a derivaitve function representing a
%three gene circuit in which each gene product represses the transcription of another
%gene in a cycle. This simple three gene circuit displays oscillations and was one
%of the first synthetic circuits ever constructed (see Elowitz & Leibler
%Nature 2000). 

% 1. Start with initial conditions x(1) = 1, x(2) = x(3) = 0. 
% Run the model for 200 time units and plot the result. verify that it
% does indeed oscillate. 
sol = ode23(@repressilator,[0 200],[1,0,0]);
plot(sol.y(1,:),sol.y(2,:));
hold on;
plot(sol.y(2,:),sol.y(3,:));
hold on;
plot(sol.y(3,:),sol.y(1,:));
hold off;

% 2. What happens if you start with initial conditions x(1) = x(2) = x(3) =
% 0.5? Why?
sol = ode23(@repressilator,[0 200],[0.5,0.5,0.5]);
plot(sol.y(1,:),sol.y(2,:));
hold on;
plot(sol.y(2,:),sol.y(3,:));
hold on;
plot(sol.y(3,:),sol.y(1,:));
hold off;

%When all of the initial conditions become 0.5, the figure becomes a
%straight line. The repressilator in essence is a network that suppresses
%subsequent genes in a negative feedback loop. The oscillations that show 
%in part 1 are due to the development of a limit cycle. In part 2, since
%the values of initial conditions are the same, the network reaches a
%steady state and does not oscillate.

% 3. The strength of the repression is governed by the constant k2 which is
% the same for all the genes. What happens when you make k2 larger or
% smaller? Find the approximate value of k2 for which the system no longer
% oscillates. 
sol = ode23(@repressilator2,[0 200],[1,0,0]);
plot(sol.y(1,:),sol.y(2,:));
hold on;
plot(sol.y(2,:),sol.y(3,:));
hold on;
plot(sol.y(3,:),sol.y(1,:));
hold off;
%The larger the value becomes, the closer to zero the oscillation curves
%move and the center becomes larger. The converse happens when it becomes
%smaller, in that the center becomes much smaller and moves away from zero.
%The smallest value I looked at was at 0.001, where the system nearly no
%longer oscillates and is almost linear. 

% 4. What happens when you make k2 larger or smaller for only one of the
% genes? 
sol = ode23(@repressilator3,[0 200],[1,0,0]);
plot(sol.y(1,:),sol.y(2,:));
hold on;
plot(sol.y(2,:),sol.y(3,:));
hold on;
plot(sol.y(3,:),sol.y(1,:));
hold off;

%Changing one of the k2 values makes the oscillation curves fall out of
%alignment, per the plot, and they do not converge at any one point.