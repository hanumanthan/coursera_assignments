function [J, grad] = costFunction(theta, X, y)

	m = length(y);
	J = 0;
	grad = zeros(size(theta));

	prediction = sigmoid(X * theta);

	J = (sum((y.*log(prediction) + (1-y).*log(1-prediction))*-1))*(1/m);

	for i = 1 : numel(grad)
		grad(i) = (sum((prediction - y).*X(:,i)))*(1/m);
	end
end
