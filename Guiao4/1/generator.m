function keys = generator(N,imin,imax,alpha)
keys = {};
n = 0;
nAlpha = length(alpha)
while n<N
   tam = randi([imin imax]);
   if nargin == 4
       aux = randi(nAlpha,1,tam);
   else
       aux = zeros(1,tam)
       for i = 1:tam
           aux{i} = 1+sum(rand()>cumsum(prob));
       end
   end
   key = alpha(aux);
   if ~ismember(key,keys)
       n = n+1;
       keys{n} = key;
   end
end
end 