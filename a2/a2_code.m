x_ = x;
y_ = y_contaminated;

% Construct the design matrix for a 4th order polynomial
X = [ones(length(x_), 1), x_, x_.^2, x_.^3, x_.^4];

% Compute the polynomial coefficients using ordinary least squares
beta = (X' * X) \ X' * y_;

% Create a fine grid of x values for plotting the fitted curve
x_fit = linspace(min(x), max(x), 1000)';
X_fit = [ones(length(x_fit), 1), x_fit, x_fit.^2, x_fit.^3, x_fit.^4];

% Calculate the fitted y values
y_fit = X_fit * beta;

% Plot the original data and the fitted polynomial
plot(x_, y_, 'o'); % original data
hold on;
plot(x_fit, y_fit, '-'); % fitted curve
xlabel('Time steps');
ylabel('Sensor data');
title('4th Order Polynomial Fit');
legend('Original Data', 'Fitted Curve');

beta_4 = beta(5)

% Calculate the predicted y values for your original x values
y_pred = X * beta;

% Calculate the Total Sum of Squares (SST)
y_mean = mean(y_);
SST = sum((y_ - y_mean).^2);

% Calculate the Residual Sum of Squares (SSR)
SSR = sum((y_ - y_pred).^2);

% Calculate R^2
R_squared = 1 - (SSR / SST)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Set regularization parameter lambda to 2
lambda = 2;

% Identity matrix of the same size as X'X
I = eye(size(X, 2));

% Solve for ridge regression (L2 regularized least squares) weight vector
W_L2_reg = (X' * X + lambda * I) \ X' * y_;

% Calculate the L2 norms of the weight vectors
norm_W_L2_reg = norm(W_L2_reg, 2);
norm_W_LS = norm(beta, 2);

% Calculate the ratio of the norms
ratio_norms = norm_W_L2_reg / norm_W_LS

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Construct the design matrix for a 4th order polynomial
X = [ones(length(x), 1), x, x.^2, x.^3, x.^4];

% Step 1: Initial 4th order polynomial fit using ordinary least squares
beta_initial = (X' * X) \ X' * y_contaminated;

% Step 2: Calculate residuals
y_pred_initial = X * beta_initial;
residuals = y_contaminated - y_pred_initial;

% Step 3: Compute 'h', 4 times the standard deviation of absolute residuals
h = 4 * std(abs(residuals));

% Step 4: Calculate the weights using the new formula
weights = 1 ./ (1 + (h * abs(residuals)));

% Form the diagonal weight matrix
W = diag(weights);

% Step 5: Perform the weighted least squares fit
X_weighted = W * X;
y_weighted = W * y_contaminated;

% Step 6: Refit using weighted least squares
beta_weighted = (X_weighted' * X_weighted) \ X_weighted' * y_weighted;

% Display the final beta coefficients
ans = beta_weighted(5)

% Calculate the weighted predictions
y_pred_weighted = X * beta_weighted;

% Calculate the residuals for the weighted fit
residuals_weighted = y_contaminated - y_pred_weighted;

% Compute the weighted total sum of squares (SST)
y_weighted_mean = sum(weights .* y_contaminated) / sum(weights);
SST_weighted = sum(weights .* (y_contaminated - y_weighted_mean).^2);

% Compute the weighted residual sum of squares (SSR)
SSR_weighted = sum(weights .* (residuals_weighted).^2);

% Compute the weighted R^2
R_squared_weighted = 1 - (SSR_weighted / SST_weighted)