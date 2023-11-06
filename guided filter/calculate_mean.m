function output = calculate_mean(input, r)



% Get the size of the input image
[height, width] = size(input);

% Initialize the output image as a zero matrix of the same size as the input image
output = zeros(height, width);

% Compute the cumulative sum of the input image over the Y-axis
cumulativeSumY = cumsum(input, 1);
imDst = zeros(height,width);
% Compute the difference over the Y-axis to obtain the local average values for each row
for row = 1:height
    if row <= r+1
        % First r+1 rows of the output image
        output(row,:) = cumulativeSumY(2*r+1,:);
    elseif row >= height-r+1
        % Last r rows of the output image
        output(row,:) = cumulativeSumY(height,:) - cumulativeSumY(height-2*r-1,:);
    else
        % Middle rows of the output image
        output(row,:) = cumulativeSumY(row+r,:) - cumulativeSumY(row-r-1,:);
    end
end

% Compute the cumulative sum of the output image over the X-axis
cumulativeSumX = cumsum(input, 2);

% Compute the difference over the X-axis to obtain the local average values for each column
for col = 1:width
    if col <= r+1
        % First r+1 columns of the output image
        output(:,col) = cumulativeSumX(:,2*r+1);
    elseif col >= width-r+1
        % Last r columns of the output image
        output(:,col) = cumulativeSumX(:,width) - cumulativeSumX(:,width-2*r-1);
    else
        % Middle columns of the output image
        output(:,col) = cumulativeSumX(:,col+r) - cumulativeSumX(:,col-r-1);
    end
end

end
