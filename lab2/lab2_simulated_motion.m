%%% Kritik Kaushal
%%% MTE 546 Lab 2
%%% Extended Kalman Filter
%%%%%%%%%%%%%%%% simulating motion of block
%%
clc; clear; close all;
% simulate for 10 seconds
time_step = 0.0217;
time_scale = 0:time_step:10;

random_motion_w_noise = zeros(size(time_scale));
random_motion_truth = zeros(size(time_scale));

point_a_b_const_vel_w_noise = zeros(size(time_scale));
point_a_b_const_vel_truth = zeros(size(time_scale));

point_a_b_vary_vel_w_noise = zeros(size(time_scale));
point_a_b_vary_vel_truth = zeros(size(time_scale));

no_motion_w_noise = zeros(size(time_scale));
no_motion_truth = zeros(size(time_scale));

% noise parameters
noise_amplitude = 0.3;
noise_amplitude2 = 100;

%%% RANDOM MOTION SIMULATION
% generate a piecewise simulation of motion
% plot is: time against distance (cm)
for i = 1:length(time_scale)
    % generate random noise for this iteration
    noise = noise_amplitude * randn;
    
    if time_scale(i) >= 0 && time_scale(i) <= 3
        random_motion_w_noise(i) = -2*time_scale(i)^2+29 + noise;
        random_motion_truth(i) = -2*time_scale(i)^2+29;
    elseif time_scale(i) > 3 && time_scale(i) <= 5
        random_motion_w_noise(i) = 0.3*time_scale(i)^2+8 + noise;
        random_motion_truth(i) = 0.3*time_scale(i)^2+8;
    elseif time_scale(i) > 5 && time_scale(i) <= 8
        random_motion_w_noise(i) = time_scale(i)+10.5 + noise;
        random_motion_truth(i) = time_scale(i)+10.5;
    elseif time_scale(i) > 8 && time_scale(i) <= 10
        random_motion_w_noise(i) = -0.25*time_scale(i)^2 + 34.5 + noise;
        random_motion_truth(i) = -0.25*time_scale(i)^2 + 34.5;
    end
end

%%% CONSTANT VELOCITY SIMULATION, 29cm to 10cm away from sensor
% generate a piecewise simulation of motion
% plot is: time against distance (cm)
for i = 1:length(time_scale)
    % generate random noise for this iteration
    noise = noise_amplitude * randn;
    
    if time_scale(i) >= 0 && time_scale(i) <= 1
        point_a_b_const_vel_w_noise(i) = 29 + noise;
        point_a_b_const_vel_truth(i) = 29;
    elseif time_scale(i) > 1 && time_scale(i) <= 8
        point_a_b_const_vel_w_noise(i) = -2.7*time_scale(i)+31.5 + noise;
        point_a_b_const_vel_truth(i) = -2.7*time_scale(i)+31.5;
    elseif time_scale(i) > 8 && time_scale(i) <= 10
        point_a_b_const_vel_w_noise(i) = 10 + noise;
        point_a_b_const_vel_truth(i) = 10;
    end
end

%%% VARYING VELOCITY SIMULATION, 29cm to 4cm away from sensor
% generate a piecewise simulation of motion
% plot is: time against distance (cm)
for i = 1:length(time_scale)
    % generate random noise for this iteration
    noise = noise_amplitude * randn;
    
    if time_scale(i) >= 0 && time_scale(i) <= 1
        point_a_b_vary_vel_w_noise(i) = 29 + noise;
        point_a_b_vary_vel_truth(i) = 29;
    elseif time_scale(i) > 1 && time_scale(i) <= 2
        point_a_b_vary_vel_w_noise(i) = -1.7*time_scale(i)+30.7 + noise;
        point_a_b_vary_vel_truth(i) = -1.7*time_scale(i)+30.7;
    elseif time_scale(i) > 2 && time_scale(i) <= 3
        point_a_b_vary_vel_w_noise(i) = -3.5*time_scale(i)+34.5 + noise;
        point_a_b_vary_vel_truth(i) = -3.5*time_scale(i)+34.5;
    elseif time_scale(i) > 3 && time_scale(i) <= 4
        point_a_b_vary_vel_w_noise(i) = -0.5*time_scale(i)+25.5 + noise;
        point_a_b_vary_vel_truth(i) = -0.5*time_scale(i)+25.5;
    elseif time_scale(i) > 4 && time_scale(i) <= 5
        point_a_b_vary_vel_w_noise(i) = -12*time_scale(i)+71.5+ noise;
        point_a_b_vary_vel_truth(i) = -12*time_scale(i)+71.5;
    elseif time_scale(i) > 5 && time_scale(i) <= 6
        point_a_b_vary_vel_w_noise(i) = -8*time_scale(i)+52+ noise;
        point_a_b_vary_vel_truth(i) = -8*time_scale(i)+52;
    elseif time_scale(i) > 6 && time_scale(i) <= 10
        point_a_b_vary_vel_w_noise(i) = 4 + noise;
        point_a_b_vary_vel_truth(i) = 4;
    end
