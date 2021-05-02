experiencias = rand(2,1000);
serfilho = experiencias > 0.5;
resultados = sum(serfilho);
pm1filho = resultados >=1;
probSimulacao = sum(pm1filho)/1000

%o valor teorico para este problema é 3/4 = 0,75
%dando a simulaçao valores (arredondados) mt proximos pode-se dizer que a
%simulacao esta certa por assim dizer