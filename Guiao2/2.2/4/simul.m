clear all;
clc;

N = 1e5;
n = 5;
p = 0.3;
x = 0:5;

for i=x
    lancamentos = rand(n,N)>p;
    sucessos = sum(lancamentos)==i; 
    prob(i+1) = sum(sucessos)/N;
end
prob

figure(1)
stem(x,prob)

fprintf('Prob. de no maximo duas pecas serem defeituosas: %f\n',sum(prob(1:3)));