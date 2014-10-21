function J = computeCostMulti(X, y, theta)
m = length(y); 

J = 0;

prediction =X * theta;

J = (sum((prediction - y).^2))/(2*m)

end
