clear all;
clc;
p_andre = 20/100;
p_bruno = 30/100;
p_carlos = 50/100;

p_error_andre = 0.01;
p_error_bruno = 0.05;
p_error_carlos = 0.001;

p_erro = p_error_andre * p_andre + p_error_bruno * p_bruno + p_error_carlos * p_carlos;

p_carlos_error = p_error_carlos * p_carlos / p_erro
p_bruno_error = p_error_bruno * p_bruno / p_erro
p_andre_error = p_error_andre * p_andre / p_erro

N=1e7;
tic
exp = [rand(20,N) < 0.01; rand(30,N) <0.05; rand(50,N) < 0.001];

%P(A|B) = P(AB)/P(B)

countAB = 0;
countB = 0;
for i = 1:N
    aux = randi(100);
    if exp(aux,i) == true
        countB = countB + 1;
        if aux>50
            countAB = countAB + 1;
        end
    end
end
p_carlos_error= countAB/countB
toc
tic
counterB = 0;
counterAB = 0;

for i=1:N
    aux = randi(100);
    if aux <= 20
        b = rand()<0.01;
    elseif aux <= 50
        b = rand()<0.05;
    else
        b = rand()<0.001;
    end
    if exp(aux,i) == true
        countB = countB + 1;
        if aux>50
            countAB = countAB + 1;
        end
    end
end
p_carlos_error= countAB/countB
toc