end

%%% CONSTANT BLOCK POSITION (15cm away from sensor)
for i = 1:length(time_scale)
    % generate random noise for this iteration
    noise = noise_amplitude * randn;
    
    no_motion_w_noise(i) = 15 + noise;
    no_motion_truth(i) = 15;
end

% figure
% plot(time_scale, random_motion_w_noise)
% hold on
% plot(time_scale, random_motion_truth)
% xlabel('Time (seconds)')
% ylabel('Distance (cm)')
% title('Simulated Random Motion with Noise')
% axis([0 10 0 30])
% legend('Random Motion with Noise', 'Random Motion Truth')
% hold off

% figure
% plot(time_scale, point_a_b_const_vel_w_noise)
% hold on
% plot(time_scale, point_a_b_const_vel_truth)
% xlabel('Time (seconds)')
% ylabel('Distance (cm)')
% title('Simulated Point A to B Constant Velocity Motion with Noise')
% axis([0 10 0 30])
% legend('Motion with Noise', 'Motion Truth')
% hold off

% figure
% plot(time_scale, point_a_b_vary_vel_w_noise)
% hold on
% plot(time_scale, point_a_b_vary_vel_truth)
% xlabel('Time (seconds)')
% ylabel('Distance (cm)')
% title('Simulated Point A to B Varying Velocity Motion with Noise')
% axis([0 10 0 30])
% legend('Random Motion with Noise', 'Random Motion Truth')
% hold off
% 
% figure
% plot(time_scale, no_motion_w_noise)
% hold on
% plot(time_scale, no_motion_truth)
% xlabel('Time (seconds)')
% ylabel('Distance (cm)')
% title('Simulated No Motion (Constant Position)')
% axis([0 10 0 30])
% legend('Random Motion with Noise', 'Random Motion Truth')
% hold off

%%
%%%%% Simulated Sensor Measurements
% Define the sensor model as a function handle
sensor_model = @(x) 3.087 * exp(-0.0979 * x);

% Initialize the sensor measurement arrays
sensor_measurement_sim_const_vel_1 = zeros(size(time_scale));
sensor_measurement_sim_const_vel_2 = zeros(size(time_scale));

sensor_measurement_sim_vary_vel_1 = zeros(size(time_scale));
sensor_measurement_sim_vary_vel_2 = zeros(size(time_scale));

sensor_measurement_sim_rnd_mov_1 = zeros(size(time_scale));
sensor_measurement_sim_rnd_mov_2 = zeros(size(time_scale));

sensor_measurement_sim_no_motion_1 = zeros(size(time_scale));
sensor_measurement_sim_no_motion_2 = zeros(size(time_scale));

% Simulate the sensor measurements with noise
for ii = 1:length(time_scale)
    % Apply the sensor model to the true motion to get the expected sensor measurement
    sensor_measurement_sim_rnd_mov_1(ii) = (sensor_model(random_motion_truth(ii)) + noise_amplitude2 * normrnd(0, 1.3648E-4));
    sensor_measurement_sim_rnd_mov_2(ii) = (sensor_model(random_motion_truth(ii)) + noise_amplitude2 * normrnd(0, 1.3648E-4));

    sensor_measurement_sim_const_vel_1(ii) = (sensor_model(point_a_b_const_vel_truth(ii)) + noise_amplitude2 * normrnd(0, 1.3648E-4));
    sensor_measurement_sim_const_vel_2(ii) = (sensor_model(point_a_b_const_vel_truth(ii)) + noise_amplitude2 * normrnd(0, 1.3648E-4));

    sensor_measurement_sim_vary_vel_1(ii) = (sensor_model(point_a_b_vary_vel_truth(ii)) + noise_amplitude2 * normrnd(0, 1.3648E-4));
    sensor_measurement_sim_vary_vel_2(ii) = (sensor_model(point_a_b_vary_vel_truth(ii)) + noise_amplitude2 * normrnd(0, 1.3648E-4));

    sensor_measurement_sim_no_motion_1(ii) = (sensor_model(no_motion_truth(ii)) + noise_amplitude2 * normrnd(0, 1.3648E-4));
    sensor_measurement_sim_no_motion_2(ii) = (sensor_model(no_motion_truth(ii)) + noise_amplitude2 * normrnd(0, 1.3648E-4));
