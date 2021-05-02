experiencias = rand(2,1000);
serfilho = experiencias > 0.5;
a = sum(serfilho) == 2;
b = serfilho(1,:);
prob_d= sum(a&b)/sum(b)

%(1,:) tirar a primeira linha(1) e todas as colunas(:), ou seja estamos a
%pedir ao programa para nos dar a primeria linha.