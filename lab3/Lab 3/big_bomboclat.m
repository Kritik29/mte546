%% Load Data
clc; close all;

load("lab3_4.mat")

%% Filter Data
filter_order = 8;
test_data_1_filtered = medfilt1(test_data_1(:,:), filter_order);
test_data_2_filtered = medfilt1(test_data_2(:,:), filter_order);
test_data_3_filtered = medfilt1(test_data_3(:,:), filter_order);

%% Convert sensor data to distance
test_data_1_filtered = apply_inverse_model(test_data_1_filtered);
test_data_2_filtered = apply_inverse_model(test_data_2_filtered);
test_data_3_filtered = apply_inverse_model(test_data_3_filtered);

%% Remove inf
test_data_1_filtered = remove_inf(test_data_1_filtered);
test_data_2_filtered = remove_inf(test_data_2_filtered);
test_data_3_filtered = remove_inf(test_data_3_filtered);

%% Thermocouple sensor model evaluation only
inverse_fit_function_1 = @(x) (log(x/fit_function_1.a))/fit_function_1.b;
inverse_fit_function_2 = @(x) (log(x/fit_function_2.a))/fit_function_2.b;
inverse_fit_function_3 = @(x) (log(x/fit_function_3.a))/fit_function_3.b;
inverse_fit_function_4 = @(x) (log(x/fit_function_4.a))/fit_function_4.b;

test_thermo_mean_readings = zeros(4, 3);
test_thermo_mean_readings(1, 1) = mean(test_data_1_filtered(size(test_data_1_filtered, 1)-1000:end,1));
test_thermo_mean_readings(2, 1) = mean(test_data_1_filtered(size(test_data_1_filtered, 1)-1000:end,2));
test_thermo_mean_readings(3, 1) = mean(test_data_1_filtered(size(test_data_1_filtered, 1)-1000:end,3));
test_thermo_mean_readings(4, 1) = mean(test_data_1_filtered(size(test_data_1_filtered, 1)-1000:end,4));

test_thermo_mean_readings(1, 2) = mean(test_data_2_filtered(size(test_data_2_filtered, 1)-1000:end,1));
test_thermo_mean_readings(2, 2) = mean(test_data_2_filtered(size(test_data_2_filtered, 1)-1000:end,2));
test_thermo_mean_readings(3, 2) = mean(test_data_2_filtered(size(test_data_2_filtered, 1)-1000:end,3));
test_thermo_mean_readings(4, 2) = mean(test_data_2_filtered(size(test_data_2_filtered, 1)-1000:end,4));

test_thermo_mean_readings(1, 3) = mean(test_data_3_filtered(size(test_data_3_filtered, 1)-1000:end,1));
test_thermo_mean_readings(2, 3) = mean(test_data_3_filtered(size(test_data_3_filtered, 1)-1000:end,2));
test_thermo_mean_readings(3, 3) = mean(test_data_3_filtered(size(test_data_3_filtered, 1)-1000:end,3));
test_thermo_mean_readings(4, 3) = mean(test_data_3_filtered(size(test_data_3_filtered, 1)-1000:end,4));

std_thermo_1_test_1 = std(test_data_1_filtered(size(test_data_1_filtered, 1)-1000:end,1));
std_thermo_2_test_1 = std(test_data_1_filtered(size(test_data_1_filtered, 1)-1000:end,2));
std_thermo_3_test_1 = std(test_data_1_filtered(size(test_data_1_filtered, 1)-1000:end,3));
std_thermo_4_test_1 = std(test_data_1_filtered(size(test_data_1_filtered, 1)-1000:end,4));

g_test_1_thermo_1 = gaussmf(X, [std_thermo_1_test_1 inverse_fit_function_1(test_thermo_mean_readings(1, 1))]);
g_test_1_thermo_2 = gaussmf(Y, [std_thermo_2_test_1 inverse_fit_function_2(test_thermo_mean_readings(2, 1))]);
g_test_1_thermo_3 = gaussmf(X, [std_thermo_3_test_1 inverse_fit_function_3(test_thermo_mean_readings(3, 1))]);
g_test_1_thermo_4 = gaussmf(Y, [std_thermo_4_test_1 inverse_fit_function_4(test_thermo_mean_readings(4, 1))]);

thermo_g_test_1 = g_test_1_thermo_1 .* g_test_1_thermo_2 .* g_test_1_thermo_3 .* g_test_1_thermo_4;

