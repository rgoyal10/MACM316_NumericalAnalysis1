function ca5()
nlist = [20,50,100,500];
%nlist = [10];
for n = nlist
fprintf("For n = %d\n",n);
e = ones(n,1);
Asparse = spdiags([e -4*e 6*e -4*e e],-2:2,n,n);
Asparse(1,1)= 9; Asparse(n,n-1) = -2; Asparse(n-1,n)=-2; Asparse(n-1,n-1)=5; Asparse(n,n)=1;
F = 0.4; L=  1.5; bi = F* (L/n)^4;
b = bi * ones(n,1); %fprintf("%d ",b);

%Part A)
%part I)
tic
x_asparse = Asparse \ b;
x_cost = toc;
x_norm = norm(x_asparse,2);
fprintf("Part A:\n\tPart I: cost = %d, norm = %d\n",x_cost , x_norm); %fprintf("x =  %d \n",x);

%part II)
Adense = full(Asparse);
tic
x_dense = Adense \ b;
x_dense_cost = toc;
x_dense_norm = norm(x_dense,2);
fprintf("\tPart II: cost = %d, norm = %d\n",x_dense_cost, x_dense_norm);%fprintf("x =  %d \n",x_dense);

%part III)
z0 = ones(n,1);
tic
x_gs2=gs2(Asparse,b,z0,1e-8,1e5);
x_gs2_cost = toc;
x_gs2_norm= norm(x_gs2,2);
fprintf("\tPart III: cost = %d, norm = %d\n",x_gs2_cost, x_gs2_norm); %fprintf("x =  %d \n",x_gs2);

%Part b)
U = spdiags([e -2*e e],0:2,n,n);
U(1,1) = 2;
U_transpose = U.';
tic
x_double_back = (U_transpose\(U\b));
x_double_bs_cost = toc;
x_double_bs_norm = norm(x_double_back,2);
fprintf("Part B: cost = %d, norm = %d\n",x_double_bs_cost, x_double_bs_norm); %fprintf("x =  %d \n",x_double_back);

%Part c)
U_gs2  = triu(Asparse, 1);  % upper triangular part of A
DpL= Asparse - U_gs2;       % =D+L
T  = -DpL \ U_gs2;    % iteration matrix
condest_Asparse = condest(Asparse);
condest_U = condest(U);
spectral_radiusT = max(abs(eig(full(T))));
fprintf("PART C: condition number of A = %d, condition no. of U = %d, spectral radius = %d\n",condest_Asparse,condest_U,spectral_radiusT);

%Part d)
x = 1:1:n;
plot(x,x_double_back,"LineWidth",1);
xlabel("x");ylabel("z(x)"); title("Plot of Deflection");

bending_stiffness = (F * (L)^4)/(6*max(x_double_back));
fprintf("Bending stiffnes = %d\n\n",bending_stiffness);
end

end