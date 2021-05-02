N = 1e5;
alpha = ['a':'z' 'A':'Z'];
tic
keys = generator(N,6,20,alpha);
fprintf('Nº keys: %d\n',length(keys));
fprintf('Nº unique: %d\n',length(unique(keys)));
fprintf('Running time: %f seconds\n',toc);
save 'keys' 'keys'