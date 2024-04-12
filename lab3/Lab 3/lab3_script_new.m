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
% mean(train_data_pos_8_filtered)

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

if(std(train_data_pos_0_filtered(:,5)) > std(train_data_pos_0_filtered(:,6)))
    std_pos_0_x = std(train_data_pos_0_filtered(:,6));
else
    std_pos_0_x = std(train_data_pos_0_filtered(:,5));
end

if(std(train_data_pos_0_filtered(:,7)) > std(train_data_pos_0_filtered(:,8)))
    std_pos_0_y = std(train_data_pos_0_filtered(:,8));
else
    std_pos_0_y = std(train_data_pos_0_filtered(:,7));
end

% account for datum offsets
g_pos_0_x = gaussmf(X, [std_pos_0_x position_0_avg(1)-(43-10.8)]);
g_pos_0_y = gaussmf(Y, [std_pos_0_y position_0_avg(2)-(20-10.8)]);
g_pos_0 = g_pos_0_x .* g_pos_0_y;

figure;
subplot(3,1,1)
surf(X,Y,g_pos_0_x/sum(g_pos_0_x,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Position 0, x distance average')

subplot(3,1,2)
surf(X,Y,g_pos_0_y/sum(g_pos_0_y,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Position 0, y distance average')

subplot(3,1,3)
surf(X,Y,g_pos_0/sum(g_pos_0,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Fused IR Estimate, Position 0')

if(std(train_data_pos_1_filtered(:,5)) > std(train_data_pos_1_filtered(:,6)))
    std_pos_1_x = std(train_data_pos_1_filtered(:,6));
else
    std_pos_1_x = std(train_data_pos_1_filtered(:,5));
end

if(std(train_data_pos_1_filtered(:,7)) > std(train_data_pos_1_filtered(:,8)))
    std_pos_1_y = std(train_data_pos_1_filtered(:,8));
else
    std_pos_1_y = std(train_data_pos_1_filtered(:,7));
end

%
g_pos_1_x = gaussmf(X, [std_pos_1_x position_1_avg(1)-(43-10.8)]);
g_pos_1_y = gaussmf(Y, [std_pos_1_y position_1_avg(2)-(20-10.8)]);
g_pos_1 = g_pos_1_x .* g_pos_1_y;

figure;
subplot(3,1,1)
surf(X,Y,g_pos_1_x/sum(g_pos_1_x,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Position 1, x distance average')

subplot(3,1,2)
surf(X,Y,g_pos_1_y/sum(g_pos_1_y,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Position 1, y distance average')

subplot(3,1,3)
surf(X,Y,g_pos_1/sum(g_pos_1,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Fused IR Estimate, Position 1')
if(std(train_data_pos_2_filtered(:,5)) > std(train_data_pos_2_filtered(:,6)))
    std_pos_2_x = std(train_data_pos_2_filtered(:,6));
else
    std_pos_2_x = std(train_data_pos_2_filtered(:,5));
end

if(std(train_data_pos_2_filtered(:,7)) > std(train_data_pos_2_filtered(:,8)))
    std_pos_2_y = std(train_data_pos_2_filtered(:,8));
else
    std_pos_2_y = std(train_data_pos_2_filtered(:,7));
end
%
g_pos_2_x = gaussmf(X, [std_pos_2_x position_2_avg(1)-(43-10.8)]);
g_pos_2_y = gaussmf(Y, [std_pos_2_y position_2_avg(2)-(20-10.8)]);
g_pos_2 = g_pos_2_x .* g_pos_2_y;

figure;
subplot(3,1,1)
surf(X,Y,g_pos_2_x/sum(g_pos_2_x,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Position 2, x distance average')

subplot(3,1,2)
surf(X,Y,g_pos_2_y/sum(g_pos_2_y,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Position 2, y distance average')

subplot(3,1,3)
surf(X,Y,g_pos_2/sum(g_pos_2,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Fused IR Estimate, Position 2')

if(std(train_data_pos_3_filtered(:,5)) > std(train_data_pos_3_filtered(:,6)))
    std_pos_3_x = std(train_data_pos_3_filtered(:,6));
else
    std_pos_3_x = std(train_data_pos_3_filtered(:,5));
end

if(std(train_data_pos_3_filtered(:,7)) > std(train_data_pos_3_filtered(:,8)))
    std_pos_3_y = std(train_data_pos_3_filtered(:,8));
else
    std_pos_3_y = std(train_data_pos_3_filtered(:,7));
end

g_pos_3_x = gaussmf(X, [std_pos_3_x position_3_avg(1)-(43-10.8)]);
g_pos_3_y = gaussmf(Y, [std_pos_3_y position_3_avg(2)-(20-10.8)]);
g_pos_3 = g_pos_3_x .* g_pos_3_y;

figure;
subplot(3,1,1)
surf(X,Y,g_pos_3_x/sum(g_pos_3_x,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Position 3, x distance average')

subplot(3,1,2)
surf(X,Y,g_pos_3_y/sum(g_pos_3_y,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Position 3, y distance average')

subplot(3,1,3)
surf(X,Y,g_pos_3/sum(g_pos_3,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Fused IR Estimate, Position 3')

if(std(train_data_pos_4_filtered(:,5)) > std(train_data_pos_4_filtered(:,6)))
    std_pos_4_x = std(train_data_pos_4_filtered(:,6));
else
    std_pos_4_x = std(train_data_pos_4_filtered(:,5));
end

if(std(train_data_pos_4_filtered(:,7)) > std(train_data_pos_4_filtered(:,8)))
    std_pos_4_y = std(train_data_pos_4_filtered(:,8));
else
    std_pos_4_y = std(train_data_pos_4_filtered(:,7));
end

g_pos_4_x = gaussmf(X, [std_pos_4_x position_4_avg(1)-(43-10.8)]);
g_pos_4_y = gaussmf(Y, [std_pos_4_y position_4_avg(2)-(20-10.8)]);
g_pos_4 = g_pos_4_x .* g_pos_4_y;

figure;
subplot(3,1,1)
surf(X,Y,g_pos_4_x/sum(g_pos_4_x,'all'))
xlabel('X [cm]'); ylabel('Y [cm['); title('Position 4, x distance average')

subplot(3,1,2)
surf(X,Y,g_pos_4_y/sum(g_pos_4_y,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Position 4, y distance average')

subplot(3,1,3)
surf(X,Y,g_pos_4/sum(g_pos_4,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Fused IR Estimate, Position 4')

if(std(train_data_pos_5_filtered(:,5)) > std(train_data_pos_5_filtered(:,6)))
    std_pos_5_x = std(train_data_pos_5_filtered(:,6));
else
    std_pos_5_x = std(train_data_pos_5_filtered(:,5));
end

if(std(train_data_pos_5_filtered(:,7)) > std(train_data_pos_5_filtered(:,8)))
    std_pos_5_y = std(train_data_pos_5_filtered(:,8));
else
    std_pos_5_y = std(train_data_pos_5_filtered(:,7));
end

g_pos_5_x = gaussmf(X, [std_pos_5_x position_5_avg(1)-(43-10.8)]);
g_pos_5_y = gaussmf(Y, [std_pos_5_y position_5_avg(2)-(20-10.8)]);
g_pos_5 = g_pos_5_x .* g_pos_5_y;

figure;
subplot(3,1,1)
surf(X,Y,g_pos_5_x/sum(g_pos_5_x,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Position 5, x distance average')

subplot(3,1,2)
surf(X,Y,g_pos_5_y/sum(g_pos_5_y,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Position 5, y distance average')

subplot(3,1,3)
surf(X,Y,g_pos_5/sum(g_pos_5,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Fused IR Estimate, Position 5')

if(std(train_data_pos_6_filtered(:,5)) > std(train_data_pos_6_filtered(:,6)))
    std_pos_6_x = std(train_data_pos_6_filtered(:,6));
else
    std_pos_6_x = std(train_data_pos_6_filtered(:,5));
end

if(std(train_data_pos_6_filtered(:,7)) > std(train_data_pos_6_filtered(:,8)))
    std_pos_6_y = std(train_data_pos_6_filtered(:,8));
else
    std_pos_6_y = std(train_data_pos_6_filtered(:,7));
end

g_pos_6_x = gaussmf(X, [std_pos_6_x position_6_avg(1)-(43-10.8)]);
g_pos_6_y = gaussmf(Y, [std_pos_6_y position_6_avg(2)-(20-10.8)]);
g_pos_6 = g_pos_6_x .* g_pos_6_y;

figure;
subplot(3,1,1)
surf(X,Y,g_pos_6_x/sum(g_pos_6_x,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Position 6, x distance average')

subplot(3,1,2)
surf(X,Y,g_pos_6_y/sum(g_pos_6_y,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Position 6, y distance average')

subplot(3,1,3)
surf(X,Y,g_pos_6/sum(g_pos_6,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Fused IR Estimate, Position 6')

if(std(train_data_pos_7_filtered(:,5)) > std(train_data_pos_7_filtered(:,6)))
    std_pos_7_x = std(train_data_pos_7_filtered(:,6));
else
    std_pos_7_x = std(train_data_pos_7_filtered(:,5));
end

if(std(train_data_pos_7_filtered(:,7)) > std(train_data_pos_7_filtered(:,8)))
    std_pos_7_y = std(train_data_pos_7_filtered(:,8));
else
    std_pos_7_y = std(train_data_pos_7_filtered(:,7));
end

g_pos_7_x = gaussmf(X, [std_pos_7_x position_7_avg(1)-(43-10.8)]);
g_pos_7_y = gaussmf(Y, [std_pos_7_y position_7_avg(2)-(20-10.8)]);
g_pos_7 = g_pos_7_x .* g_pos_7_y;

figure;
subplot(3,1,1)
surf(X,Y,g_pos_7_x/sum(g_pos_7_x,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Position 7, x distance average')

subplot(3,1,2)
surf(X,Y,g_pos_7_y/sum(g_pos_7_y,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Position 7, y distance average')

subplot(3,1,3)
surf(X,Y,g_pos_7/sum(g_pos_7,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Fused IR Estimate, Position 7')

if(std(train_data_pos_8_filtered(:,5)) > std(train_data_pos_8_filtered(:,6)))
    std_pos_8_x = std(train_data_pos_8_filtered(:,6));
else
    std_pos_8_x = std(train_data_pos_8_filtered(:,5));
end

if(std(train_data_pos_8_filtered(:,7)) > std(train_data_pos_8_filtered(:,8)))
    std_pos_8_y = std(train_data_pos_8_filtered(:,8));
else
    std_pos_8_y = std(train_data_pos_8_filtered(:,7));
end

g_pos_8_x = gaussmf(X, [std_pos_8_x position_8_avg(1)-(43-10.8)]);
g_pos_8_y = gaussmf(Y, [std_pos_8_y position_8_avg(2)-(20-10.8)]);
g_pos_8 = g_pos_8_x .* g_pos_8_y;

figure;
subplot(3,1,1)
surf(X,Y,g_pos_8_x/sum(g_pos_8_x,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Position 8, x distance average')

subplot(3,1,2)
surf(X,Y,g_pos_8_y/sum(g_pos_8_y,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Position 8, y distance average')

subplot(3,1,3)
surf(X,Y,g_pos_8/sum(g_pos_8,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Fused IR Estimate, Position 8')

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


%% bayesian fusion model
std_thermo_1_pos_0 = std(train_data_pos_0_filtered(:,1));
std_thermo_2_pos_0 = std(train_data_pos_0_filtered(:,2));
std_thermo_3_pos_0 = std(train_data_pos_0_filtered(:,3));
std_thermo_4_pos_0 = std(train_data_pos_0_filtered(:,4));

g_pos_0_thermo_1 = gaussmf(X, [std_thermo_1_pos_0 inverse_fit_function_1(thermo_mean_readings(1,1))]);
g_pos_0_thermo_2 = gaussmf(Y, [std_thermo_2_pos_0 inverse_fit_function_2(thermo_mean_readings(2,1))]);
g_pos_0_thermo_3 = gaussmf(X, [std_thermo_3_pos_0 inverse_fit_function_3(thermo_mean_readings(3,1))]);
g_pos_0_thermo_4 = gaussmf(Y, [std_thermo_4_pos_0 inverse_fit_function_4(thermo_mean_readings(4,1))]);

thermo_g_pos_0 = g_pos_0_thermo_1 .* g_pos_0_thermo_2 .* g_pos_0_thermo_3 .* g_pos_0_thermo_4;
figure;
contourf(X, Y, thermo_g_pos_0/sum(thermo_g_pos_0,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Thermocouple Position 0 Fused Estimation')

std_thermo_1_pos_1 = std(train_data_pos_1_filtered(:,1));
std_thermo_2_pos_1 = std(train_data_pos_1_filtered(:,2));
std_thermo_3_pos_1 = std(train_data_pos_1_filtered(:,3));
std_thermo_4_pos_1 = std(train_data_pos_1_filtered(:,4));

g_pos_1_thermo_1 = gaussmf(X, [std_thermo_1_pos_1 inverse_fit_function_1(thermo_mean_readings(1,2))]);
g_pos_1_thermo_2 = gaussmf(Y, [std_thermo_2_pos_1 inverse_fit_function_2(thermo_mean_readings(2,2))]);
g_pos_1_thermo_3 = gaussmf(X, [std_thermo_3_pos_1 inverse_fit_function_3(thermo_mean_readings(3,2))]);
g_pos_1_thermo_4 = gaussmf(Y, [std_thermo_4_pos_1 inverse_fit_function_4(thermo_mean_readings(4,2))]);

thermo_g_pos_1 = g_pos_1_thermo_1 .* g_pos_1_thermo_2 .* g_pos_1_thermo_3 .* g_pos_1_thermo_4;
figure;
contourf(X, Y, thermo_g_pos_1/sum(thermo_g_pos_1,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Thermocouple Position 1 Fused Estimation');

std_thermo_1_pos_2 = std(train_data_pos_2_filtered(:,1));
std_thermo_2_pos_2 = std(train_data_pos_2_filtered(:,2));
std_thermo_3_pos_2 = std(train_data_pos_2_filtered(:,3));
std_thermo_4_pos_2 = std(train_data_pos_2_filtered(:,4));

g_pos_2_thermo_1 = gaussmf(X, [std_thermo_1_pos_2 inverse_fit_function_1(thermo_mean_readings(1,3))]);
g_pos_2_thermo_2 = gaussmf(Y, [std_thermo_2_pos_2 inverse_fit_function_2(thermo_mean_readings(2,3))]);
g_pos_2_thermo_3 = gaussmf(X, [std_thermo_3_pos_2 inverse_fit_function_3(thermo_mean_readings(3,3))]);
g_pos_2_thermo_4 = gaussmf(Y, [std_thermo_4_pos_2 inverse_fit_function_4(thermo_mean_readings(4,3))]);

thermo_g_pos_2 = g_pos_2_thermo_1 .* g_pos_2_thermo_2 .* g_pos_2_thermo_3 .* g_pos_2_thermo_4;
figure;
contourf(X, Y, thermo_g_pos_2/sum(thermo_g_pos_2,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Thermocouple Position 2 Fused Estimation');

std_thermo_1_pos_3 = std(train_data_pos_3_filtered(:,1));
std_thermo_2_pos_3 = std(train_data_pos_3_filtered(:,2));
std_thermo_3_pos_3 = std(train_data_pos_3_filtered(:,3));
std_thermo_4_pos_3 = std(train_data_pos_3_filtered(:,4));

g_pos_3_thermo_1 = gaussmf(X, [std_thermo_1_pos_3 inverse_fit_function_1(thermo_mean_readings(1,4))]);
g_pos_3_thermo_2 = gaussmf(Y, [std_thermo_2_pos_3 inverse_fit_function_2(thermo_mean_readings(2,4))]);
g_pos_3_thermo_3 = gaussmf(X, [std_thermo_3_pos_3 inverse_fit_function_3(thermo_mean_readings(3,4))]);
g_pos_3_thermo_4 = gaussmf(Y, [std_thermo_4_pos_3 inverse_fit_function_4(thermo_mean_readings(4,4))]);

thermo_g_pos_3 = g_pos_3_thermo_1 .* g_pos_3_thermo_2 .* g_pos_3_thermo_3 .* g_pos_3_thermo_4;
figure;
contourf(X, Y, thermo_g_pos_1/sum(thermo_g_pos_1,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Thermocouple Position 3 Fused Estimation');

std_thermo_1_pos_4 = std(train_data_pos_4_filtered(:,1));
std_thermo_2_pos_4 = std(train_data_pos_4_filtered(:,2));
std_thermo_3_pos_4 = std(train_data_pos_4_filtered(:,3));
std_thermo_4_pos_4 = std(train_data_pos_4_filtered(:,4));

g_pos_4_thermo_1 = gaussmf(X, [std_thermo_1_pos_4 inverse_fit_function_1(thermo_mean_readings(1,5))]);
g_pos_4_thermo_2 = gaussmf(Y, [std_thermo_2_pos_4 inverse_fit_function_2(thermo_mean_readings(2,5))]);
g_pos_4_thermo_3 = gaussmf(X, [std_thermo_3_pos_4 inverse_fit_function_3(thermo_mean_readings(3,5))]);
g_pos_4_thermo_4 = gaussmf(Y, [std_thermo_4_pos_4 inverse_fit_function_4(thermo_mean_readings(4,5))]);

thermo_g_pos_4 = g_pos_4_thermo_1 .* g_pos_4_thermo_2 .* g_pos_4_thermo_3 .* g_pos_4_thermo_4;
figure;
contourf(X, Y, thermo_g_pos_4/sum(thermo_g_pos_4,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Thermocouple Position 4 Fused Estimation');

std_thermo_1_pos_5 = std(train_data_pos_5_filtered(:,1));
std_thermo_2_pos_5 = std(train_data_pos_5_filtered(:,2));
std_thermo_3_pos_5 = std(train_data_pos_5_filtered(:,3));
std_thermo_4_pos_5 = std(train_data_pos_5_filtered(:,4));

g_pos_5_thermo_1 = gaussmf(X, [std_thermo_1_pos_5 inverse_fit_function_1(thermo_mean_readings(1,6))]);
g_pos_5_thermo_2 = gaussmf(Y, [std_thermo_2_pos_5 inverse_fit_function_2(thermo_mean_readings(2,6))]);
g_pos_5_thermo_3 = gaussmf(X, [std_thermo_3_pos_5 inverse_fit_function_3(thermo_mean_readings(3,6))]);
g_pos_5_thermo_4 = gaussmf(Y, [std_thermo_4_pos_5 inverse_fit_function_4(thermo_mean_readings(4,6))]);

thermo_g_pos_5 = g_pos_5_thermo_1 .* g_pos_5_thermo_2 .* g_pos_5_thermo_3 .* g_pos_5_thermo_4;
figure;
contourf(X, Y, thermo_g_pos_5/sum(thermo_g_pos_5,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Thermocouple Position 5 Fused Estimation');

std_thermo_1_pos_6 = std(train_data_pos_6_filtered(:,1));
std_thermo_2_pos_6 = std(train_data_pos_6_filtered(:,2));
std_thermo_3_pos_6 = std(train_data_pos_6_filtered(:,3));
std_thermo_4_pos_6 = std(train_data_pos_6_filtered(:,4));

g_pos_6_thermo_1 = gaussmf(X, [std_thermo_1_pos_6 inverse_fit_function_1(thermo_mean_readings(1,7))]);
g_pos_6_thermo_2 = gaussmf(Y, [std_thermo_2_pos_6 inverse_fit_function_2(thermo_mean_readings(2,7))]);
g_pos_6_thermo_3 = gaussmf(X, [std_thermo_3_pos_6 inverse_fit_function_3(thermo_mean_readings(3,7))]);
g_pos_6_thermo_4 = gaussmf(Y, [std_thermo_4_pos_6 inverse_fit_function_4(thermo_mean_readings(4,7))]);

thermo_g_pos_6 = g_pos_6_thermo_1 .* g_pos_6_thermo_2 .* g_pos_6_thermo_3 .* g_pos_6_thermo_4;
figure;
contourf(X, Y, thermo_g_pos_6/sum(thermo_g_pos_6,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Thermocouple Position 6 Fused Estimation');

std_thermo_1_pos_7 = std(train_data_pos_7_filtered(:,1));
std_thermo_2_pos_7 = std(train_data_pos_7_filtered(:,2));
std_thermo_3_pos_7 = std(train_data_pos_7_filtered(:,3));
std_thermo_4_pos_7 = std(train_data_pos_7_filtered(:,4));

g_pos_7_thermo_1 = gaussmf(X, [std_thermo_1_pos_7 inverse_fit_function_1(thermo_mean_readings(1,8))]);
g_pos_7_thermo_2 = gaussmf(Y, [std_thermo_2_pos_7 inverse_fit_function_2(thermo_mean_readings(2,8))]);
g_pos_7_thermo_3 = gaussmf(X, [std_thermo_3_pos_7 inverse_fit_function_3(thermo_mean_readings(3,8))]);
g_pos_7_thermo_4 = gaussmf(Y, [std_thermo_4_pos_7 inverse_fit_function_4(thermo_mean_readings(4,8))]);

thermo_g_pos_7 = g_pos_7_thermo_1 .* g_pos_7_thermo_2 .* g_pos_7_thermo_3 .* g_pos_7_thermo_4;
figure;
contourf(X, Y, thermo_g_pos_7/sum(thermo_g_pos_7,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Thermocouple Position 7 Fused Estimation');

std_thermo_1_pos_8 = std(train_data_pos_8_filtered(:,1));
std_thermo_2_pos_8 = std(train_data_pos_8_filtered(:,2));
std_thermo_3_pos_8 = std(train_data_pos_8_filtered(:,3));
std_thermo_4_pos_8 = std(train_data_pos_8_filtered(:,4));

g_pos_8_thermo_1 = gaussmf(X, [std_thermo_1_pos_8 inverse_fit_function_1(thermo_mean_readings(1,9))]);
g_pos_8_thermo_2 = gaussmf(Y, [std_thermo_2_pos_8 inverse_fit_function_2(thermo_mean_readings(2,9))]);
g_pos_8_thermo_3 = gaussmf(X, [std_thermo_3_pos_8 inverse_fit_function_3(thermo_mean_readings(3,9))]);
g_pos_8_thermo_4 = gaussmf(Y, [std_thermo_4_pos_8 inverse_fit_function_4(thermo_mean_readings(4,9))]);

thermo_g_pos_8 = g_pos_8_thermo_1 .* g_pos_8_thermo_2 .* g_pos_8_thermo_3 .* g_pos_8_thermo_4;
figure;
contourf(X, Y, thermo_g_pos_8/sum(thermo_g_pos_8,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Thermocouple Position 8 Fused Estimation');


%% fusing thermocouple and IR
g_pos_0_bof = thermo_g_pos_0 * g_pos_0;
figure;
surf(X, Y, g_pos_0_bof/sum(g_pos_0_bof,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Position 0 Fully Fused Estimation')

g_pos_1_bof = thermo_g_pos_1 * g_pos_1;
figure;
surf(X, Y, g_pos_1_bof/sum(g_pos_1_bof,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Position 1 Fully Fused Estimation')

g_pos_2_bof = thermo_g_pos_2 * g_pos_2;
figure;
surf(X, Y, g_pos_2_bof/sum(g_pos_2_bof,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Position 2 Fully Fused Estimation')

g_pos_3_bof = thermo_g_pos_3 * g_pos_3;
figure;
surf(X, Y, g_pos_3_bof/sum(g_pos_3_bof,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Position 3 Fully Fused Estimation')

g_pos_4_bof = thermo_g_pos_4 * g_pos_4;
figure;
surf(X, Y, g_pos_4_bof/sum(g_pos_4_bof,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Position 4 Fully Fused Estimation')

g_pos_5_bof = thermo_g_pos_5 * g_pos_5;
figure;
surf(X, Y, g_pos_5_bof/sum(g_pos_5_bof,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Position 5 Fully Fused Estimation')

g_pos_6_bof = thermo_g_pos_6 * g_pos_6;
figure;
surf(X, Y, g_pos_6_bof/sum(g_pos_6_bof,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Position 6 Fully Fused Estimation')

g_pos_7_bof = thermo_g_pos_7 * g_pos_7;
figure;
surf(X, Y, g_pos_7_bof/sum(g_pos_7_bof,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Position 7 Fully Fused Estimation')

g_pos_8_bof = thermo_g_pos_8 * g_pos_8;
figure;
surf(X, Y, g_pos_8_bof/sum(g_pos_8_bof,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Position 8 Fully Fused Estimation')

%% Evaluation of Models
%% Filter Data
close all;
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

%% three different times stuff
array_size = size(test_data_1_filtered, 1)/5;

test_thermo_mean_readings_timestamped = zeros(4, 5);
test_thermo_mean_readings_timestamped(1, 1) = mean(test_data_1_filtered(1:300,1));
test_thermo_mean_readings_timestamped(2, 1) = mean(test_data_1_filtered(1:300,2));
test_thermo_mean_readings_timestamped(3, 1) = mean(test_data_1_filtered(1:300,3));
test_thermo_mean_readings_timestamped(4, 1) = mean(test_data_1_filtered(1:300,4));

test_thermo_mean_readings_timestamped(1, 2) = mean(test_data_1_filtered(array_size:array_size+300,1));
test_thermo_mean_readings_timestamped(2, 2) = mean(test_data_1_filtered(array_size:array_size+300,2));
test_thermo_mean_readings_timestamped(3, 2) = mean(test_data_1_filtered(array_size:array_size+300,3));
test_thermo_mean_readings_timestamped(4, 2) = mean(test_data_1_filtered(array_size:array_size+300,4));

test_thermo_mean_readings_timestamped(1, 3) = mean(test_data_1_filtered(array_size*2:array_size*2+300,1));
test_thermo_mean_readings_timestamped(2, 3) = mean(test_data_1_filtered(array_size*2:array_size*2+300,2));
test_thermo_mean_readings_timestamped(3, 3) = mean(test_data_1_filtered(array_size*2:array_size*2+300,3));
test_thermo_mean_readings_timestamped(4, 3) = mean(test_data_1_filtered(array_size*2:array_size*2+300,4));

test_thermo_mean_readings_timestamped(1, 4) = mean(test_data_1_filtered(array_size*3:array_size*3+300,1));
test_thermo_mean_readings_timestamped(2, 4) = mean(test_data_1_filtered(array_size*3:array_size*3+300,2));
test_thermo_mean_readings_timestamped(3, 4) = mean(test_data_1_filtered(array_size*3:array_size*3+300,3));
test_thermo_mean_readings_timestamped(4, 4) = mean(test_data_1_filtered(array_size*3:array_size*3+300,4));

test_thermo_mean_readings_timestamped(1, 5) = mean(test_data_1_filtered(array_size*5-300:end,1));
test_thermo_mean_readings_timestamped(2, 5) = mean(test_data_1_filtered(array_size*5-300:end,2));
test_thermo_mean_readings_timestamped(3, 5) = mean(test_data_1_filtered(array_size*5-300:end,3));
test_thermo_mean_readings_timestamped(4, 5) = mean(test_data_1_filtered(array_size*5-300:end,4));

std_thermo_1_test_1 = std(test_data_1_filtered(size(test_data_1_filtered, 1)-300:end,1));
std_thermo_2_test_1 = std(test_data_1_filtered(size(test_data_1_filtered, 1)-300:end,2));
std_thermo_3_test_1 = std(test_data_1_filtered(size(test_data_1_filtered, 1)-300:end,3));
std_thermo_4_test_1 = std(test_data_1_filtered(size(test_data_1_filtered, 1)-300:end,4));

g_time_1_thermo_1 = gaussmf(X, [std_thermo_1_test_1 inverse_fit_function_1(test_thermo_mean_readings_timestamped(1, 1))]);
g_time_1_thermo_2 = gaussmf(Y, [std_thermo_2_test_1 inverse_fit_function_2(test_thermo_mean_readings_timestamped(2, 1))]);
g_time_1_thermo_3 = gaussmf(X, [std_thermo_3_test_1 inverse_fit_function_3(test_thermo_mean_readings_timestamped(3, 1))]);
g_time_1_thermo_4 = gaussmf(Y, [std_thermo_4_test_1 inverse_fit_function_4(test_thermo_mean_readings_timestamped(4, 1))]);

thermo_g_time_1 = g_time_1_thermo_1 .* g_time_1_thermo_2 .* g_time_1_thermo_3 .* g_time_1_thermo_4;

g_test_time_1_bof = thermo_g_time_1 * g_test_1;
figure;
contourf(X, Y, g_test_time_1_bof/sum(g_test_time_1_bof,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Test 1 Time Stamp 1 Estimation')

g_time_2_thermo_1 = gaussmf(X, [std_thermo_1_test_1 inverse_fit_function_1(test_thermo_mean_readings_timestamped(1, 2))]);
g_time_2_thermo_2 = gaussmf(Y, [std_thermo_2_test_1 inverse_fit_function_2(test_thermo_mean_readings_timestamped(2, 2))]);
g_time_2_thermo_3 = gaussmf(X, [std_thermo_3_test_1 inverse_fit_function_3(test_thermo_mean_readings_timestamped(3, 2))]);
g_time_2_thermo_4 = gaussmf(Y, [std_thermo_4_test_1 inverse_fit_function_4(test_thermo_mean_readings_timestamped(4, 2))]);

thermo_g_time_2 = g_time_2_thermo_1 .* g_time_2_thermo_2 .* g_time_2_thermo_3 .* g_time_2_thermo_4;

g_test_time_2_bof = thermo_g_time_2 * g_test_1;
figure;
contourf(X, Y, g_test_time_2_bof/sum(g_test_time_2_bof,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Test 1 Time Stamp 2 Estimation')

g_time_3_thermo_1 = gaussmf(X, [std_thermo_1_test_1 inverse_fit_function_1(test_thermo_mean_readings_timestamped(1, 3))]);
g_time_3_thermo_2 = gaussmf(Y, [std_thermo_2_test_1 inverse_fit_function_2(test_thermo_mean_readings_timestamped(2, 3))]);
g_time_3_thermo_3 = gaussmf(X, [std_thermo_3_test_1 inverse_fit_function_3(test_thermo_mean_readings_timestamped(3, 3))]);
g_time_3_thermo_4 = gaussmf(Y, [std_thermo_4_test_1 inverse_fit_function_4(test_thermo_mean_readings_timestamped(4, 3))]);

thermo_g_time_3 = g_time_3_thermo_1 .* g_time_3_thermo_2 .* g_time_3_thermo_3 .* g_time_3_thermo_4;

g_test_time_3_bof = thermo_g_time_3 * g_test_1;
figure;
contourf(X, Y, g_test_time_3_bof/sum(g_test_time_3_bof,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Test 1 Time Stamp 3 Estimation')

g_time_4_thermo_1 = gaussmf(X, [std_thermo_1_test_1 inverse_fit_function_1(test_thermo_mean_readings_timestamped(1, 4))]);
g_time_4_thermo_2 = gaussmf(Y, [std_thermo_2_test_1 inverse_fit_function_2(test_thermo_mean_readings_timestamped(2, 4))]);
g_time_4_thermo_3 = gaussmf(X, [std_thermo_3_test_1 inverse_fit_function_3(test_thermo_mean_readings_timestamped(3, 4))]);
g_time_4_thermo_4 = gaussmf(Y, [std_thermo_4_test_1 inverse_fit_function_4(test_thermo_mean_readings_timestamped(4, 4))]);

thermo_g_time_4 = g_time_4_thermo_1 .* g_time_4_thermo_2 .* g_time_4_thermo_3 .* g_time_4_thermo_4;

g_test_time_4_bof = thermo_g_time_4 * g_test_1;
figure;
contourf(X, Y, g_test_time_4_bof/sum(g_test_time_4_bof,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Test 1 Time Stamp 4 Estimation')

g_time_5_thermo_1 = gaussmf(X, [std_thermo_1_test_1 inverse_fit_function_1(test_thermo_mean_readings_timestamped(1, 5))]);
g_time_5_thermo_2 = gaussmf(Y, [std_thermo_2_test_1 inverse_fit_function_2(test_thermo_mean_readings_timestamped(2, 5))]);
g_time_5_thermo_3 = gaussmf(X, [std_thermo_3_test_1 inverse_fit_function_3(test_thermo_mean_readings_timestamped(3, 5))]);
g_time_5_thermo_4 = gaussmf(Y, [std_thermo_4_test_1 inverse_fit_function_4(test_thermo_mean_readings_timestamped(4, 5))]);

thermo_g_time_5 = g_time_5_thermo_1 .* g_time_5_thermo_2 .* g_time_5_thermo_3 .* g_time_5_thermo_4;

g_test_time_5_bof = thermo_g_time_5 * g_test_1;
figure;
contourf(X, Y, g_test_time_5_bof/sum(g_test_time_5_bof,'all'))
xlabel('X [cm]'); ylabel('Y [cm]'); title('Test 1 Time Stamp 5 Estimation')