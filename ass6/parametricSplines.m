function parametricSplines()
%Part a)
t = [0 1 2 3 4];
x = [0.0 1.0 2.0 2.0 3.0];
y = [0.0 3.0 3.0 4.0 5.0];
value_to_display = linspace(0,4,1000);

xt_spline = spline(t,x);
R = ppval(xt_spline,value_to_display);

yt_spline = spline(t,y);
S = ppval(yt_spline,value_to_display);

plot(x,y,'s',value_to_display,R,'LineWidth',1);
legend("real data","R(t)");
title("x = R(t)"); xlabel("t");ylabel("R(t) or x");grid on;

plot(x,y,'s',value_to_display,S,'LineWidth',1);
legend("real data","S(t)");
title("y = S(t)"); xlabel("t");ylabel("S(t) or y");grid on;

plot(x,y,'s',R,S,'LineWidth',1);
legend("real data","S(t) vs R(t)");
title("S(t) vs R(t)"); xlabel("R(t)");ylabel("S(t)");grid on;

%part b)
x2 = [2.75 1.3 -0.25 0.0 0.25 -1.3 -2.5 -1.3 0.25 0.0 -0.25 1.3 2.75];
y2 = [-1.0 -0.75 0.8 2.1 0.8 -0.25 0.0 0.25 -1.3 -2.5 -1.3 -0.25 -1.0];
t2 = [0 1 2 3 4 5 6 7 8 9 10 11 12];
value_to_display2 = linspace(0,12,5000);

xt2_spline = spline(t2,x2);
R2 = ppval(xt2_spline,value_to_display2);

yt2_spline = spline(t2,y2);
S2 = ppval(yt2_spline,value_to_display2);

plot(x2,y2,'s',R2,S2,'LineWidth',1);
legend("real data","R2 vs S2");
title("R2 vs S2"); xlabel("R2");ylabel("S2");grid on;

%part c)
[list1] = perspline(t2,x2);
[list2] = perspline(t2,y2);
[list3] = perspline(list1,list2);
hold on; plot(x2,y2,'s','LineWidth',1);legend('R2(t) vs S2(t)');hold off;

% %part d)
figure('position', get(0,'screensize')) % largest window possible
axes('position', [0 0 1 1])
axis square % make x,y-axes equal
%imshow('myimage.png') % display your drawing on-screen
[x,y] = ginput; % record mouse clicks until ’Enter’
close % get rid of huge window
save mydatafile.mat x y % save x,y data points to a file
t3 = linspace(0,1,length(x));
[list1] = perspline(t3,x');
[list2] = perspline(t3,y');
[list3] = perspline(list1,list2);
%load(mydatafile , 'x','y');
hold on; plot(x,y,'sb','LineWidth',1); legend("R2 vs S2"); hold off;

end