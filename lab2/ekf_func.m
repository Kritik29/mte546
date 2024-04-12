function [x_est_plot] = ekf_func(time_scale, x_est, P_est, A_input, Q_input, R_input, sensor_measurement_1, sensor_measurement_2)
% Define the sensor model as a function handle
sensor_model = @(x) 3.087 * exp(-0.0979 * x);

% State Transition Matrix
A = A_input;

% Process Noise Matrix
Q = Q_input;

% Sensor Noise Covariance Matrix
R = R_input;

% Initialize arrays for storing plots
x_est_plot = zeros(2, length(time_scale)); % For storing state estimates
z_plot = zeros(2, length(time_scale)); % For storing measurements

% Main EKF loop
for k = 1:length(time_scale)
    
    % Prediction Step
    x_pred = A * x_est;
    P_pred = A * P_est * transpose(A) + Q;

    % Calculate the Jacobian at each time step based on the current
    % state estimates
    H = calculate_jacobian(x_pred);
    
    % Measurement Update Step
    z = [sensor_measurement_1(k); sensor_measurement_2(k)];
    y = z - sensor_model(x_pred(1));

    S_k = (H * P_pred * H' + R);
    K = P_pred * H' * inv(S_k);
    
    x_est = x_pred + K * y;
    P_est = (eye(2) - K * H) * P_pred;
    
    % Store estimates for plotting
    x_est_plot(:, k) = x_est;
    z_plot(:, k) = z;
end

end

% Auxiliary function for sensor model (if needed later)
function dist = voltageToDistance(voltage)
    dist = -log(voltage/3.087)/0.0979;
end

function H_k = calculate_jacobian(x_est)
    dh_dx = -0.0979 * 3.087 * exp(-0.0979 * x_est(1)); % Derivative wrt position
    H_k = [dh_dx, 0;
           dh_dx, 0]; % Jacobian matrix
end

