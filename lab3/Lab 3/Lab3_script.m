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
mean(train_data_pos_8_filtered)

%% Convert IR sensor data to distance
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

%%
% close all;
% mean(train_data_pos_8_filtered(:,8))
% plot(time, train_data_pos_8_filtered(:,8));
% hold on;
% plot(time, medfilt1(train_data_pos_8_filtered(:,8), 8));

% row 1: medium, row 2: long, row 3 and 4: short
ir_mean_readings = zeros(4, 9);

ir_mean_readings(1, 1) = mean(train_data_pos_0_filtered(:,5));
ir_mean_readings(2, 1) = mean(train_data_pos_0_filtered(:,6));
ir_mean_readings(3, 1) = mean(train_data_pos_0_filtered(:,7));
ir_mean_readings(4, 1) = mean(train_data_pos_0_filtered(:,8));

ir_mean_readings(1, 2) = mean(train_data_pos_1_filtered(:,5));
ir_mean_readings(2, 2) = mean(train_data_pos_1_filtered(:,6));
ir_mean_readings(3, 2) = mean(train_data_pos_1_filtered(:,7));
ir_mean_readings(4, 2) = mean(train_data_pos_1_filtered(:,8));

ir_mean_readings(1, 3) = mean(train_data_pos_2_filtered(:,5));
ir_mean_readings(2, 3) = mean(train_data_pos_2_filtered(:,6));
ir_mean_readings(3, 3) = mean(train_data_pos_2_filtered(:,7));
ir_mean_readings(4, 3) = mean(train_data_pos_2_filtered(:,8));

ir_mean_readings(1, 4) = mean(train_data_pos_3_filtered(:,5));
ir_mean_readings(2, 4) = mean(train_data_pos_3_filtered(:,6));
ir_mean_readings(3, 4) = mean(train_data_pos_3_filtered(:,7));
ir_mean_readings(4, 4) = mean(train_data_pos_3_filtered(:,8));

ir_mean_readings(1, 5) = mean(train_data_pos_4_filtered(:,5));
ir_mean_readings(2, 5) = mean(train_data_pos_4_filtered(:,6));
ir_mean_readings(3, 5) = mean(train_data_pos_4_filtered(:,7));
ir_mean_readings(4, 5) = mean(train_data_pos_4_filtered(:,8));

ir_mean_readings(1, 6) = mean(train_data_pos_5_filtered(:,5));
ir_mean_readings(2, 6) = mean(train_data_pos_5_filtered(:,6));
ir_mean_readings(3, 6) = mean(train_data_pos_5_filtered(:,7));
ir_mean_readings(4, 6) = mean(train_data_pos_5_filtered(:,8));

ir_mean_readings(1, 7) = mean(train_data_pos_6_filtered(:,5));
ir_mean_readings(2, 7) = mean(train_data_pos_6_filtered(:,6));
ir_mean_readings(3, 7) = mean(train_data_pos_6_filtered(:,7));
ir_mean_readings(4, 7) = mean(train_data_pos_6_filtered(:,8));

ir_mean_readings(1, 8) = mean(train_data_pos_7_filtered(:,5));
ir_mean_readings(2, 8) = mean(train_data_pos_7_filtered(:,6));
ir_mean_readings(3, 8) = mean(train_data_pos_7_filtered(:,7));
ir_mean_readings(4, 8) = mean(train_data_pos_7_filtered(:,8));

ir_mean_readings(1, 9) = mean(train_data_pos_8_filtered(:,5));
ir_mean_readings(2, 9) = mean(train_data_pos_8_filtered(:,6));
ir_mean_readings(3, 9) = mean(train_data_pos_8_filtered(:,7));
ir_mean_readings(4, 9) = mean(train_data_pos_8_filtered(:,8));

% reject erroneous measurements (block out of FOV of IR sensor)
variances = var(ir_mean_readings(1:2,:), 0, 2);
[~, bad_sensor] = max(variances);
ir_mean_readings(bad_sensor, :) = ir_mean_readings(1, :);

% get average x and y position estimates for each block position
position_0_avg = [mean([ir_mean_readings(1, 1), ir_mean_readings(2, 1)]); 
                  mean([ir_mean_readings(3, 1), ir_mean_readings(4, 1)])];

position_1_avg = [mean([ir_mean_readings(1, 2), ir_mean_readings(2, 2)]); 
                  mean([ir_mean_readings(3, 2), ir_mean_readings(4, 2)])];

