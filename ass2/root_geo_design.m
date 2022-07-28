function  root_geo_design()
w=28;h=25;b=3.5;
% part a:
fprintf("part a :\n");
left_lim = rad2deg(-pi);
right_lim = rad2deg(pi);
theta=linspace(left_lim,right_lim);
f = @(theta)  w*sind(theta) - h*cosd(theta)-b;
plot(theta,f(theta));
grid on;
xlabel("x-axis");
ylabel("y-axis");
title("Approximation of theta");
disp("approximate roots are (found by zooming in the graph) = -143.5899, 47.11319.");
fprintf("Number of roots = 2\n\n");
%part b)
fprintf("part b:\n");
[bisect_root, niter_bisect] = bisect2( '28*sin(theta) - 25*cos(theta)-3.5', [0,pi/2],0.017453);
bisect_root = rad2deg(bisect_root);
fprintf('root by BISECTION method = %f, Number of iterations in bisect method = %d\n', bisect_root, niter_bisect);
[fixed_root, niter_fixed] = fixedpt( 'asin((25*cos(theta)+3.5)/28)' , [-pi,pi] , 0.017453);
fixed_root = rad2deg(fixed_root);
fprintf('root by FIXED method = %f,',  fixed_root);
fprintf('Number of iterations in fixed method = %d\n',niter_fixed);
[newton_root, niter_newton] = newton( '28*sin(theta) - 25*cos(theta)-3.5', '28*cos(theta)+25*sin(theta)', 0 , 0.017453);
newton_root = rad2deg(newton_root);
fprintf('root by NEWTON method = %f, Number of iterations in newton method = %d\n\n', newton_root, niter_newton);
%part c)
fprintf("part c: \n");
thetaStar = acos((-b*h + sqrt((b^2*h^2) + (h^2+w^2)*(w^2-b^2) ))/(h^2 + w^2));
thetaStar = rad2deg(thetaStar);
fprintf("EXACT root : %f \n\n",thetaStar);
fprintf("part d: \n");
%part d)
%values of exact d1 and d2
exact_d2 =  h/(2*sind(thetaStar));
exact_alpha = rad2deg(pi/2) - thetaStar;
exact_d1 = exact_d2 - (b/tand(exact_alpha)) - (b/tand(thetaStar));
fprintf("Using exact value of theta: d1 = %f, d2 = %f\n\n ",exact_d1,exact_d2);
%values of d1 and d2 by newton method
d2 = h/(2*sind(newton_root));
%b2 = w - 2*d2*cosd(newton_root);
alpha = rad2deg(pi/2) - newton_root;
d1 = d2 - (b/tand(alpha)) - (b/tand(newton_root));
fprintf("Using APPROXIMATED value of theta: d1 = %f, d2 = %f\n\n ",d1,d2);
%claculating relative error to compute accuracy
re_d1 = abs((exact_d1 - d1)/exact_d1);
re_d2 = abs((exact_d2 - d2)/exact_d1);
fprintf("relative error in d1: %f\nrelative error in d2: %f\n",re_d1,re_d2);
end
