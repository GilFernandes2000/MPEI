experiencias = rand(5,1000);
pecas = experiencias > 0.3;
resultados = sum(pecas);
sucessos = resultados <=2;
probSimulacao = sum(sucessos)/1000