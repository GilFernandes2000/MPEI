p = 0.4;
q = 0.6;


T = [p^2    0   0   q^2
    (1-p)^2 0   0 q*(1-q)
    p*(1-p) 0   0 q*(1-q)
    p*(1-p) 1   1 (1-q)^2];
     
v = [1;0;0;0];

u5 = T^5*v;
fprintf('5 iterations: p(A) = %.8f p(B) = %.8f p(C) = %.8f p(D) = %.8f\n',u5);
u10 = T^10*v;
fprintf('10 iterations: p(A) = %.8f p(B) = %.8f p(C) = %.8f p(D) = %.8f\n',u10);
u100 = T^100*v;
fprintf('100 iterations: p(A) = %.8f p(B) = %.8f p(C) = %.8f p(D) = %.8f\n',u100);
u200 = T^200*v;
fprintf('200 iterations: p(A) = %.8f p(B) = %.8f p(C) = %.8f p(D) = %.8f\n',u200);


M = [T-eye(4);ones(1,4)];
u = [zeros(4,1);1];
vf = M\u;
fprintf('limit probs: p(A) = %.8f p(B) = %.8f p(C) = %.8f p(D) = %.8f\n',vf);
    



