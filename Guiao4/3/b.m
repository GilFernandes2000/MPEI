clear all;
clc;
udata = load('u.data');
u = udata(1:end,1:2);
clear udata;

users = unique(u(:,1));
Nu = length(users);

Set = cell(Nu,1);
for n = 1:Nu
    encon = find(u(:,1) == users(n));
    Set{n} = [Set{n} u(encon,2)];
end
%% 2
K = 50;
tic
MinHashValue = inf(Nu,K);
w = waitbar(0,'Calculating');
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
fprintf('Computing MinHashs = %f\n',toc);
tic
J = zeros(Nu);
h = waitbar(0,'Calculating');
for n1 = 1:Nu
    waitbar(n1/Nu,h);
    for n2 = n1+1:Nu
%          I = intersect(Set{n1},Set{n2});
%          U = union(Set{n1},Set{n2});
%          J(n1,n2) = 1- length(I)/length(U);
        J(n1,n2) = sum(MinHashValue(n1,:) ~= MinHashValue(n2,:))/K;
    end
end
delete(h)
save 'data.mat' J
fprintf('Computing approximate Jaccard distance: %f',toc);

tic
threshold = 0.4;
SimilarUsers = zeros(1,3);
k = 1;
for n1 = 1:Nu
    for n2 = n1+1:Nu
        if J(n1,n2) <= threshold
            SimilarUsers(k,:) = [users(n1) users(n2) J(n1,n2)];
            k = k+1;
        end
    end
end
fprintf('Computing Jaccard distance: %f\n',toc);
SimilarUsers