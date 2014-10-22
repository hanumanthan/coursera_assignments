function g = sigmoid(z)

g = zeros(size(z));
for i = 1:numel(z)
	g(i) = 1 / (1 + exp(-z(i)));
end	

end