figure;
contourf(X, Y, thermo_g_test_1/sum(thermo_g_test_1,'all'));
xlabel('X [cm]'); ylabel('Y [cm]');
title('Thermocouple Test Position 1 Fused Estimation');

std_thermo_1_test_2 = std(test_data_2_filtered(size(test_data_2_filtered, 1)-1000:end,1));
std_thermo_2_test_2 = std(test_data_2_filtered(size(test_data_2_filtered, 1)-1000:end,2));
std_thermo_3_test_2 = std(test_data_2_filtered(size(test_data_2_filtered, 1)-1000:end,3));
std_thermo_4_test_2 = std(test_data_2_filtered(size(test_data_2_filtered, 1)-1000:end,4));

g_test_2_thermo_1 = gaussmf(X, [std_thermo_1_test_2 inverse_fit_function_1(test_thermo_mean_readings(1, 2))]);
g_test_2_thermo_2 = gaussmf(Y, [std_thermo_2_test_2 inverse_fit_function_2(test_thermo_mean_readings(2, 2))]);
g_test_2_thermo_3 = gaussmf(X, [std_thermo_3_test_2 inverse_fit_function_3(test_thermo_mean_readings(3, 2))]);
g_test_2_thermo_4 = gaussmf(Y, [std_thermo_4_test_2 inverse_fit_function_4(test_thermo_mean_readings(4, 2))]);

thermo_g_test_2 = g_test_2_thermo_1 .* g_test_2_thermo_2 .* g_test_2_thermo_3 .* g_test_2_thermo_4;

figure;
contourf(X, Y, thermo_g_test_2/sum(thermo_g_test_2,'all'));
xlabel('X [cm]'); ylabel('Y [cm]');
title('Thermocouple Test Position 1 Fused Estimation');

std_thermo_1_test_3 = std(test_data_3_filtered(size(test_data_3_filtered, 1)-1000:end,1));
std_thermo_2_test_3 = std(test_data_3_filtered(size(test_data_3_filtered, 1)-1000:end,2));
std_thermo_3_test_3 = std(test_data_3_filtered(size(test_data_3_filtered, 1)-1000:end,3));
std_thermo_4_test_3 = std(test_data_3_filtered(size(test_data_3_filtered, 1)-1000:end,4));

g_test_3_thermo_1 = gaussmf(X, [std_thermo_1_test_3 inverse_fit_function_1(test_thermo_mean_readings(1, 3))]);
g_test_3_thermo_2 = gaussmf(Y, [std_thermo_2_test_3 inverse_fit_function_2(test_thermo_mean_readings(2, 3))]);
g_test_3_thermo_3 = gaussmf(X, [std_thermo_3_test_3 inverse_fit_function_3(test_thermo_mean_readings(3, 3))]);
g_test_3_thermo_4 = gaussmf(Y, [std_thermo_4_test_3 inverse_fit_function_4(test_thermo_mean_readings(4, 3))]);

thermo_g_test_3 = g_test_3_thermo_1 .* g_test_3_thermo_2 .* g_test_3_thermo_3 .* g_test_3_thermo_4;

figure;
contourf(X, Y, thermo_g_test_3/sum(thermo_g_test_3,'all'));
xlabel('X [cm]'); ylabel('Y [cm]');
title('Thermocouple Test Position 2 Fused Estimation');

%% IR sensor model evaluation only
ir_mean_readings_test = zeros(4, 3);

ir_mean_readings_test(1, 1) = mean(test_data_1_filtered(:,5));
ir_mean_readings_test(2, 1) = mean(test_data_1_filtered(:,6));
ir_mean_readings_test(3, 1) = mean(test_data_1_filtered(:,7));
ir_mean_readings_test(4, 1) = mean(test_data_1_filtered(:,8));

ir_mean_readings_test(1, 2) = mean(test_data_2_filtered(:,5));
ir_mean_readings_test(2, 2) = mean(test_data_2_filtered(:,6));
ir_mean_readings_test(3, 2) = mean(test_data_2_filtered(:,7));
ir_mean_readings_test(4, 2) = mean(test_data_2_filtered(:,8));

ir_mean_readings_test(1, 3) = mean(test_data_3_filtered(:,5));
ir_mean_readings_test(2, 3) = mean(test_data_3_filtered(:,6));
ir_mean_readings_test(3, 3) = mean(test_data_3_filtered(:,7));
ir_mean_readings_test(4, 3) = mean(test_data_3_filtered(:,8));

