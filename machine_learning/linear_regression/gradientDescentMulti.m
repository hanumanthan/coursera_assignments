function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

temp = zeros(size(X, 2), 1)

for iter = 1:num_iters
    prediction =X * theta;
    for i = 1: size(X,2)
        temp(i,:) = theta(i,:) - (alpha/m) * sum((prediction - y).*(X(:,i)));
    end
    theta = temp;
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
