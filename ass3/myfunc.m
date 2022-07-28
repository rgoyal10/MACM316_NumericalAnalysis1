%Part a
function myfunc()
x=-2:0.01:3;
y = (((1-x).*(3+x).^(1/3))./ (x.* ((4-x).^ (1/2))))-3.06;
plot(x,y); title("Plotting the equation");xlabel("x-axis");ylabel("y-axis");
grid on;

%Part b:
str_y = '(((1-x).*(3+x).^(1/3))./ (x.* (4-x).^ (1/2)))-3.06';
str_z = '(((1/3).*(1-x).*(3+x).^(-2/3) - ((3+x).^(1/3)) - ((4-x).^(1/2)) + ((1/2).*x.*(4-x).^(-1/2)))./(x.^2.*(4-x)))';
[bisect_root, biter] = bisect2( str_y, [0.1,1.0] );
fprintf("bisection root = %f, niter = %f\n",bisect_root,biter);
[newton_root, niter] = newton( str_y, str_z, 1 );
fprintf("newton root = %f, niter = %f\n ",newton_root,niter);
end