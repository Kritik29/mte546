%% Load Data
clc; close all; clear;

load("lab3_4.mat")

%% Filter Data
filter_order = 8;
train_data_pos_0_filtered = medfilt1(train_data_pos_0(:,:), filter_order);
train_data_pos_1_filtered = medfilt1(train_data_pos_1(:,:), filter_order);
train_data_pos_2_filtered = medfilt1(train_data_pos_2(:,:), filter_order);
train_data_pos_3_filtered = medfilt1(train_data_pos_3(:,:), filter_order);
train_data_pos_4_filtered = medfilt1(train_data_pos_4(:,:), filter_order);
train_data_pos_5_filtered = medfilt1(train_data_pos_5(:,:), filter_order);
train_data_pos_6_filtered = medfilt1(train_data_pos_6(:,:), filter_order);
train_data_pos_7_filtered = medfilt1(train_data_pos_7(:,:), filter_order);
train_data_pos_8_filtered = medfilt1(train_data_pos_8(:,:), filter_order);

%% Convert IR sensor data to distance and convert thermocouple data to temp
train_data_pos_0_filtered = apply_inverse_model(train_data_pos_0_filtered);
train_data_pos_1_filtered = apply_inverse_model(train_data_pos_1_filtered);
train_data_pos_2_filtered = apply_inverse_model(train_data_pos_2_filtered);
train_data_pos_3_filtered = apply_inverse_model(train_data_pos_3_filtered);
train_data_pos_4_filtered = apply_inverse_model(train_data_pos_4_filtered);
train_data_pos_5_filtered = apply_inverse_model(train_data_pos_5_filtered);
train_data_pos_6_filtered = apply_inverse_model(train_data_pos_6_filtered);
train_data_pos_7_filtered = apply_inverse_model(train_data_pos_7_filtered);
train_data_pos_8_filtered = apply_inverse_model(train_data_pos_8_filtered);

%% Get all the data with same size
close all;
time = time(1:size(train_data_pos_0_filtered, 1));
train_data_pos_4_filtered = train_data_pos_4_filtered(1:size(train_data_pos_0_filtered,1),:);
train_data_pos_5_filtered = train_data_pos_5_filtered(1:size(train_data_pos_0_filtered,1),:);
train_data_pos_6_filtered = train_data_pos_6_filtered(1:size(train_data_pos_0_filtered,1),:);
train_data_pos_7_filtered = train_data_pos_7_filtered(1:size(train_data_pos_0_filtered,1),:);
train_data_pos_8_filtered = train_data_pos_8_filtered(1:size(train_data_pos_0_filtered,1),:);
%%
train_data_pos_0_filtered = remove_inf(train_data_pos_0_filtered);
train_data_pos_1_filtered = remove_inf(train_data_pos_1_filtered);
train_data_pos_2_filtered = remove_inf(train_data_pos_2_filtered);
train_data_pos_3_filtered = remove_inf(train_data_pos_3_filtered);
train_data_pos_4_filtered = remove_inf(train_data_pos_4_filtered);
train_data_pos_5_filtered = remove_inf(train_data_pos_5_filtered);
train_data_pos_6_filtered = remove_inf(train_data_pos_6_filtered);
train_data_pos_7_filtered = remove_inf(train_data_pos_7_filtered);
train_data_pos_8_filtered = remove_inf(train_data_pos_8_filtered);

%% model thermocouple
thermo_mean_readings = zeros(4, 9);

thermo_mean_readings(1, 1) = mean(train_data_pos_0_filtered(:,1));
thermo_mean_readings(2, 1) = mean(train_data_pos_0_filtered(:,2));
thermo_mean_readings(3, 1) = mean(train_data_pos_0_filtered(:,3));
thermo_mean_readings(4, 1) = mean(train_data_pos_0_filtered(:,4));

thermo_mean_readings(1, 2) = mean(train_data_pos_1_filtered(:,1));
thermo_mean_readings(2, 2) = mean(train_data_pos_1_filtered(:,2));
thermo_mean_readings(3, 2) = mean(train_data_pos_1_filtered(:,3));
thermo_mean_readings(4, 2) = mean(train_data_pos_1_filtered(:,4));

thermo_mean_readings(1, 3) = mean(train_data_pos_2_filtered(:,1));
thermo_mean_readings(2, 3) = mean(train_data_pos_2_filtered(:,2));
thermo_mean_readings(3, 3) = mean(train_data_pos_2_filtered(:,3));
thermo_mean_readings(4, 3) = mean(train_data_pos_2_filtered(:,4));

thermo_mean_readings(1, 4) = mean(train_data_pos_3_filtered(:,1));
thermo_mean_readings(2, 4) = mean(train_data_pos_3_filtered(:,2));
thermo_mean_readings(3, 4) = mean(train_data_pos_3_filtered(:,3));
thermo_mean_readings(4, 4) = mean(train_data_pos_3_filtered(:,4));

thermo_mean_readings(1, 5) = mean(train_data_pos_4_filtered(:,1));
thermo_mean_readings(2, 5) = mean(train_data_pos_4_filtered(:,2));
thermo_mean_readings(3, 5) = mean(train_data_pos_4_filtered(:,3));
thermo_mean_readings(4, 5) = mean(train_data_pos_4_filtered(:,4));

