N = 1e5;

fid = fopen('prob_pt.txt','r');
probsPt= textscan(fid,'%s');
fclose(fid);

alpha = ['a':'z' 'A':'Z'];
tic
kB = generator(N,6,20,alpha);
fprintf('Nº keys: %d\n',length(kB));
fprintf('Nº unique: %d\n',length(unique(kB)));
fprintf('Running time: %f seconds\n',toc);
save 'kB' 'kB'