function roots = quadformula(a,b,c)
D = b^2 -4*a*c; %claculating discriminent
if a==0 
    if b~=0
        roots =-c/b;
        disp("when a=0, there is only one root: " + roots);
        count =1; %count is used to count number of roots
    else 
        roots=[];
        disp("when a=0,b=0, there is no root ");
        count = 0;
    end
elseif D > 0
    if b<0
        root1 = (-b +sqrt(D)) / (2*a);
        root2 = (-2*c)/(b-sqrt(D));  %using alternate formula to avoid cancellation error
    else
        root1 =(-2*c)/(b+sqrt(D));  %using alternate formula to avoid cancellation error
        root2 = (-b -sqrt(D)) / (2*a);
    end
    roots = [min(root1,root2), max(root1,root2)];%stroing small root first
    disp("The equation has two roots : " );
    disp(roots);
    count =2;
elseif D==0
    roots = -b/(2*a);
    disp("The equation has one root : "+ roots);
    count =1;
elseif D<0
    roots=[];
    disp("The equation has no real roots: "+ roots);
    count =0;
end
if isempty(roots)
     x = linspace(-20,20); %choosing suitable interval depending on root values
elseif(count == 1)
    if roots(1)==-Inf
        x = linspace(-20,20);
    elseif roots(1)== Inf
        x = linspace(-20,20);
    else
        x = linspace(roots(1)-20,roots(1)+20);
    end
elseif (count == 2)
    if (roots(1)== -Inf) && (roots(2)== Inf)
        x = linspace(-20,20);
    elseif (roots(1)== -Inf) && (roots(2) ~= Inf)
         x = linspace(roots(2)-20,roots(2)+20);
    elseif (roots(1)~= -Inf) && (roots(2) == Inf)
         x = linspace(roots(1)-20,roots(1)+20);
    else
        x = linspace(min(roots)-20, max(roots)+20);
    end
end
plot(x, a*(x.^2) + b*x + c,'LineWidth',2);
legend('function');
hold on;
if ~isempty(roots) %check if there are no roots
    plot(roots,0,'sk','LineWidth',1,'DisplayName','root');
end
xlabel("x-axis");
ylabel("y-axis");
title("plotting: y =" + a+"x^2 + " +b+"x + "+c);
hold off;
grid on;
end