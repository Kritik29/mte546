clc; clear; close all;

load('Assignment_5_data.mat')

% Plot raw data
figure(1)
plot(X1,'DisplayName','X1');hold on;plot(X2,'DisplayName','X2');plot(X3,'DisplayName','X3');hold off;
legend();

% Smooth the data and plot in subplots
% !!! Pay attention to the shape! X1~(1x1001), result of smooth~(1001x1)
X1smooth = smooth(X1, 11)';
X2smooth = smooth(X2, 11)';
X3smooth = smooth(X3, 11)';
figure(2)
subplot(3,1,1)
plot(X1,'DisplayName','X1');hold on;plot(X1smooth,'DisplayName','X1smooth');
legend();
subplot(3,1,2)
plot(X2,'DisplayName','X2');hold on;plot(X2smooth,'DisplayName','X2smooth');
legend();
subplot(3,1,3)
plot(X3,'DisplayName','X3');hold on;plot(X3smooth,'DisplayName','X3smooth');
legend();

% Calculate noise
NoiseX1 = X1-X1smooth;
NoiseX2 = X2-X2smooth;
NoiseX3 = X3-X3smooth;

% load the FIS
load('asst5FIS.mat')
% Calculate standard deviation of noise: 201-300;
StdNoiseX1_201 = std(NoiseX1(201:300))
StdNoiseX2_201 = std(NoiseX2(201:300))
StdNoiseX3_201 = std(NoiseX3(201:300))
Q1Weights = evalfis(asst5FIS, [StdNoiseX1_201 StdNoiseX2_201 StdNoiseX3_201])
MeanX1_201 = mean(X1(201:300));
MeanX2_201 = mean(X2(201:300));
MeanX3_201 = mean(X3(201:300));
Xfused_201 = sum(Q1Weights .* [MeanX1_201 MeanX2_201 MeanX3_201]) / sum(Q1Weights)

% Calculate standard deviation of noise: 801-900;
StdNoiseX1_801 = std(NoiseX1(801:900))
StdNoiseX2_801 = std(NoiseX2(801:900))
StdNoiseX3_801 = std(NoiseX3(801:900))
Q2Weights = evalfis(asst5FIS, [StdNoiseX1_801 StdNoiseX2_801 StdNoiseX3_801])
MeanX1_801 = mean(X1(801:900));
MeanX2_801 = mean(X2(801:900));
MeanX3_801 = mean(X3(801:900));
Xfused_801 = sum(Q2Weights .* [MeanX1_801 MeanX2_801 MeanX3_801]) / sum(Q2Weights)
