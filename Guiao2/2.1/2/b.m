clear all;
clc;

N = 1e5;
n = 20;
m = 100;
A = randi(m,n,N);

for i=1:N
    res(i)=length(unique(A(:,i)))<n; 
end
prob_b = sum(res)/N