
load 'Set.mat' 
load 'MinHash.mat' 
load 'datacell.mat'
load 'generos.mat'

Nu = length(Set);

prompt1='Id do Utilizador(1 to 943): ';
ID = input(prompt1);
fprintf('\n');
cont = 1;
while cont ~= 0
    
    fprintf('1 - Your Movies\n');
    fprintf('2 - Get Suggestions\n');
    fprintf('3 - Search Title\n');
    fprintf('4 - Exit\n');
    prompt2='Select choice: ';
    opcao = input(prompt2);
    fprintf('\n');

    if opcao == 1
       list = cell(1,length(Set{ID}));
       for i = 1:length(Set{ID})
          list{i} = datacell{Set{ID}(i),1};  
       end
       fprintf('%s \n',list{:});
       fprintf('\n');
       fprintf('\n');
    end


    if opcao == 2
        genID = 0;
       while genID == 0
           prompt3='Introduza o género: ';
           gen = input(prompt3,'s');

           for i = 2:length(generos)
               if(gen == generos(i-1))
                   genID = i-1;
               end
           end
       end
       K = 50;
       minValue = 1;
       d = zeros(1,length(Set));
       for i= 1:length(Set)
           if(i~=ID)
               d(i) = sum(MinHashValues(ID,:)~= MinHashValues(i,:))/K;
           else
               d(i) = 100;
           end
       end

       for i = 1:length(Set)
          if d(i) < minValue
            minValue = d(i);
            minUser = i;
          end 
       end

       minValue
       minUser

       C = setdiff(Set{minUser},Set{ID});

       count = 1;

       for i = 1:length(C)
           %coisa{i} = datacell{C(i),(genID+1)};
           if datacell{C(i),(genID+1)} == 1
               lista(count) = C(i);
               count = count + 1;
           end
       end
       n = length(lista);
       filmes = cell(1,n);
       if isempty(lista)
           fprintf('Não temos nenhum sugestão para o género pedido.');
       else
           for i = 1:length(lista)
               filmes{i} = char(datacell{lista(i)});
           end
       end
       genID = 0;
       filmes
        fprintf('\n');
        fprintf('\n');
    end
    
    if opcao == 3
        prompt4='Write a String: ';
        string = input(prompt4,'s');
        K = 50;

        string_shingle = shingles(string,2);
        minstring = inf(length(string_shingle),K);
        for j = 1:length(string_shingle)
            key = char(string_shingle(j));
            hash = zeros(1,K);
            for kk = 1:K
                key = [key num2str(kk)];
                hash(kk) = DJB31MA(key,127);
            end
            minstring(j,:) = min([minstring(j,:);hash]);
        end


       minstring

       %dist = sum(minstring(i,:) ~= minHashInput(i,:))/K;
       for i = 1:length(sh)
           dist = sum(minstrin1g ~= minHashInput(i,:))/K;
       end
       dist
        fprintf('\n');
        fprintf('\n');
    end
    
    if opcao == 4
        cont = 0;
        fprintf('Till next Time\n')
        fprintf('\n');
    end
end