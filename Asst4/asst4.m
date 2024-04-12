clc; clear; close all;

load('Assignment4_goodness_estimators.mat')

%% Plot goodness
figure(1)
contourf(Est1_RMS_errors);
colorbar();
xlabel('X')
ylabel('Y')

figure(2)
contourf(Est2_RMS_errors);
colorbar();
xlabel('X')
ylabel('Y')

figure(3)
contourf(Est3_RMS_errors);
colorbar();
xlabel('X')
ylabel('Y')
%% Problem 1

W = [0.55 0.3 0.15];
ordered_y = [4.3 6 4]
ordered_x = [3.2 3.3 3.1]

fused_y = sum(W.*ordered_y)

fused_x = sum(W.*ordered_x)
%% Problem 2
W = [0.55 0.3 0.15];
ordered_y = [4.3 4 6]
ordered_x = [3.2 3.1 3.3]

fused_y = sum(W.*ordered_y)

fused_x = sum(W.*ordered_x)

%% Problem 4


alpha = 0.725;

Max = 0;

for w1 = 0:0.0001:1
        w2=2-2*w1-2*alpha;
        w3=2*alpha-1+w1;
        z=-(w1*log(w1)+w2*log(w2)+w3*log(w3));
        if(imag(z)==0)
            if(z>Max)
                Max = z;
                w1_opt = w1;
                w2_opt = w2;
            end
        end
end

Max;
w1_opt;
w2_opt;
w3_opt = 1-w1_opt-w2_opt;
W_OWA=[w1_opt w2_opt w3_opt];