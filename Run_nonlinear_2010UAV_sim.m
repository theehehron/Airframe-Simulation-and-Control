clear; close all; clc;

% ------ initial position -------
lat0 = deg2rad(63.9963);
long0 = deg2rad(-22.6237);
alt0 = 500;


windseed = [randi([0 4000], 1, 4)];

load("UAV_2010_Trim_point_SteadyState_35");
X_trim_point = op_trim1.States.x;

u = [op_trim1.Inputs(1).u
     op_trim1.Inputs(2).u
     op_trim1.Inputs(3).u
     op_trim1.Inputs(4).u];

t_end = 100;
t = (0:0.5:t_end).'; % simulation time

% set very small components to zero
u(abs(u)<1e-18) = 0; 
X_trim_point(abs(X_trim_point)<1e-18) = 0;

u_sim = zeros(length(t), 4); % initialize u
% set all values of u to trimmed settings
for i = 1:length(t) 
    u_sim(i, 1:4) = u;
end

u_sim(1:5, 1) = 0.1;

X_init = X_trim_point;
tu = [t, u_sim];% create time and input for simulation

%-------------- Setup Phugiod Response Input ------------------
T_inv = [1 0 0 0 0 0 0 0 0
         0 0 1 0 0 0 0 0 0
         0 0 0 0 1 0 0 0 0
         0 0 0 0 0 0 0 1 0
         0 1 0 0 0 0 0 0 0
         0 0 0 1 0 0 0 0 0
         0 0 0 0 0 1 0 0 0
         0 0 0 0 0 0 1 0 0
         0 0 0 0 0 0 0 0 1];

T = inv(T_inv);

%% --------------- Run the simulation and extract data ---------------
simdata = sim("UAV_2010_simulink_model_run.slx"); % run simulation

%% --------------- Plot data from simulation output ------------------
sim_states = simdata.simout.signals.values(:, 1:9);
sim_position = simdata.simout.signals.values(:, 10:12);
sim_geodeticPosition = simdata.simout.signals.values(:, 13:15);
sim_time = simdata.simout.time;

plot_airframe_states(sim_time, sim_states)

%-------- Plot Position North-East-Down ---------
figure;
subplot(3, 1, 1)
plot(sim_time, sim_position(:, 1));
xlabel("time (s)")
ylabel("position north (m)")

subplot(3, 1, 2)
plot(sim_time, sim_position(:, 2));
xlabel("time (s)")
ylabel("position east (m)")

subplot(3, 1, 3)
plot(sim_time, sim_position(:, 3));
xlabel("time (s)")
ylabel("MAMSL")

%--------- PLot Geodetic Coordinates --------------
figure;
subplot(3, 1, 1)
plot(sim_time, sim_geodeticPosition(:, 1));
xlabel("time (s)")
ylabel("Latitude (deg)")

subplot(3, 1, 2)
plot(sim_time, sim_geodeticPosition(:, 2));
xlabel("time (s)")
ylabel("Longitude (deg)")

subplot(3, 1, 3)
plot(sim_time, sim_geodeticPosition(:, 3));
xlabel("time (s)")
ylabel("MAMSL")


% simTime = simdata.simU.Time; % extract time from simulation data
% my_simX = simdata.simX.Data; % extract state from simulation data
% figure();
% plot_RCAM_states(simTime, my_simX, ylims)
% sgtitle('Nonlinear RCAM Short Period Mode Time Response')


