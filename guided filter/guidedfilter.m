function q = guidedfilter(I, p, r, eps)


% Get the size of the input images
[height, width] = size(I);

% Compute the size of each local patch
N = calculate_mean(ones(height, width), r);

% Compute the means of the intensities and guidance values in each local patch
mean_I = calculate_mean(I, r) ./ N;
mean_p = calculate_mean(p, r) ./ N;


% Compute the covariance of the intensities and guidance values in each local patch
cov_Ip = (calculate_mean(I .* p, r) ./ N) - mean_I .* mean_p;



% Compute the variance of the intensities in each local patch
var_I = (calculate_mean(I .* I, r) ./ N) - mean_I .* mean_I;

% Compute the parameters  in each local patch
a = cov_Ip ./ (var_I + eps); 
b = mean_p - a .* mean_I; 

% Compute the mean of the parameters in each local patch
mean_a = calculate_mean(a, r) ./ N;
mean_b = calculate_mean(b, r) ./ N;


q = mean_a .* I + mean_b;

end