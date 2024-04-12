function [new_data] = apply_inverse_model(old_data)
%APPLY_INVERSE_MODEL Summary of this function goes here
%   Detailed explanation goes here
short_range_sensor_model = @(x) -log(x/3.087)/0.0979;
medium_range_sensor_model = @(x) -log(x/2.642)/0.03157;
long_range_sensor_model = @(x) -log(x/3.262)/0.02192;
new_data = old_data;
new_data(:, 7) = arrayfun(short_range_sensor_model, old_data(:,7));
new_data(:, 8) = arrayfun(short_range_sensor_model, old_data(:,8));
new_data(:, 5) = arrayfun(medium_range_sensor_model, old_data(:,5));
new_data(:, 6) = arrayfun(long_range_sensor_model, old_data(:,6));

end

