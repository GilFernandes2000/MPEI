clear all;
n= 5;
N= 1000;
p = 0.3;
for k = 0:n
    resultado(k+1) = nchoosek(n,k)*p^k*(1-p)^(n-k)
end
stem(0:n,resultado)