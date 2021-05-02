u_data=load('u.data'); 
u= u_data(1:end,1:2); 
clear udata;
fid = fopen ('u_item.txt','rt');
datacell = textscan(fid,'%s%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f','delimiter','\t');
fclose(fid);
save 'datacell.mat' datacell
users = unique(u(:,1));
Nu = length(users); 

generos = ["unknown","Action","Adventure","Animation","Children’s","Comedy","Crime","Documentary","Drama","Fantasy","Film-Noir","Horror","Musical","Mystery","Romance","Sci-Fi","Thriller","War","Western"];

save 'generos.mat' generos


Set= cell(Nu,1);
for n = 1:Nu 
ind = find(u(:,1) == users(n));

Set{n} = [Set{n} u(ind,2)];
end
save 'Set.mat' Set

% para a opção 2
K = 50;
MinHashValue = inf(Nu,K);
w = waitbar(0,'Valores MinHash - Utilizadores');
for i = 1:Nu
    waitbar(i/Nu,w);
    movies = Set{i};
    for j= 1:length(movies)
        hash = zeros(1,K);
        key = char(movies(j));
        for kk = 1:K
            key = [key num2str(kk)];
            hash(kk) = DJB31MA(key,127);
        end
        MinHashValue(i,:) = min([MinHashValue(i,:);hash]);
    end
end
delete(w)
save 'MinHash.mat' MinHashValue

% parte para a opção 3
films = cell(1,length(datacell));
for i = 1:length(datacell)
   films{i} = datacell{i,1} ;
end

for i = 1:length(datacell)
   sh{i} = shingles(films{i},3);
end

 
 
Nf = length(films);
minHashInput = inf(length(sh),K);
w = waitbar(0,'Valores MinHash - Filmes');
for i = 1:length(datacell) 
   waitbar(i/length(datacell),w);
   for j = 1:length(sh{i})
       hash = zeros(1,K);
       key = char(sh{i}(j));
       for kk = 1:K
           key = [key num2str(kk)];
           hash(kk) = DJB31MA(key,127);
       end
   end
   minHashInput(i,:) = min([minHashInput(i,:);hash]);
   
end
delete(w)
save 'MinHash2.mat' minHashInput;
save 'shingles.mat' sh;

function s = shingles(txt, shingle_size)
  s = cell(1,length(txt)-shingle_size+1);
  for i = 1:(length(txt)-shingle_size+1)
      s{i} = txt(i:i+(shingle_size-1));
  end
end