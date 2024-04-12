function [fixed_data_set] = remove_inf(data_set)
%REMOVE_INF Summary of this function goes here
%   Detailed explanation goes here
fixed_data_set = data_set;
for i=1:size(data_set,2)
    temp_data = data_set(:,i);
    temp_data = temp_data(isfinite(temp_data));
    fixed_data_set(1:size(temp_data,1),i) = temp_data;   
end

