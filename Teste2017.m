%teste pratico de 2017

%% EX 1

%a)
%erro 0     1    2
T = [0.9   0.6  0.6
     0.09  0.4  0.4
     0.01  0.1  0.1]
 
v = [0;0;1]

%b)

u = T^4*v;

fprintf("0 erros: %2.2f\n",u(1));
fprintf("1 erro: %2.2f\n",u(2));
fprintf("2 ou mais erros: %2.2f\n",u(3));

%c)


%% Ex 2

%a)

N = ones(5,5)*1/5

%     C   D   E   F   G
H = [ 0   1/2 1/3 1/4 0
      1/2 0   0   1/4 1/2
      1/2 1/2 1/3 1/4 0
      0   0   1/3 0   1/2
      0   0   0   1/4 0]
  
B = 0.8

A = B*H + (1-B)*N

%b)

v = [1/5;1/5;1/5;1/5;1/5]

u = A^10*v

fprintf("c: %2.2f\n",u(1));
fprintf("D: %2.2f\n",u(2));
fprintf("E: %2.2f\n",u(3));
fprintf("F: %2.2f\n",u(4));
fprintf("G: %2.2f\n",u(5));

%% EXERCÍCIO 1
% Considere um processo aleatório que gera dois números: o primeiro número
% de 1 a 4 (com todos os valores igualmente prováveis) e o segundo número
% de 5 a 8 (com todos os valores também igualmente prováveis).
% Seja X a variável aleatória que representa o segundo número menos o
% primeiro número.
% (a) (3.0 valores) Estime por simulação (usando 10000 simulações) a função
%     massa de probabilidade da variável aleatória X e apresente-a num
%     gráfico do tipo stem.

N = 1e4;
PNum = randi([1,4],1,N);
SNum = randi([5,8],1,N);

for i = 1:N
    sub(i) = SNum(i) - PNum(i);
end

X = [1:7];
for i = 1:7
    p(i)=sum(i==sub)/N;
end

stem(X,p(1:7));
% (b) (2.0 valores) Com base na função massa de probabilidade estimada,
%     estime o valor esperado, a variância e o desvio padrão da variável
%     aleatória X.
E = X*p(1:7)'

var = ((X-E).^2)*p(1:7)'

dp = sqrt(var)

% (c) (2.0 valores) Determine o valor teórico da probabilidade de X ser
%     menor que 2, sabendo que o segundo número é 5.

a = 1/4
b= 1/4
P = (a&b)/b;