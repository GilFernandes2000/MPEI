

T =[0.7 0.2 0.3
    0.2 0.3 0.3
    0.1 0.5 0.4];


state_day1 = [1;0;0];
state_day2 = T*state_day1;

initial_state_day2 = [1;0;0];
state_day3 = T*initial_state_day2;

fprintf('Probabilidade do segundo e terceiro dia ser sol: %f\n',state_day1(1)*state_day2(1)*state_day3(1));

  
%---------------------------------------------------------------

state_day1 = [1;0;0];
state_day2 = T*state_day1;

initial_state_day2 = state_day2;
initial_state_day2(3) = 0;
initial_state_day2 = initial_state_day2/sum(initial_state_day2);
state_day3 = T*initial_state_day2;

fprintf('Nao chove no segundo nem no terceiro dia: %f\n',state_day1(1)*(state_day2(1)+state_day2(2))*(state_day3(1)+state_day3(2)));

%--------------------------------------------------------

v = [1;0;0];

sol = zeros(1,31);
nuvens = zeros(1,31);
chuva = zeros(1,31);

sol(1) = 1;
nuvens(1) = 0;
chuva(1) = 0;


for i= 2:31
    v = T*v;
    sol(i) = v(1);
    nuvens(i) = v(2);
    chuva(i) = v(3);
end

SolM = sum(sol);
NuvensM = sum(nuvens);
ChuvaM = sum(chuva);

fprintf('Começa Sol:\nMedia de sol: %.8f\nMedia de nuvens: %.8f\nMedia de chuva: %.8f\n',SolM,NuvensM,ChuvaM);



%--------------------------------------------------------------

v = [0;0;1];

sol = zeros(1,31);
nuvens = zeros(1,31);
chuva = zeros(1,31);

sol(1) = 0;
nuvens(1) = 0;
chuva(1) = 1;


for i= 2:31
    v = T*v;
    sol(i) = v(1);
    nuvens(i) = v(2);
    chuva(i) = v(3);
end

SolM = sum(sol);
NuvensM = sum(nuvens);
ChuvaM = sum(chuva);

fprintf('\nComeça Chuva:\nMedia de sol: %.8f\nMedia de nuvens: %.8f\nMedia de chuva: %.8f\n',SolM,NuvensM,ChuvaM);


%--------------------------------------------------------------

v = [1;0;0];

sol = zeros(1,31);
nuvens = zeros(1,31);
chuva = zeros(1,31);

sol(1) = 1*0.1;
nuvens(1) = 0;
chuva(1) = 0;


for i= 2:31
    v = T*v;
    sol(i) = v(1)*0.1;
    nuvens(i) = v(2)*0.3;
    chuva(i) = v(3)*0.5;
end

reuSol = sum(sol);
reuNuvens = sum(nuvens);
reuChuva = sum(chuva);

fprintf('(Sol)Numero de dias com dor: %.8f(Sol) + %.8f(Nuvens) + %.8f(Chuva) = %.8f\n', reuSol,reuNuvens,reuChuva,reuSol+reuNuvens+reuChuva);

%-----------------------------------------------------------------------------------

v = [0;0;1];

sol = zeros(1,31);
nuvens = zeros(1,31);
chuva = zeros(1,31);

sol(1) = 0;
nuvens(1) = 0;
chuva(1) = 1*0.5;


for i= 2:31
    v = T*v;
    sol(i) = v(1)*0.1;
    nuvens(i) = v(2)*0.3;
    chuva(i) = v(3)*0.5;
end

reuSol = sum(sol);
reuNuvens = sum(nuvens);
reuChuva = sum(chuva);

fprintf('(Chuva)Numero de dias com dor: %.8f(Sol) + %.8f(Nuvens) + %.8f(Chuva) = %.8f\n', reuSol,reuNuvens,reuChuva,reuSol+reuNuvens+reuChuva);
