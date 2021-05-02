clear all;
n=40;
N= 1000;
for k = 0:n
    resultado(k+1) = Probs(n, k , N);
end
stem(0:n,resultado)