clear all;
clc;

N = 1e5;
exp = randi(6,2,N);
for i = 1:N
    res(i) = exp(1,i) + exp(2,i) == 9;
    par(i) = rem(exp(2,i),2)==1;
    igual5(i) = exp(1,i)==5 | exp(2,i)==5;
    nao1(i) = exp(1,i)~=1 & exp(2,i)~=1;
end
prob_A = sum(res)/N
prob_B = sum(par)/N
prob_C = sum(igual5)/N
prob_D = sum(nao1)/N

pA_t = 4/36;
pB_t = 1/2;
pApB = pA_t*pB_t
%AB: 36,54 -2 casos
pAB = 2/36

%C:15,25,35,45,55,65,52,53,54,56- 11 casos
pC_t = 11/36;
pD_t = 5*5/36;
pCpD = pC_t*pD_t

%CD: 9- cases
pCD = 9/36