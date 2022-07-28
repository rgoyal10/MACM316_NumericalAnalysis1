function ass()
norm_1_vector = [];
norm_2_vector = [];
cond_1_vector = [];
cond_2_vector = [];

for i = 2:30
    H = hilb(i);
    norm_1 = norm(H);
    norm_1_vector = [norm_1_vector;norm_1];
    norm_2 = norm(H,2);
    norm_2_vector = [norm_2_vector;norm_2];
    cond_1 = cond(H);
    cond_1_vector = [cond_1_vector;cond_1];
    cond_2 = cond(H,2);
    cond_2_vector = [cond_2_vector;cond_2];
   
end
i = 2:1:30;
semilogy(i,norm_1_vector,i,norm_2_vector,i,cond_1_vector,i,cond_2_vector);

end