function q = selffilter(I, r, eps)


[hei, wid] = size(I);
N = calculate_mean(ones(hei, wid), r); 

mean_I = calculate_mean(I, r) ./ N;



mean_II = calculate_mean(I.*I, r) ./ N;
var_I = mean_II - mean_I .* mean_I;

a = var_I ./ (var_I + eps); 
b = mean_I - a .* mean_I; 

mean_a = calculate_mean(a, r) ./ N;
mean_b = calculate_mean(b, r) ./ N;

q = mean_a .* I + mean_b; 
end