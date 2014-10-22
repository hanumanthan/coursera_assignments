function [J, grad] = costFunctionReg(theta, X, y, lambda)

	m = length(y);

	J = 0;
	grad = zeros(size(theta));

	prediction = sigmoid(X * theta);

	J = (sum((y.*log(prediction) + (1-y).*log(1-prediction))*-1))*(1/m) + (lambda/(2 * m))*(sum(theta(2:end).^2));

	grad(1) = (sum((prediction - y).*X(:,1)))*(1/m);
	
	for i = 2 : numel(grad)
		grad(i) = (sum((prediction - y).*X(:,i)))*(1/m) +(lambda / m)*(theta(i));
	end


end
