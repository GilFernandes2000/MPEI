clear all;
clc;
load keys
NKeys = length(keys);
Ntable = 5e5;
codes = zeros(1,NKeys);
table = zeros(1,Ntable);
collisions = 0;
tic
for i = 1:NKeys
    hash = string2hash(keys{i});
    hash = mod(hash,Ntable)+1;
    codes(i) = hash;
    if table(hash)>0
        collisions = collisions+1;
    end
    table(hash) = table(hash)+1;
end
time = toc
collisions