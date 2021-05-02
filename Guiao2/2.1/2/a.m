clear all;
clc;

N = 1e5;
n = 20;
m = 100;
A = randi(m,n,N);

for i=1:N
    res(i)=length(unique(A(:,i)))==n; 
end

prob_a = sum(res)/N
%compara coluna a coluna a funcao (unique) que elimina quaiquer valores
%repetidos e a funcao (length) que conta o numero de valores.

%sendo que se o o valor de length for menor que 20 quer dizer que o mesmo
%numero saiu maus que uma vez

