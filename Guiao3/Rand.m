
clear all;
clc;

n=20;
matriz = rand(n);

for i=1:n
    matriz = matriz./sum(matriz(:,n));%'./' faz divisao elemento a elemento, '(:,n)' é
    %as linhas todas da coluna n
end
%Para matriz ser ectótástica tem de a cada coluna o valor a soma das
%probabilidades tem de dar 1 e todas as entradas são não negativas
%3 a)
for i=1:n
    for z=1:n
       if (matriz(z,i)) < 0
           fprintf("Matriz não ectótástica\n");
           return
       end
    end
    if sum(matriz(:,n))<0.99%Se fosse ==1 daria as vezes outras vezes não por defeito
        fprintf("Matriz não ectótástica\n");
        return
    end
end
fprintf("A Matriz é ectótástica\n");