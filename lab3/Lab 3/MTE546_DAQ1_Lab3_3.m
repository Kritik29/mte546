%% MTE 546 Data Accquisition Code
% University of Waterloo MTE 546
% Written by Eugene Li Dec 2019
close all; clc;
%% Device Configuration
%If this is operating correctly the board name should appear
devices = daq.getDevices
s = daq.createSession('ni')

%Add analog inputs for each sensor being read
addAnalogInputChannel(s, 'Dev1', 0, 'Voltage') % Thermocouple 0
addAnalogInputChannel(s, 'Dev1', 1, 'Voltage') % Thermocouple 1
addAnalogInputChannel(s, 'Dev1', 2, 'Voltage') % Thermocouple 2
addAnalogInputChannel(s, 'Dev1', 3, 'Voltage') % Thermocouple 3
addAnalogInputChannel(s, 'Dev1', 4, 'Voltage') % IR med 2
addAnalogInputChannel(s, 'Dev1', 5, 'Voltage') % IR long 3
addAnalogInputChannel(s, 'Dev1', 6, 'Voltage') % IR short 0
addAnalogInputChannel(s, 'Dev1', 7, 'Voltage') % IR short 1

s.Rate = 46.5; %input('Enter the desired Sampling Rate [Hz] (e.g. 20):  ')
%% Sensor Reads

% Debugging Tools
% Do a single sensor read
% data = s.inputSingleScan 

% Read for a second
% [data,time] = s.startForeground;
% plot(time,data); 

% Continuious Background Read
% figure;
% s.DurationInSeconds = 5;
% lh = addlistener(s,'DataAvailable', @(src,event) plot(event.TimeStamps, event.Data));
% s.NotifyWhenDataAvailableExceeds = 8000;
% s.startBackground();
% s.wait()
% delete(lh);

% Normal Operation
% Read for a set period of time
s.DurationInSeconds = 60;
time_step = 1/s.Rate
time_scale = 0:time_step:s.DurationInSeconds;

short_range_sensor_model = @(x) -log(x/3.087)/0.0979;
medium_range_sensor_model = @(x) -log(x/2.642)/0.03157;
long_range_sensor_model = @(x) -log(x/3.262)/0.02192;

[data, time] = s.startForeground;

figure;
plot(time, data);
legend('Channel 0', 'Channel 1','Channel 2', 'Channel 3','Channel 4', 'Channel 5','Channel 6', 'Channel 7');
distance_data = zeros(size(data,1), (size(data,2)/2) );

distance_data(:, 1) = arrayfun(short_range_sensor_model, data(:,7));
distance_data(:, 2) = arrayfun(short_range_sensor_model, data(:,8));
distance_data(:, 3) = arrayfun(medium_range_sensor_model, data(:,5));
distance_data(:, 4) = arrayfun(long_range_sensor_model, data(:,6));

figure;
for i = 1:size(distance_data,2)
    plot(time, distance_data(:, i));
    hold on;
end
title("distance");
hold off;
legend ('Channel 4 - med - 2', 'Channel 5 - long - 3','Channel 6 - short - 0', 'Channel 7 - short - 1');

figure;
for i = 1:size(distance_data,2)
    plot(time, data(:, i));
    hold on;
end
title("thermo");
hold off;
legend('Channel 0', 'Channel 1','Channel 2', 'Channel 3');

%% testing
% clc; clear; close all;
% load('lab2_data.mat')
% 
% data = lab2_test_1;
% short_range_sensor_model = @(x) -log(x/3.087)/0.0979;
% distance_data = zeros(size(data));
% 
% for i = 1:size(data,2)
%     distance_data(:, i) = arrayfun(short_range_sensor_model, data(:,i));
% end
% figure; plot(data(:,2)); figure; plot(distance_data(:,2));
%distance_data = arrayfun(short_range_sensor_model, )