position_2_avg = [mean([ir_mean_readings(1, 3), ir_mean_readings(2, 3)]); 
                  mean([ir_mean_readings(3, 3), ir_mean_readings(4, 3)])];

position_3_avg = [mean([ir_mean_readings(1, 4), ir_mean_readings(2, 4)]); 
                  mean([ir_mean_readings(3, 4), ir_mean_readings(4, 4)])];

position_4_avg = [mean([ir_mean_readings(1, 5), ir_mean_readings(2, 5)]); 
                  mean([ir_mean_readings(3, 5), ir_mean_readings(4, 5)])];

position_5_avg = [mean([ir_mean_readings(1, 6), ir_mean_readings(2, 6)]); 
                  mean([ir_mean_readings(3, 6), ir_mean_readings(4, 6)])];

position_6_avg = [mean([ir_mean_readings(1, 7), ir_mean_readings(2, 7)]); 
                  mean([ir_mean_readings(3, 7), ir_mean_readings(4, 7)])];

position_7_avg = [mean([ir_mean_readings(1, 8), ir_mean_readings(2, 8)]); 
                  mean([ir_mean_readings(3, 8), ir_mean_readings(4, 8)])];

position_8_avg = [mean([ir_mean_readings(1, 9), ir_mean_readings(2, 9)]); 
                  mean([ir_mean_readings(3, 9), ir_mean_readings(4, 9)])];

% make IR Gaussian dist plots

x = 0:0.1:10.8;
y = 0:0.1:10.8;
[X, Y] = meshgrid(x, y);

% account for datum offsets
g_pos_0_x = gaussmf(X, [1 position_0_avg(1)-(43-10.8)]);
g_pos_0_y = gaussmf(Y, [1 position_0_avg(2)-(20-10.8)]);
g_pos_0 = g_pos_0_x .* g_pos_0_y;

figure;
subplot(3,1,1)
surf(X,Y,g_pos_0_x/sum(g_pos_0_x,'all'))
xlabel('X'); ylabel('Y'); title('Position 0, x distance average')

subplot(3,1,2)
surf(X,Y,g_pos_0_y/sum(g_pos_0_y,'all'))
xlabel('X'); ylabel('Y'); title('Position 0, y distance average')

subplot(3,1,3)
surf(X,Y,g_pos_0/sum(g_pos_0,'all'))
xlabel('X'); ylabel('Y'); title('Fused')

%
g_pos_1_x = gaussmf(X, [1 position_1_avg(1)-(43-10.8)]);
g_pos_1_y = gaussmf(Y, [1 position_1_avg(2)-(20-10.8)]);
g_pos_1 = g_pos_1_x .* g_pos_1_y;

figure;
subplot(3,1,1)
surf(X,Y,g_pos_1_x/sum(g_pos_1_x,'all'))
xlabel('X'); ylabel('Y'); title('Position 1, x distance average')

subplot(3,1,2)
surf(X,Y,g_pos_1_y/sum(g_pos_1_y,'all'))
xlabel('X'); ylabel('Y'); title('Position 1, y distance average')

subplot(3,1,3)
surf(X,Y,g_pos_1/sum(g_pos_1,'all'))
xlabel('X'); ylabel('Y'); title('Fused')

%
g_pos_2_x = gaussmf(X, [1 position_2_avg(1)-(43-10.8)]);
g_pos_2_y = gaussmf(Y, [1 position_2_avg(2)-(20-10.8)]);
g_pos_2 = g_pos_2_x .* g_pos_2_y;

figure;
subplot(3,1,1)
surf(X,Y,g_pos_2_x/sum(g_pos_2_x,'all'))
xlabel('X'); ylabel('Y'); title('Position 2, x distance average')

subplot(3,1,2)
surf(X,Y,g_pos_2_y/sum(g_pos_2_y,'all'))
xlabel('X'); ylabel('Y'); title('Position 2, y distance average')

subplot(3,1,3)
surf(X,Y,g_pos_2/sum(g_pos_2,'all'))
xlabel('X'); ylabel('Y'); title('Fused')

g_pos_3_x = gaussmf(X, [1 position_3_avg(1)-(43-10.8)]);
g_pos_3_y = gaussmf(Y, [1 position_3_avg(2)-(20-10.8)]);
g_pos_3 = g_pos_3_x .* g_pos_3_y;