end

% figure
% plot(time_scale, sensor_measurement_sim_rnd_mov_1, 'r');
% hold on;
% plot(time_scale, sensor_measurement_sim_rnd_mov_2, 'g');
% xlabel('Time (seconds)');
% ylabel('Sensor Measurements (V)');
% title('Simulated Sensor Measurements For Random Motion');
% axis([0 10 0 3.2])
% legend('Sensor 1', 'Sensor 2');
% hold off;

% figure
% plot(time_scale, sensor_measurement_sim_const_vel_1, 'r');
% hold on;
% plot(time_scale, sensor_measurement_sim_const_vel_2, 'g');
% xlabel('Time (seconds)');
% ylabel('Sensor Measurements (V)');
% title('Simulated Sensor Measurements For Constant Velocity');
% axis([0 10 0 3.2])
% legend('Sensor 1', 'Sensor 2');
% hold off;
% 
% figure
% plot(time_scale, sensor_measurement_sim_vary_vel_1, 'r');
% hold on;
% plot(time_scale, sensor_measurement_sim_vary_vel_2, 'g');
% xlabel('Time (seconds)');
% ylabel('Sensor Measurements (V)');
% title('Simulated Sensor Measurements For Varying Velocity');
% axis([0 10 0 3.2])
% legend('Sensor 1', 'Sensor 2');
% hold off;
% 
% figure
% plot(time_scale, sensor_measurement_sim_no_motion_1, 'r');
% hold on;
% plot(time_scale, sensor_measurement_sim_no_motion_2, 'g');
% xlabel('Time (seconds)');
% ylabel('Sensor Measurements (V)');
% title('Simulated Sensor Measurements For No Motion');
% axis([0 10 0 3.2])
% legend('Sensor 1', 'Sensor 2');
% hold off;

%% - test simulated data

% State Transition Matrix
A = [1, time_step;
    0, 1];

% Process (System) Noise Matrix
Q = [1.1772e-2, 0;
    0, 4.7089e-2];

Q_linear_motion_higher_noise = [1.1772e2, 0;
                                0, 4.7089e2];

% Sensor Noise Covariance Matrix
R = [1.3648e-4, 0;
    0, 1.3648e-4];

% Sensor Noise Covariance Matrix with higher noise
R_linear_motion_higher_noise = [1.3648, 0;
                                0, 1.3648];

x_est_linear_motion_bad = [10;3];
x_est_linear_motion_good = [29;0];

% EKF on linear motion with good and bad initial state estimates
x_est_simulated_linear_motion_good = ekf_func(time_scale, x_est_linear_motion_good, eye(2), A, Q, R, sensor_measurement_sim_const_vel_1, sensor_measurement_sim_const_vel_2);
data_plot_func([time_scale; time_scale; time_scale], ...
               [point_a_b_const_vel_truth; point_a_b_const_vel_w_noise; x_est_simulated_linear_motion_good(1,:)], ...
               {'Real Position (Truth)','Measured Position', 'Estimated Position'}, ...
               'Position Estimation for Linear Motion with good Initial State Estimate and EKF', ...
               'Time (seconds)', 'Position (cm)', ['r', 'g','b-'])

x_est_simulated_linear_motion_bad = ekf_func(time_scale, x_est_linear_motion_bad, eye(2), A, Q, R, sensor_measurement_sim_const_vel_1, sensor_measurement_sim_const_vel_2);
data_plot_func([time_scale; time_scale; time_scale], ...
               [point_a_b_const_vel_truth; point_a_b_const_vel_w_noise; x_est_simulated_linear_motion_bad(1,:)], ...
               {'Real Position (Truth)','Measured Position', 'Estimated Position'}, ...
               'Position Estimation for Linear Motion with good Initial State Estimate and EKF', ...
               'Time (seconds)', 'Position (cm)', ['r', 'g','b-'])

% EKF on linear motion with different sensor noise matrices
x_est_simulated_linear_motion_normal_sensor_noise = ekf_func(time_scale, x_est_linear_motion_good, eye(2), A, Q, R, sensor_measurement_sim_const_vel_1, sensor_measurement_sim_const_vel_2);
data_plot_func([time_scale; time_scale; time_scale], ...
               [point_a_b_const_vel_truth; point_a_b_const_vel_w_noise; x_est_simulated_linear_motion_normal_sensor_noise(1,:)], ...
               {'Real Position (Truth)','Measured Position', 'Estimated Position'}, ...
               'Position Estimation for Linear Motion with normal Sensor Noise and EKF', ...
               'Time (seconds)', 'Position (cm)', ['r', 'g','b-'])

