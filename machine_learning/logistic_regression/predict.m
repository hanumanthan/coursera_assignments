function p = predict(theta, X)
%   p = PREDICT(theta, X) computes the predictions for X using a 
%   threshold at 0.5 (i.e., if sigmoid(theta'*x) >= 0.5, predict 1)

m = size(X, 1);

p = zeros(m, 1);

for i = 1 : m
	if (sigmoid(X(i,:) * theta) >= 0.5)
		p(i) = 1;
	else
		p(i) = 0;	
	end
end

end