figure;
subplot(3,1,1)
surf(X,Y,g_pos_3_x/sum(g_pos_3_x,'all'))
xlabel('X'); ylabel('Y'); title('Position 3, x distance average')

subplot(3,1,2)
surf(X,Y,g_pos_3_y/sum(g_pos_3_y,'all'))
xlabel('X'); ylabel('Y'); title('Position 3, y distance average')

subplot(3,1,3)
surf(X,Y,g_pos_3/sum(g_pos_3,'all'))
xlabel('X'); ylabel('Y'); title('Fused')

g_pos_4_x = gaussmf(X, [1 position_4_avg(1)-(43-10.8)]);
g_pos_4_y = gaussmf(Y, [1 position_4_avg(2)-(20-10.8)]);
g_pos_4 = g_pos_4_x .* g_pos_4_y;

figure;
subplot(3,1,1)
surf(X,Y,g_pos_4_x/sum(g_pos_4_x,'all'))
xlabel('X'); ylabel('Y'); title('Position 4, x distance average')

subplot(3,1,2)
surf(X,Y,g_pos_4_y/sum(g_pos_4_y,'all'))
xlabel('X'); ylabel('Y'); title('Position 4, y distance average')

subplot(3,1,3)
surf(X,Y,g_pos_4/sum(g_pos_4,'all'))
xlabel('X'); ylabel('Y'); title('Fused')

g_pos_5_x = gaussmf(X, [1 position_5_avg(1)-(43-10.8)]);
g_pos_5_y = gaussmf(Y, [1 position_5_avg(2)-(20-10.8)]);
g_pos_5 = g_pos_5_x .* g_pos_5_y;

figure;
subplot(3,1,1)
surf(X,Y,g_pos_5_x/sum(g_pos_5_x,'all'))
xlabel('X'); ylabel('Y'); title('Position 5, x distance average')

subplot(3,1,2)
surf(X,Y,g_pos_5_y/sum(g_pos_5_y,'all'))
xlabel('X'); ylabel('Y'); title('Position 5, y distance average')

subplot(3,1,3)
surf(X,Y,g_pos_5/sum(g_pos_5,'all'))
xlabel('X'); ylabel('Y'); title('Fused')

g_pos_6_x = gaussmf(X, [1 position_6_avg(1)-(43-10.8)]);
g_pos_6_y = gaussmf(Y, [1 position_6_avg(2)-(20-10.8)]);
g_pos_6 = g_pos_6_x .* g_pos_6_y;

figure;
subplot(3,1,1)
surf(X,Y,g_pos_6_x/sum(g_pos_6_x,'all'))
xlabel('X'); ylabel('Y'); title('Position 6, x distance average')

subplot(3,1,2)
surf(X,Y,g_pos_6_y/sum(g_pos_6_y,'all'))
xlabel('X'); ylabel('Y'); title('Position 6, y distance average')

subplot(3,1,3)
surf(X,Y,g_pos_6/sum(g_pos_6,'all'))
xlabel('X'); ylabel('Y'); title('Fused')

g_pos_7_x = gaussmf(X, [1 position_7_avg(1)-(43-10.8)]);
g_pos_7_y = gaussmf(Y, [1 position_7_avg(2)-(20-10.8)]);
g_pos_7 = g_pos_7_x .* g_pos_7_y;

figure;
subplot(3,1,1)
surf(X,Y,g_pos_7_x/sum(g_pos_7_x,'all'))
xlabel('X'); ylabel('Y'); title('Position 7, x distance average')

subplot(3,1,2)
surf(X,Y,g_pos_7_y/sum(g_pos_7_y,'all'))
xlabel('X'); ylabel('Y'); title('Position 7, y distance average')

subplot(3,1,3)
surf(X,Y,g_pos_7/sum(g_pos_7,'all'))
xlabel('X'); ylabel('Y'); title('Fused')

g_pos_8_x = gaussmf(X, [1 position_8_avg(1)-(43-10.8)]);
g_pos_8_y = gaussmf(Y, [1 position_8_avg(2)-(20-10.8)]);
g_pos_8 = g_pos_8_x .* g_pos_8_y;

figure;
subplot(3,1,1)
surf(X,Y,g_pos_8_x/sum(g_pos_8_x,'all'))
xlabel('X'); ylabel('Y'); title('Position 8, x distance average')