thermo_mean_readings(1, 6) = mean(train_data_pos_5_filtered(:,1));
thermo_mean_readings(2, 6) = mean(train_data_pos_5_filtered(:,2));
thermo_mean_readings(3, 6) = mean(train_data_pos_5_filtered(:,3));
thermo_mean_readings(4, 6) = mean(train_data_pos_5_filtered(:,4));

thermo_mean_readings(1, 7) = mean(train_data_pos_6_filtered(:,1));
thermo_mean_readings(2, 7) = mean(train_data_pos_6_filtered(:,2));
thermo_mean_readings(3, 7) = mean(train_data_pos_6_filtered(:,3));
thermo_mean_readings(4, 7) = mean(train_data_pos_6_filtered(:,4));

thermo_mean_readings(1, 8) = mean(train_data_pos_7_filtered(:,1));
thermo_mean_readings(2, 8) = mean(train_data_pos_7_filtered(:,2));
thermo_mean_readings(3, 8) = mean(train_data_pos_7_filtered(:,3));
thermo_mean_readings(4, 8) = mean(train_data_pos_7_filtered(:,4));

thermo_mean_readings(1, 9) = mean(train_data_pos_8_filtered(:,1));
thermo_mean_readings(2, 9) = mean(train_data_pos_8_filtered(:,2));
thermo_mean_readings(3, 9) = mean(train_data_pos_8_filtered(:,3));
thermo_mean_readings(4, 9) = mean(train_data_pos_8_filtered(:,4));

% aluminum sheet is 10.8 cm by 10.8 cm
% for the context below, origin refers to relative thermocouple location
% origin_x_y
origin_0_0 = 0; % contains thermocouple
origin_1_0 = 3.6; % adjacent block to thermocouple
origin_2_0 = 3.6 + 3.6;
origin_0_1 = 3.6;
origin_1_1 = (2*3.6^2)^0.5;
origin_2_1 = 3.6 + (3.6^2 + (3.6*2)^2)^0.5;
origin_0_2 = 3.6 + 3.6;
origin_1_2 = 3.6 + (3.6^2 + (3.6*2)^2)^0.5;
origin_2_2 = (2*3.6^2)^0.5 + (2*3.6^2)^0.5;

pos_6_thermo_dist = [origin_0_2; origin_1_2; origin_2_2; origin_0_1; origin_1_1; origin_2_1; origin_0_0; origin_1_0; origin_2_0];

pos_0_thermo_dist = [origin_0_0; origin_0_1; origin_0_2; origin_1_0; origin_1_1; origin_1_2; origin_2_0; origin_2_1; origin_2_2];

pos_8_thermo_dist = [origin_2_2; origin_2_1; origin_2_0; origin_1_2; origin_1_1; origin_1_0; origin_0_2; origin_0_1; origin_0_0];

pos_2_thermo_dist = [origin_2_0; origin_1_0; origin_0_0; origin_2_1; origin_1_1; origin_0_1; origin_2_2; origin_1_2; origin_0_2];

%% thermocouple in pos 6
fit_function_1 = fit(pos_6_thermo_dist, thermo_mean_readings(1,:)', 'exp1');

figure;
scatter(pos_6_thermo_dist', thermo_mean_readings(1,:), 'red');
hold on;
fplot(@(x) fit_function_1.a*exp(fit_function_1.b*x), 'blue')
legend('Mean Output Voltage', 'Fitted Curve');
title(['Thermocouple 1', ' - Mean Output vs Fitted Temperature Curve']);
xlabel('Distance');
ylabel('Temp');


%% thermocouple in pos 0
fit_function_2 = fit(pos_0_thermo_dist, thermo_mean_readings(2,:)', 'exp1');

figure;
scatter(pos_0_thermo_dist', thermo_mean_readings(2,:), 'red');
hold on;
fplot(@(x) fit_function_2.a*exp(fit_function_2.b*x), 'blue')
legend('Mean Output Voltage', 'Fitted Curve');
title(['Thermocouple 2', ' - Mean Output vs Fitted Temperature Curve']);
xlabel('Distance');
ylabel('Temp');

%% thermocouple in pos 8
fit_function_3 = fit(pos_8_thermo_dist, thermo_mean_readings(3,:)', 'exp1');

figure;
scatter(pos_8_thermo_dist', thermo_mean_readings(3,:), 'red');
hold on;
fplot(@(x) fit_function_3.a*exp(fit_function_3.b*x), 'blue')
legend('Mean Output Voltage', 'Fitted Curve');
title(['Thermocouple 3', ' - Mean Output vs Fitted Temperature Curve']);
xlabel('Distance');
ylabel('Temp');

%% thermocouple in pos 2
fit_function_4 = fit(pos_2_thermo_dist, thermo_mean_readings(4,:)', 'exp1');

figure;
scatter(pos_2_thermo_dist', thermo_mean_readings(4,:), 'red');
hold on;
fplot(@(x) fit_function_4.a*exp(fit_function_4.b*x), 'blue')
legend('Mean Output Voltage', 'Fitted Curve');
title(['Thermocouple 4', ' - Mean Output vs Fitted Temperature Curve']);
xlabel('Distance');
ylabel('Temp');