% reject data from inaccurate sensors (preprocess test data before model
% evaluation)
ir_mean_readings_test(1, 2) = ir_mean_readings_test(2, 2);
ir_mean_readings_test(2, 1) = ir_mean_readings_test(1, 1);
ir_mean_readings_test(2, 3) = ir_mean_readings_test(1, 3);

% get x and y position estimates for each test point
test_1_avg = [mean([ir_mean_readings_test(1, 1), ir_mean_readings_test(2, 1)]);
              mean([ir_mean_readings_test(3, 1), ir_mean_readings_test(4, 1)])];

test_2_avg = [mean([ir_mean_readings_test(1, 2), ir_mean_readings_test(2, 2)]);
              mean([ir_mean_readings_test(3, 2), ir_mean_readings_test(4, 2)])];

test_3_avg = [mean([ir_mean_readings_test(1, 3), ir_mean_readings_test(2, 3)]);
              mean([ir_mean_readings_test(3, 3), ir_mean_readings_test(4, 3)])];

% IR model evaluation on test data points
x_test = 0:0.1:10.8;
y_test = 0:0.1:10.8;
[X_test, Y_test] = meshgrid(x_test, y_test);

% account for datum offsets
g_test_1_x = gaussmf(X_test, [std(test_data_1_filtered(:,5)) test_1_avg(1)-(43-10.8)]);
g_test_1_y = gaussmf(Y_test, [std(test_data_1_filtered(:,5)) test_1_avg(2)-(20-10.8)]);
g_test_1 = g_test_1_x .* g_test_1_y;

figure;
subplot(3,1,1)
surf(X_test,Y_test,g_test_1_x/sum(g_test_1_x,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Test Position 1, x distance average')

subplot(3,1,2)
surf(X_test,Y_test,g_test_1_y/sum(g_test_1_y,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Test Position 1, y distance average')

subplot(3,1,3)
surf(X_test,Y_test,g_test_1/sum(g_test_1,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Fused IR Estimate, Test Position 1')

g_test_2_x = gaussmf(X_test, [std(test_data_2_filtered(:,7)) test_2_avg(1)-(43-10.8)]);
g_test_2_y = gaussmf(Y_test, [std(test_data_2_filtered(:,7)) test_2_avg(2)-(20-10.8)]);
g_test_2 = g_test_2_x .* g_test_2_y;

figure;
subplot(3,1,1)
surf(X_test,Y_test,g_test_2_x/sum(g_test_2_x,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Test Position 2, x distance average')

subplot(3,1,2)
surf(X_test,Y_test,g_test_2_y/sum(g_test_2_y,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Test Position 2, y distance average')

subplot(3,1,3)
surf(X_test,Y_test,g_test_2/sum(g_test_2,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Fused IR Estimate, Test Position 2')

g_test_3_x = gaussmf(X_test, [std(test_data_1_filtered(:,5)) test_3_avg(1)-(43-10.8)]);
g_test_3_y = gaussmf(Y_test, [std(test_data_1_filtered(:,5)) test_3_avg(2)-(20-10.8)]);
g_test_3 = g_test_3_x .* g_test_3_y;

figure;
subplot(3,1,1)
surf(X_test,Y_test,g_test_3_x/sum(g_test_3_x,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Test Position 3, x distance average')

subplot(3,1,2)
surf(X_test,Y_test,g_test_3_y/sum(g_test_3_y,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Test Position 3, y distance average')

subplot(3,1,3)
surf(X_test,Y_test,g_test_3/sum(g_test_3,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Fused IR Estimate, Test Position 3')

%% Thermocouple and IR sensor model evaluation last 
g_test_1_bof = thermo_g_test_1 * g_test_1;
figure;
contourf(X, Y, g_test_1_bof/sum(g_test_1_bof,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Test 1 Fully Fused Estimation')

g_test_2_bof = thermo_g_test_2 * g_test_2;
figure;
contourf(X, Y, g_test_2_bof/sum(g_test_2_bof,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Test 2 Fully Fused Estimation')

g_test_3_bof = thermo_g_test_3 * g_test_3;
figure;
contourf(X, Y, g_test_3_bof/sum(g_test_3_bof,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Test 3 Fully Fused Estimation')