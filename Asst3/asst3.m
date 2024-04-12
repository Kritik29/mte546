clc; clear; close all;

load('Assignmet3_data.mat')

% Reference link: https://www.mathworks.com/help/matlab/ref/polyfit.html

sin_theta = sin(Angle_new);
cos_theta = cos(Angle_new);

%% Problem 1
% Sensor 1
W1 = fit_one_sensor(AMR1x, AMR1y, sin_theta, cos_theta)

% Sensor 2
W2 = fit_one_sensor(AMR2x, AMR2y, sin_theta, cos_theta)

% Sensor 3
W3 = fit_one_sensor(AMR3x, AMR3y, sin_theta, cos_theta)


%% Problem 2
% Senor 1
[theta1,mean1,var1] = get_one_model_variance(W1, AMR1x, AMR1y, Angle_new);

% Senor 2
[theta2,mean2,var2] = get_one_model_variance(W2, AMR2x, AMR2y, Angle_new);

% Senor 3
[theta3,mean3,var3] = get_one_model_variance(W3, AMR3x, AMR3y, Angle_new);


%% Problem 3
weight1 = 1/var1;
weight2 = 1/var2;
weight3 = 1/var3;
theta_weighted = (weight1*theta1 + weight2*theta2 + weight3*theta3)/(weight1+weight2+weight3);
theta_error_weighted = Angle_new - theta_weighted;
mean_weighted = mean(theta_error_weighted);
var_weighted = var(theta_error_weighted);

%% Helper functions
function W = fit_one_sensor(AMRx, AMRy, sin_theta, cos_theta)
x1 = AMRx; y1 = sin_theta;
x2 = AMRy; y2 = cos_theta;
p_sin = polyfit(x1,y1,1);
p_cos = polyfit(x2,y2,1);
% in the format of [w0 w1 w2 w3]
W = flip([p_cos p_sin]);
end

function theta_estimate = get_one_model_estimate(W, AMRx, AMRy)
atan2y = W(2)*AMRx + W(1);
atan2x = W(4)*AMRy + W(3);
theta_estimate = atan2(atan2y, atan2x);
end

function [theta_estimate, mean_error, var_error] = get_one_model_variance(W, AMRx, AMRy, theta_true)
theta_estimate = get_one_model_estimate(W, AMRx, AMRy);
theta_error = theta_true - theta_estimate;
mean_error = mean(theta_error);
var_error = var(theta_error);
end