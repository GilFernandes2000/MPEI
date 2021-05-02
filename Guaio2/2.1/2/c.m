clear all;
clc;

N = 1e5;
n = 20;
m = 100;
ns = 10:10:100;
count = 0;
for n = ns
    A = randi(m,n,N);
    for i=1:N
        res(i)=length(unique(A(:,i)))==n; 
    end
    count = count +1;
    prob(count) = sum(res)/N;
end
figure(1)
subplot(1,2,1)
plot(ns,prob)