subplot(3,1,2)
surf(X,Y,g_pos_8_y/sum(g_pos_8_y,'all'))
xlabel('X'); ylabel('Y'); title('Position 8, y distance average')

subplot(3,1,3)
surf(X,Y,g_pos_8/sum(g_pos_8,'all'))
xlabel('X'); ylabel('Y'); title('Fused')

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
fit_function_1 = fit(pos_6_thermo_dist, thermo_mean_readings(1,:)', 'exp1')

inverse_fit_function_1 = @(x) (log(x/fit_function_1.a))/fit_function_1.b;

inverse_test = @(x) -log(x/fit_function_1.a)/fit_function_1.b;

figure;
scatter(pos_6_thermo_dist', thermo_mean_readings(1,:), 'red');
hold on;
thermocouple_1_fcn = @(x) fit_function_1.a*exp(fit_function_1.b*x);
fplot(thermocouple_1_fcn, 'blue')
legend('Mean Output Voltage', 'Fitted Curve');
title(['Thermocouple 1', ' - Mean Output vs Fitted Temperature Curve']);
xlabel('Distance');
ylabel('Temp');


%% thermocouple in pos 0
fit_function_2 = fit(pos_0_thermo_dist, thermo_mean_readings(2,:)', 'exp1')

inverse_fit_function_2 = @(x) (log(x/fit_function_2.a))/fit_function_2.b;

figure;
scatter(pos_0_thermo_dist', thermo_mean_readings(2,:), 'red');
hold on;
thermocouple_2_fcn = @(x) fit_function_2.a*exp(fit_function_2.b*x);
fplot(thermocouple_2_fcn, 'blue')
legend('Mean Output Voltage', 'Fitted Curve');
title(['Thermocouple 2', ' - Mean Output vs Fitted Temperature Curve']);
xlabel('Distance');
ylabel('Temp');

%% thermocouple in pos 8
fit_function_3 = fit(pos_8_thermo_dist, thermo_mean_readings(3,:)', 'exp1')

inverse_fit_function_3 = @(x) (log(x/fit_function_3.a))/fit_function_3.b;

figure;
scatter(pos_8_thermo_dist', thermo_mean_readings(3,:), 'red');
hold on;
thermocouple_3_fcn = @(x) fit_function_3.a*exp(fit_function_3.b*x);
fplot(thermocouple_3_fcn, 'blue')
legend('Mean Output Voltage', 'Fitted Curve');
title(['Thermocouple 3', ' - Mean Output vs Fitted Temperature Curve']);
xlabel('Distance');
ylabel('Temp');

%% thermocouple in pos 2
fit_function_4 = fit(pos_2_thermo_dist, thermo_mean_readings(4,:)', 'exp1')

inverse_fit_function_4 = @(x) (log(x/fit_function_4.a))/fit_function_4.b;

figure;
scatter(pos_2_thermo_dist', thermo_mean_readings(4,:), 'red');
hold on;
thermocouple_4_fcn = @(x) fit_function_4.a*exp(fit_function_4.b*x);
fplot(thermocouple_4_fcn, 'blue')
legend('Mean Output Voltage', 'Fitted Curve');
title(['Thermocouple 3', ' - Mean Output vs Fitted Temperature Curve']);
xlabel('Distance');
ylabel('Temp');


%% bayesian stuff
x = 0:0.1:10.8;
y = 0:0.1:10.8;
[X, Y] = meshgrid(x, y);

for i = 1:9
col = i;

g_pos_0_thermo_1 = gaussmf(X, [1 inverse_fit_function_1(thermo_mean_readings(1,col))]);
g_pos_0_thermo_2 = gaussmf(Y, [1 inverse_fit_function_2(thermo_mean_readings(2,col))]);
g_pos_0_thermo_3 = gaussmf(X, [1 inverse_fit_function_3(thermo_mean_readings(3,col))]);
g_pos_0_thermo_4 = gaussmf(Y, [1 inverse_fit_function_4(thermo_mean_readings(4,col))]);

g_pos_0 = g_pos_0_thermo_1 .* g_pos_0_thermo_2 .* g_pos_0_thermo_3 .* g_pos_0_thermo_4;
figure;
contourf(X, Y, g_pos_0/sum(g_pos_0,'all'))
xlabel('X'); ylabel('Y'); title('Fused')
end
