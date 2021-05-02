

N = 1e5;
n = 1;
p = 0;
while p<0.5
    n = n+1
    exp = randi(365,n,N);
    res = true(1,N);
    for i = 1:N
        res(i) = length(unique(exp(:,i))) < n;
    end
    p = sum(res)/N;
end
n
