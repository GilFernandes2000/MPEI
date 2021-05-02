experiencias = rand(3,1000);
lancamentos = experiencias > 0.5;
resultado = sum(lancamentos);
sucesso = resultado==2;
probSimulacao = sum(sucesso)/1000