x_est_simulated_linear_motion_high_sensor_noise = ekf_func(time_scale, x_est_linear_motion_good, eye(2), A, Q, R_linear_motion_higher_noise, sensor_measurement_sim_const_vel_1, sensor_measurement_sim_const_vel_2);
data_plot_func([time_scale; time_scale; time_scale], ...
               [point_a_b_const_vel_truth; point_a_b_const_vel_w_noise; x_est_simulated_linear_motion_high_sensor_noise(1,:)], ...
               {'Real Position (Truth)','Measured Position', 'Estimated Position'}, ...
               'Position Estimation for Linear Motion with high Sensor Noise and EKF', ...
               'Time (seconds)', 'Position (cm)', ['r', 'g','b-'])

% EKF on linear motion with different system noise matrices
x_est_simulated_linear_motion_normal_system_noise = ekf_func(time_scale, x_est_linear_motion_good, eye(2), A, Q, R, sensor_measurement_sim_const_vel_1, sensor_measurement_sim_const_vel_2);
data_plot_func([time_scale; time_scale; time_scale], ...
               [point_a_b_const_vel_truth; point_a_b_const_vel_w_noise; x_est_simulated_linear_motion_normal_system_noise(1,:)], ...
               {'Real Position (Truth)','Measured Position', 'Estimated Position'}, ...
               'Position Estimation for Linear Motion with normal System Noise and EKF', ...
               'Time (seconds)', 'Position (cm)', ['r', 'g','b-'])

x_est_simulated_linear_motion_high_system_noise = ekf_func(time_scale, x_est_linear_motion_good, eye(2), A, Q_linear_motion_higher_noise, R, sensor_measurement_sim_const_vel_1, sensor_measurement_sim_const_vel_2);
data_plot_func([time_scale; time_scale; time_scale], ...
               [point_a_b_const_vel_truth; point_a_b_const_vel_w_noise; x_est_simulated_linear_motion_high_system_noise(1,:)], ...
               {'Real Position (Truth)','Measured Position', 'Estimated Position'}, ...
               'Position Estimation for Linear Motion with high System Noise and EKF', ...
               'Time (seconds)', 'Position (cm)', ['r', 'g','b-'])

% EKF on simulated random motion
x_est_simulated_random_motion = ekf_func(time_scale, [30; 0], eye(2), A, Q, R, sensor_measurement_sim_rnd_mov_1, sensor_measurement_sim_rnd_mov_2);
data_plot_func([time_scale; time_scale; time_scale], ...
               [random_motion_truth; random_motion_w_noise; x_est_simulated_random_motion(1,:)], ...
               {'Real Position (Truth)','Measured Position', 'Estimated Position'}, ...
               'Position Estimation for Random Motion with Kalman Filter', ...
               'Time (seconds)', 'Position (cm)', ['r', 'g','b-'])

% EKF on simulated varying velocity motion
x_est_simulated_varying_velocity_motion = ekf_func(time_scale, [30; 0], eye(2), A, Q, R, sensor_measurement_sim_vary_vel_1, sensor_measurement_sim_vary_vel_2);
data_plot_func([time_scale; time_scale; time_scale], ...
               [point_a_b_vary_vel_truth; point_a_b_vary_vel_w_noise; x_est_simulated_varying_velocity_motion(1,:)], ...
               {'Real Position (Truth)','Measured Position', 'Estimated Position'}, ...
               'Position Estimation for Varying Velocity, Point A to B Motion with Kalman Filter', ...
               'Time (seconds)', 'Position (cm)', ['r', 'g','b-'])

% EKF on simulated no motion
x_est_simulated_no_motion = ekf_func(time_scale, [15; 0], eye(2), A, Q, R, sensor_measurement_sim_no_motion_1, sensor_measurement_sim_no_motion_2);
data_plot_func([time_scale; time_scale; time_scale], ...
               [no_motion_truth; no_motion_w_noise; x_est_simulated_no_motion(1,:)], ...
               {'Real Position (Truth)','Measured Position', 'Estimated Position'}, ...
               'Position Estimation for No Motion with Kalman Filter', ...
               'Time (seconds)', 'Position (cm)', ['r', 'g','b-'])

%%





