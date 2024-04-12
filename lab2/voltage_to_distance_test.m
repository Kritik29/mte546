voltageToDistance(1.55)

function dist = voltageToDistance(voltage)
    % Define the mapping from voltage to distance
    dist = -log(voltage/3.087)/0.0979; % Implement the actual conversion
end
