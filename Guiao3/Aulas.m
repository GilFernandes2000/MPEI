%1 going to the class
%2 not goinng to the class

T = [0.7 0.8
     0.3 0.2];
v = [1;0];
u = T^2*v;
%fprintf('1a) Response = %f\n',u(1));
fprintf('1a) Response = %2.2f%%\n',u(1)*100);



v = [0;1];
u = T^2*v;
%fprintf('1b) Response = %f\n',u(1));
fprintf('1b) Response = %2.2f%%\n',u(1)*100);


v = [1;0];
u = T^(30-1)*v;
fprintf('1c) Response = %2.2f%%\n',u(1)*100);


v = [0.85; 0.15];
resp = zeros(1,30);
resp(1) = v(2);
for i=2:30
    v = T*v;
    resp(i) = v(2);
end
figure(1);
plot(resp,'*-');
grid on