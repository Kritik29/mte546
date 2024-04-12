%%%%%%%%%%%%%%%% simulating motion with random velocity and direction

% simulate for 10 seconds
time_step = 0.025;
time_scale = 0:time_step:10;
random_motion_w_noise = zeros(size(time_scale));
random_motion_truth = zeros(size(time_scale));

% noise parameters
noise_amplitude = 0.3;

% generate a piecewise simulation of motion
% plot is: time against distance (cm)

for i = 1:length(time_scale)
    % generate random noise for this iteration
    noise = noise_amplitude * randn;
    
    if time_scale(i) >= 0 && time_scale(i) <= 2
        random_motion_w_noise(i) = -2*time_scale(i)+29 + noise;
        random_motion_truth(i) = -2*time_scale(i)+29;
    elseif time_scale(i) > 2 && time_scale(i) <= 5
        random_motion_w_noise(i) = -5*time_scale(i)+35 + noise;
        random_motion_truth(i) = -5*time_scale(i)+35;
    elseif time_scale(i) > 5 && time_scale(i) <= 8
        random_motion_w_noise(i) = time_scale(i)+5 + noise;
        random_motion_truth(i) = time_scale(i)+5;
    elseif time_scale(i) > 8 && time_scale(i) <= 9
        random_motion_w_noise(i) = -time_scale(i)+21 + noise;
        random_motion_truth(i) = -time_scale(i)+21;
    elseif time_scale(i) > 9 && time_scale(i) <= 10
        random_motion_w_noise(i) = -7*time_scale(i)+75 + noise;
        random_motion_truth(i) = -7*time_scale(i)+75;
    end
end

plot(time_scale, random_motion_w_noise)
hold on
plot(time_scale, random_motion_truth)
xlabel('Time (seconds)')
ylabel('Distance (cm)')
title('Simulated Random Motion with Noise')
axis([0 10 0 30])
hold off




