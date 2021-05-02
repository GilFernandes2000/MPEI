
T = [0.8  0  0.3  0  0
     0.2 0.6 0.2  0  0
      0  0.1 0.4  0  0
      0  0.3  0   1  0
      0   0  0.1  0  1];
  

  
  
  v = [1;0;0;0;0];
  
  for n = 1:100
     v = T*v;
     prob(n) = v(2);
  end
  figure(1);
  plot(prob)
  axis([0 100 0 0.35]);
  grid on
  
  
  %---------------------------------------------------------
  
    v = [1;0;0;0;0];
  
  for n = 1:100
     v = T*v;
     prob(n) = v(4);
     prob2(n) = v(5);
  end
  figure(2);
  subplot(1,2,1);
  plot(prob)
  subplot(1,2,2);
  plot(prob2)
  grid on
  
  %-------------------------------------------------------------
  
  Q = T(1:3,1:3);
  
  F = inv(eye(3)-Q);
   
  %--------------------------------------------------------------------
  
  Media = sum(F);
  Media(1) %começar no estado 1
  Media(2) %começar no estado 2
  Media(3) %começar no estado 4
  %---------------------------------------------------------------------------
  
    R = T(4:5,1:3);
    B = R*F;
    fprintf('Prob(state3) = %f, Prob(state5) = %f\n', B(1,1), B(2,1));
 
  
  
  