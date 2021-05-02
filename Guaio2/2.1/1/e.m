experiencias = rand(5,1000);
serfilho = experiencias > 0.5;
a = sum(serfilho) == 2;
b = sum(serfilho) >= 1;
prob_e= sum(a&b)/sum(b)