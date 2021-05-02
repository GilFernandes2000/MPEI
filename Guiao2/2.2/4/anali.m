clear all;
clc;

N = 1e5;
n = 5;
p = 0.3;
x = 0:5;

for i=x
    prob(i+1) = nchoosek(n,i)*(0.3^i)*(0.3^(4-i));
end
prob
fprintf('Prob. de no maximo duas pecas serem defeituosas: %f\n',sum(prob(1:3)));