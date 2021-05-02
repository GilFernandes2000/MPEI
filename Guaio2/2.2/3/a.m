clear all;
clc;

N = 1e5;
n = 4;
p = 0.5;
x = 0:4;

for i=1:length(x)
    lancamentos = rand(n,N)>p;
    sucessos = sum(lancamentos)==i-1; 
    prob(i) = sum(sucessos)/N;
end
prob

figure(1)
stem(x,prob)
axis([-1 5 0 0.4])
grid on

%b)
av = sum(x.*prob)

%VAR[X] = E[X^2] - (E[X])^2

var = sum(prob.*(x.^2)) - av^2

sd = sqrt(var) % ou sd = va^(1/2)

%c) distribuicao biomial
%d)
for i=x
    prob(i+1) = nchoosek(4,i)*(0.5^i)*(0.5^(4-i));
end
figure(2)
stem(x,prob)
axis([-1 5 0 0.4])
grid on

%e)
av = sum(x.*prob)
var = sum(prob.*(x.^2)) - av^2
sd = sqrt(var) % ou sd = va^(1/2)

%f)
%i)
fprintf('Prob. of 2 or more tails: %f\n',sum(prob(3:5)));

%ii)
fprintf('Prob. of at most 1 tail: %f\n',sum(prob(1:2)));

%iii)
fprintf('Prob. of tails between 1 and 3: %f\n', sum(prob(2:4)));