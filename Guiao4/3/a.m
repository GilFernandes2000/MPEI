load keys
NKeys = length(keys);
Ntable = 5e5;
codes = zeros(1,NKeys);
table = zeros(1,Ntable);
collisions = 0;
tic
for i = 1:NKeys
%     hash = string2hash(keys{i});
%     hash = mod(hash,Ntable)+1;
%     hash = string2hash(keys{i},'sdbm');
%     hash = mod(hash,Ntable)+1;
%     hash = hashstring(keys{i},Ntable) + 1;
    hash = DJB31MA(keys{i},127);
    hash = mod(hash,Ntable) + 1;
    codes(i) = hash;
    if table(hash)>0
        collisions = collisions+1;
    end
    table(hash) = table(hash)+1;
end
time = toc;
histogram(codes,100)
h = codes/Ntable;
fprintf('Moment 2: measured - %f theoretical - %f\n',mean(h.^2),1/(2+1));
fprintf('Moment 2: measured - %f theoretical - %f\n',mean(h.^5),1/(5+1));
fprintf('Moment 2: measured - %f theoretical - %f\n',mean(h.^10),1/(10+1));
fprintf('No. of collisions = %d\n',collisions);
fprintf('Max number of attributions = %d\n',max(table));
fprintf('Running time = %f\n', time);