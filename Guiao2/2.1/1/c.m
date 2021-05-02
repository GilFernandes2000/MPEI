experiencias = rand(2,1000);
serfilho = experiencias > 0.5;
a = sum(serfilho) == 2;
b = sum(serfilho) >=1;
prob_1c= sum(a&b)/sum(b)

%P(a|b) = P(a&b) / p(b)