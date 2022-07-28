function macm316ca4SampleCode()
format long
% Part (a): Set up Hilbert matrices and plot its norm and condition number.
nlist = [2:30]; cond2H = []; norm1H =[]; norm2H =[]; cond1H =[];
for n = nlist
  Hn = hilb(n);
  cond2H = [cond2H, cond(Hn,2)];
  norm1H = [norm1H, norm(Hn,1)];
  norm2H = [norm2H,norm(Hn,2)];
  cond1H = [cond1H, cond(Hn,1)];
end
% ADD CODE TO PLOT CONDITION NUMBERS AND NORMS VERSUS n
semilogy(nlist,norm1H,'c','LineWidth',1);
legend('norm 1');hold on;
semilogy(nlist,norm2H,'r','DisplayName','norm 2','LineWidth',1);
semilogy(nlist,cond1H,'g','DisplayName','cond 1','LineWidth',1);
semilogy(nlist,cond2H,'b','DisplayName','cond 2','LineWidth',1);
xlabel("n");ylabel("log(y)");title("Norms, Condition numbers and Big O");grid on; hold off;
% Part (b): ADD THE THEORETICALLY EXPECTED GROWTH TO YOUR PLOT
z = (((1+ sqrt(2)).^(4.*nlist))./(sqrt(nlist)));
hold on ; semilogy(nlist,z,'m','LineWidth',1,'DisplayName','big O'); hold off;
% Part (c): Compare performance for the ill-conditioned linear system using: PLU decomposition, backslash, and Jacobi iteration.
PLUerror = []; bs_error = []; J_error = []; PLU_time = []; bs_time = []; J_time = [];
klist = [2 : 30]; % min/max matrix size
for k = klist, 
  Hk = hilb(k);  % generate Hilbert matrix
  x = ones(k,1); % exact solution (all 1's)
  b = Hk * x;    % compute RHS for this x
  % Compute the solution using 3 different methods:
  tic
  [L, U, P] = lu(Hk);       
  xPLU = U \ (L \ (P*b)); % solution from PLU-decomposition
  PLU_time = [PLU_time,toc];
  tic
  xBackslash = Hk \ b;
  bs_time = [bs_time, toc]; 
  tic
  [xJacobi,niter] = jacobi2(Hk,b,rand(k,1),1e-4,210);
  J_time = [J_time, toc]; 
  PLUerror = [PLUerror, norm(xPLU-x,2)];
  bs_error =[ bs_error, norm(xBackslash - x,2)];
  J_error = [J_error , norm(xJacobi - x,2),];
end
% Plot solution errors ADD CURVES FOR '\' AND JACOBI TO THIS PLOT
semilogy(klist, PLUerror, 'r','LineWidth',1);
legend ('PLU error');hold on;
semilogy(klist, bs_error, 'b','LineWidth',1,'DisplayName','Back Slash error');
semilogy(klist, J_error, 'g','LineWidth',1,'DisplayName','Jacobi error');
xlabel("n");ylabel("log(y)");title("Absolute error in solution");grid on;
hold off;
%plotting time
semilogy(klist, PLU_time, 'r','LineWidth',1);
legend ('PLU time');hold on;
semilogy(klist, bs_time, 'b','LineWidth',1,'DisplayName','Back Slash time');
semilogy(klist, J_time, 'g','LineWidth',1,'DisplayName','Jacobi time');
xlabel("n");ylabel("log(y)");title("Cost of methods");grid on;
hold off;
% Part (d):
max_entry = [];
for n = klist
    Hk = hilb(n);
    hInverse = inv(Hk);
    M = Hk * hInverse;
    M = abs(M);
    max_entry  =[ max_entry,max(max(M))];
end
plot(klist,max_entry,'b');
xlabel("n");ylabel("y");title("Maximum absolute(matrix * inverse)");grid on; legend ('maximum entry of M');
end

